import 'package:bio_metrics/app/models/blood_pressure_data.dart';
import 'package:bio_metrics/app/models/blood_sugar_data.dart';
import 'package:bio_metrics/app/models/data_type.dart';
import 'package:bio_metrics/app/models/weight_data.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:bio_metrics/app/widgets/tiles/blood_pressure_tile.dart';
import 'package:bio_metrics/app/widgets/tiles/blood_sugar_tile.dart';
import 'package:bio_metrics/app/widgets/tiles/weight_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataList extends ConsumerWidget {
  final DataType dataType;
  const DataList({super.key, required this.dataType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);
    var dataList = switch (dataType) {
      DataType.bloodPressure => appState.bloodPressureData,
      DataType.bloodSugar => appState.bloodSugarData,
      DataType.weight => appState.weightData
    };
    dataList = dataList.reversed.toList();
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: switch (dataType) {
                DataType.bloodPressure =>
                  Theme.of(context).colorScheme.inversePrimary.withOpacity(.60),
                DataType.bloodSugar => Colors.red[200],
                DataType.weight => Colors.orange[200]
              }),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return switch (dataType) {
                  DataType.bloodPressure => BloodPressureDataTile(
                      bloodPressureDataList:
                          dataList as List<BloodPressureData>,
                      index: index),
                  DataType.bloodSugar => BloodSugarDataTile(
                      bloodSugarList: dataList as List<BloodSugarData>,
                      index: index),
                  DataType.weight => WeightDataTile(
                      weightList: dataList as List<WeightData>, index: index),
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}
