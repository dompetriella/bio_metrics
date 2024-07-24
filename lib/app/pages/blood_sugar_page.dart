import 'package:bio_metrics/app/db_functions/inserting_data.dart';
import 'package:bio_metrics/app/models/blood_sugar_data.dart';
import 'package:bio_metrics/app/pages/blood_pressure.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BloodSugarPage extends StatelessWidget {
  const BloodSugarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            color: Colors.green,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        BiometricsDataTableTitle(),
        BiometricsDataTable()
      ],
    );
  }
}

class BloodSugarEntry extends HookConsumerWidget {
  const BloodSugarEntry({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);

    ValueNotifier<int> bloodGlucoseState = useState(0);
    return AlertDialog(
      backgroundColor: Colors.red[200],
      title: Text('New Blood Sugar'),
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
                'Blood Glucose\n(mg/dL)',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                  width: 50,
                  child: TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        bloodGlucoseState.value = int.tryParse(value) ?? 0,
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
              BloodSugarData bloodPressureData = BloodSugarData(
                  userId: appState.user!.id,
                  bloodGlucose: bloodGlucoseState.value);
              await addBloodSugarEntryToDatabase(bloodPressureData, context)
                  .then((value) => Navigator.pop(context));
            },
            child: Text("Enter"))
      ],
    );
  }
}
