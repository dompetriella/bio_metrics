import 'dart:math';

import 'package:bio_metrics/app/db_functions/inserting_data.dart';
import 'package:bio_metrics/app/models/blood_pressure_data.dart';
import 'package:bio_metrics/app/models/data_type.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:bio_metrics/app/widgets/data_list.dart';
import 'package:bio_metrics/app/widgets/table_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

class BloodPressurePage extends ConsumerWidget {
  const BloodPressurePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appStateActions = ref.watch(appStateProvider.notifier);
    var appState = ref.watch(appStateProvider);
    return Column(
      children: [
        LineChartExpansionToggle(
          onTap: appStateActions.toggleBloodPressureGraphExpand,
          isExpanded: appState.bloodPressureGraphExpanded,
        ),
        if (appState.bloodPressureGraphExpanded)
          DataLineChart(
            dataType: DataType.bloodPressure,
          ),
        SizedBox(
          height: 8,
        ),
        TableTitle(
          titles: ['DateTime', 'Blood Pressure', 'Range'],
        ),
        DataList(dataType: DataType.bloodPressure)
      ],
    );
  }
}

class DataLineChart extends ConsumerWidget {
  final DataType dataType;
  const DataLineChart({super.key, required this.dataType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);

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
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0, right: 32, bottom: 32),
            child: LineChart(LineChartData(

                // averages
                extraLinesData: ExtraLinesData(horizontalLines: [
                  HorizontalLine(
                      y: getAverageSystolicBloodPressure(
                          appState.bloodPressureData),
                      strokeWidth: 1,
                      color: Colors.grey[700],
                      dashArray: [5, 10]),
                  HorizontalLine(
                      y: getAverageDiastolicBloodPressure(
                          appState.bloodPressureData),
                      strokeWidth: 1,
                      color: Colors.grey[700],
                      dashArray: [5, 10])
                ]),
                gridData: FlGridData(horizontalInterval: 5),
                borderData:
                    FlBorderData(border: Border.all(color: Colors.transparent)),
                titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 60,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                minX: appState.bloodPressureData.isEmpty
                    ? 0
                    : createDMYMin(appState.bloodPressureData.last.dateTime!),
                maxX: appState.bloodPressureData.isEmpty
                    ? 0
                    : createDMYMax(appState.bloodPressureData.first.dateTime!),
                minY: 60,
                maxY: 150,
                lineBarsData: [
                  LineChartBarData(
                      color: Theme.of(context).colorScheme.primary,
                      spots:
                          appState.bloodPressureData.map((bloodPressureData) {
                        return FlSpot(
                            createDayMonthYearTime(bloodPressureData.dateTime!),
                            bloodPressureData.systolicBloodPressure.toDouble());
                      }).toList()),
                  LineChartBarData(
                      color: Theme.of(context).colorScheme.secondary,
                      spots:
                          appState.bloodPressureData.map((bloodPressureData) {
                        return FlSpot(
                            createDayMonthYearTime(bloodPressureData.dateTime!),
                            bloodPressureData.diastolicBloodPressure
                                .toDouble());
                      }).toList())
                ])),
          ),
        ),
      ),
    );
  }
}

double getAverageSystolicBloodPressure(List<BloodPressureData> data) {
  double total = 0;
  for (var dataPoint in data) {
    total += dataPoint.systolicBloodPressure;
  }
  return total / data.length;
}

double getAverageDiastolicBloodPressure(List<BloodPressureData> data) {
  double total = 0;
  for (var dataPoint in data) {
    total += dataPoint.diastolicBloodPressure;
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

class LineChartExpansionToggle extends StatelessWidget {
  final VoidCallback onTap;
  final bool isExpanded;
  const LineChartExpansionToggle(
      {super.key, required this.onTap, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text(isExpanded ? 'Minimize Graph' : 'Show Graph'),
        ),
        Transform.rotate(
            angle: isExpanded ? pi / 2 : 3 * pi / 2,
            child: IconButton(
                onPressed: onTap,
                icon: Transform.translate(
                    offset: Offset(6, 0), child: Icon(Icons.arrow_back_ios)))),
      ],
    );
  }
}

class BloodPressureEntry extends HookConsumerWidget {
  const BloodPressureEntry({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var systolicState = useState(0);
    var distolicState = useState(0);
    var appState = ref.watch(appStateProvider);
    final FocusScopeNode focus = FocusScope.of(context);
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text('New Blood Pressure'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Systolic (mm Hg)',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                  width: 50,
                  child: TextField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        systolicState.value = int.tryParse(value) ?? 0;
                        if (systolicState.value.toString().length > 2) {
                          focus.nextFocus();
                        }
                      }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Diastolic (mm Hg)',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                  width: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        distolicState.value = int.tryParse(value) ?? 0,
                  ))
            ],
          ),
          SizedBox(
            height: 24,
          )
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel")),
        ElevatedButton(
            onPressed: () async {
              BloodPressureData bloodPressureData = BloodPressureData(
                userId: appState.user!.id,
                systolicBloodPressure: systolicState.value,
                diastolicBloodPressure: distolicState.value,
              );
              await addBloodPressureEntryToDatabase(
                      bloodPressureData, context, ref)
                  .then((value) => Navigator.pop(context));
            },
            child: Text("Enter"))
      ],
    );
  }
}
