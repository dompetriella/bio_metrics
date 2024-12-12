import 'dart:math';

import 'package:bio_metrics/app/db_functions/inserting_data.dart';
import 'package:bio_metrics/app/models/blood_pressure_data.dart';
import 'package:bio_metrics/app/models/data_type.dart';
import 'package:bio_metrics/app/models/filter_timespan.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:bio_metrics/app/widgets/data_line_chart.dart';
import 'package:bio_metrics/app/widgets/data_list.dart';
import 'package:bio_metrics/app/widgets/table_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        FilterButtons(
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

class FilterButtons extends StatelessWidget {
  final DataType dataType;
  const FilterButtons({super.key, required this.dataType});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DataFilterButton(
          filterTimespan: FilterTimespan.all,
          dataType: dataType,
        ),
        DataFilterButton(
          filterTimespan: FilterTimespan.sixMonths,
          dataType: dataType,
        ),
        DataFilterButton(
          filterTimespan: FilterTimespan.oneMonth,
          dataType: dataType,
        ),
        DataFilterButton(
          filterTimespan: FilterTimespan.oneWeek,
          dataType: dataType,
        ),
      ],
    );
  }
}

class DataFilterButton extends ConsumerWidget {
  final FilterTimespan filterTimespan;
  final DataType dataType;
  const DataFilterButton(
      {super.key, required this.filterTimespan, required this.dataType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final appStateActions = ref.watch(appStateProvider.notifier);
    final buttonText = switch (filterTimespan) {
      FilterTimespan.all => 'all',
      FilterTimespan.sixMonths => '6mo',
      FilterTimespan.oneMonth => '1mo',
      FilterTimespan.oneWeek => '1wk'
    };

    final Color? borderColor = switch (dataType) {
      DataType.bloodPressure =>
        appState.bloodPressureFilter == filterTimespan.index
            ? Colors.blue[500]
            : Colors.blue[100],
      DataType.bloodSugar => appState.bloodSugarFilter == filterTimespan.index
          ? Colors.red[500]
          : Colors.red[100],
      DataType.weight => appState.weightFilter == filterTimespan.index
          ? Colors.orange[500]
          : Colors.orange[100]
    };

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide(width: 4, color: borderColor ?? Colors.transparent)),
      onPressed: () {
        switch (dataType) {
          case DataType.bloodPressure:
            appStateActions.filterBloodPressureData(filterTimespan);
            break;
          case DataType.bloodSugar:
            appStateActions.filterBloodSugarData(filterTimespan);
            break;
          case DataType.weight:
            appStateActions.filterWeightData(filterTimespan);
            break;
          default:
        }
      },
      child: Text(buttonText),
    );
  }
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
