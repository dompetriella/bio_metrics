import 'package:bio_metrics/app/db_functions/inserting_data.dart';
import 'package:bio_metrics/app/models/weight_data.dart';
import 'package:bio_metrics/app/pages/blood_pressure.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class WeightPage extends StatelessWidget {
  const WeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Flexible(
        //   child: Container(
        //     color: Colors.green,
        //     child: Center(
        //         child:
        //             ElevatedButton(onPressed: () {}, child: Text('Get Data'))),
        //   ),
        // ),
        SizedBox(
          height: 16,
        ),
        BiometricsDataTableTitle(
          titles: ['DateTime', 'Weight', '% Change'],
        ),
        BiometricsWeightDataTable()
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

class BiometricsWeightDataTable extends ConsumerWidget {
  const BiometricsWeightDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var weightList = ref.watch(appStateProvider).weightData;
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.orange[200]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: weightList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(DateFormat(DateTime.now().day ==
                                          weightList[index].dateTime!.day
                                      ? 'MM/dd/yy'
                                      : "h:mma")
                                  .format(weightList[index].dateTime!)),
                              Text('${weightList[index].weight}'),
                              Text('----')
                            ],
                          ),
                        ))),
              );
            },
          ),
        ),
      ),
    );
  }
}
