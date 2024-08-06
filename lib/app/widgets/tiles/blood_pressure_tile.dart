import 'package:bio_metrics/app/models/blood_pressure_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int highSystolicBloodPressure = 130;
int highDiastolicBloodPressure = 80;

String determineHighBloodPressureString(BloodPressureData data) {
  String returnString = 'GOOD';
  if (data.systolicBloodPressure < highSystolicBloodPressure &&
      data.diastolicBloodPressure < highDiastolicBloodPressure) {
    return returnString;
  }
  returnString = 'HIGH';
  if (data.systolicBloodPressure >= highSystolicBloodPressure) {
    returnString += '(S)';
  }
  if (data.diastolicBloodPressure >= highDiastolicBloodPressure) {
    returnString += '(D)';
  }
  return returnString;
}

class BloodPressureDataTile extends StatelessWidget {
  final List<BloodPressureData> bloodPressureDataList;
  final int index;
  const BloodPressureDataTile(
      {super.key, required this.bloodPressureDataList, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isToday =
        DateTime.now().day == bloodPressureDataList[index].dateTime!.day;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: isToday ? Colors.white : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat(isToday ? "h:mma" : 'MM/dd/yy').format(
                        bloodPressureDataList[index].dateTime!.toLocal())),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${bloodPressureDataList[index].systolicBloodPressure}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: bloodPressureDataList[index]
                                          .systolicBloodPressure >=
                                      highSystolicBloodPressure
                                  ? Theme.of(context).colorScheme.error
                                  : null),
                        ),
                        Container(
                          width: 32,
                          height: 1,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        Text(
                          '${bloodPressureDataList[index].diastolicBloodPressure}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: bloodPressureDataList[index]
                                          .diastolicBloodPressure >=
                                      highDiastolicBloodPressure
                                  ? Theme.of(context).colorScheme.error
                                  : null),
                        ),
                      ],
                    ),
                    Text(determineHighBloodPressureString(
                        bloodPressureDataList[index]))
                  ],
                ),
              ))),
    );
  }
}
