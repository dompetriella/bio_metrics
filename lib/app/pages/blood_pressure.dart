import 'package:bio_metrics/app/db_functions/getting_data.dart';
import 'package:bio_metrics/app/db_functions/inserting_data.dart';
import 'package:bio_metrics/app/models/blood_pressure_data.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class BloodPressurePage extends ConsumerWidget {
  const BloodPressurePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        // Flexible(
        //   child: Container(
        //     color: Colors.green,
        //     child: Center(
        //         child: ElevatedButton(
        //             onPressed: () async {
        //               await getBloodPressureDataFromDatabase(context, ref);
        //             },
        //             child: Text('Get Data'))),
        //   ),
        // ),
        SizedBox(
          height: 16,
        ),
        BiometricsDataTableTitle(
          titles: ['DateTime', 'Blood Pressure', 'Range'],
        ),
        BiometricsBloodPressureDataTable()
      ],
    );
  }
}

class BiometricsDataTableTitle extends StatelessWidget {
  final List<String> titles;
  const BiometricsDataTableTitle({super.key, required this.titles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [for (String title in titles) Text(title)],
      ),
    );
  }
}

class BiometricsBloodPressureDataTable extends ConsumerWidget {
  const BiometricsBloodPressureDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var bloodPressureList = ref.watch(appStateProvider).bloodPressureData;
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.inversePrimary),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: bloodPressureList.length,
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
                                          bloodPressureList[index].dateTime!.day
                                      ? 'MM/dd/yy'
                                      : "h:mma")
                                  .format(bloodPressureList[index].dateTime!)),
                              Text(
                                  '${bloodPressureList[index].systolicBloodPressure}/${bloodPressureList[index].diastolicBloodPressure}'),
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
