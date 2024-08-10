import 'dart:math';

import 'package:bio_metrics/app/models/blood_pressure_data.dart';
import 'package:bio_metrics/app/models/data_point.dart';
import 'package:bio_metrics/app/models/data_type.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataLineChart extends ConsumerWidget {
  final DataType dataType;
  const DataLineChart({super.key, required this.dataType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);

    List<DataPoint> data = switch (dataType) {
      DataType.bloodPressure => appState.bloodPressureData.map((bpdata) {
          return DataPoint(
              dateTime: bpdata.dateTime,
              data: bpdata.systolicBloodPressure.toDouble());
        }).toList(),
      DataType.bloodSugar => appState.bloodSugarData.map((bsdata) {
          return DataPoint(
              dateTime: bsdata.dateTime, data: bsdata.bloodGlucose.toDouble());
        }).toList(),
      DataType.weight => appState.weightData.map((wdata) {
          return DataPoint(dateTime: wdata.dateTime, data: wdata.weight);
        }).toList()
    };

    List<DataPoint>? diastolicData;

    if (dataType == DataType.bloodPressure) {
      diastolicData = appState.bloodPressureData.map((bpdata) {
        return DataPoint(
            dateTime: bpdata.dateTime,
            data: bpdata.diastolicBloodPressure.toDouble());
      }).toList();
    }

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: switch (dataType) {
              DataType.bloodPressure =>
                Theme.of(context).colorScheme.inversePrimary.withOpacity(.60),
              DataType.bloodSugar => Colors.red[200]!.withOpacity(.60),
              DataType.weight => Colors.orange[200]!.withOpacity(.60)
            },
          ),
          child: data.isEmpty
              ? Center(
                  child: SizedBox(
                      width: 200, height: 50, child: LinearProgressIndicator()))
              : Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, right: 32, bottom: 32),
                  child: LineChart(LineChartData(

                      // averages
                      extraLinesData: ExtraLinesData(horizontalLines: [
                        HorizontalLine(
                            y: getNumberAverage(data),
                            strokeWidth: 1,
                            color: Colors.grey[700],
                            dashArray: [5, 10]),
                        if (dataType == DataType.bloodPressure)
                          HorizontalLine(
                              y: getNumberAverage(diastolicData!),
                              strokeWidth: 1,
                              color: Colors.grey[700],
                              dashArray: [5, 10])
                      ]),
                      gridData: FlGridData(horizontalInterval: 5),
                      borderData: FlBorderData(
                          border: Border.all(color: Colors.transparent)),
                      titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 60,
                            getTitlesWidget: (value, meta) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '${value.toStringAsFixed(0)}',
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          )),
                          bottomTitles: AxisTitles(sideTitles: SideTitles()),
                          rightTitles: AxisTitles(),
                          topTitles: AxisTitles()),
                      minX: createDMYMin(
                          appState.bloodPressureData.last.dateTime!),
                      maxX: createDMYMax(
                          appState.bloodPressureData.first.dateTime!),
                      minY: dataType == DataType.bloodPressure
                          ? getNumberMin(diastolicData!)
                          : getNumberMin(data),
                      maxY: getNumberMax(data),
                      lineBarsData: [
                        LineChartBarData(
                            color: Theme.of(context).colorScheme.primary,
                            spots: data.map((dataPoint) {
                              return FlSpot(
                                  createDayMonthYearTime(dataPoint.dateTime!),
                                  dataPoint.data);
                            }).toList()),
                        if (dataType == DataType.bloodPressure)
                          LineChartBarData(
                              color: Theme.of(context).colorScheme.secondary,
                              spots: diastolicData!.map((diastolicData) {
                                return FlSpot(
                                    createDayMonthYearTime(
                                        diastolicData.dateTime!),
                                    diastolicData.data.toDouble());
                              }).toList())
                      ])),
                ),
        ),
      ),
    );
  }
}

// double getNumberMin(List<double> data) {}

double getNumberMax(List<DataPoint> data) {
  double max = data.map((e) => e.data).reduce((a, b) => a > b ? a : b);
  return max + 10;
}

double getNumberMin(List<DataPoint> data) {
  double min = data.map((e) => e.data).reduce((a, b) => a < b ? a : b);
  return min - 10;
}

double getNumberAverage(List<DataPoint> data) {
  double total = 0;
  for (var dataPoint in data) {
    total += dataPoint.data;
  }
  return total / data.length;
}

double createDayMonthYearTime(DateTime date) {
  var day = date.day;
  var month = date.month;
  var year = date.year;
  var time = date.millisecondsSinceEpoch;
  var dayMonthYear = day + month + year + time;

  return dayMonthYear.toDouble();
}

double createDMYMin(DateTime date) {
  return createDayMonthYearTime(date) - 10;
}

double createDMYMax(DateTime date) {
  return createDayMonthYearTime(date) + 10;
}
