import 'package:bio_metrics/app/db_functions/inserting_data.dart';
import 'package:bio_metrics/app/models/data_type.dart';
import 'package:bio_metrics/app/models/weight_data.dart';
import 'package:bio_metrics/app/pages/blood_pressure.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:bio_metrics/app/widgets/data_line_chart.dart';
import 'package:bio_metrics/app/widgets/data_list.dart';
import 'package:bio_metrics/app/widgets/table_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class WeightPage extends ConsumerWidget {
  const WeightPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);
    var appStateActions = ref.watch(appStateProvider.notifier);
    return Column(
      children: [
        LineChartExpansionToggle(
          onTap: appStateActions.toggleWeightGraphExpand,
          isExpanded: appState.weightGraphExpanded,
        ),
        if (appState.weightGraphExpanded)
          DataLineChart(
            dataType: DataType.weight,
          ),
        SizedBox(
          height: 8,
        ),
        TableTitle(
          titles: ['DateTime', 'Weight', '% Change'],
        ),
        DataList(dataType: DataType.weight)
      ],
    );
  }
}

class WeightEntry extends HookConsumerWidget {
  const WeightEntry({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);

    ValueNotifier<double> weightState = useState(0);
    return AlertDialog(
      backgroundColor: Colors.orange[300],
      title: Text('New Weight'),
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
                'Weight (lbs)',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                  width: 50,
                  child: TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        weightState.value = double.tryParse(value) ?? 0,
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
              WeightData weightData = WeightData(
                  userId: appState.user!.id, weight: weightState.value);
              await addWeightEntryToDatabase(weightData, context, ref)
                  .then((value) => Navigator.pop(context));
            },
            child: Text("Enter"))
      ],
    );
  }
}
