import 'package:bio_metrics/app/models/blood_sugar_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String determineBloodSugar(BloodSugarData data) {
  String returnString = '----';
  int highSugar = 125;
  int lowSugar = 70;
  if (data.bloodGlucose > lowSugar && data.bloodGlucose < highSugar) {
    return returnString;
  }

  if (data.bloodGlucose >= highSugar) {
    returnString = 'HIGH';
  }
  if (data.bloodGlucose < lowSugar) {
    returnString = 'LOW';
  }
  return returnString;
}

class BloodSugarDataTile extends StatelessWidget {
  final int index;
  final List<BloodSugarData> bloodSugarList;
  const BloodSugarDataTile(
      {super.key, required this.bloodSugarList, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isToday = DateTime.now().day == bloodSugarList[index].dateTime!.day;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
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
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat(isToday ? "h:mma" : 'MM/dd/yy')
                        .format(bloodSugarList[index].dateTime!.toLocal())),
                    Text('${bloodSugarList[index].bloodGlucose}'),
                    Text(determineBloodSugar(bloodSugarList[index]))
                  ],
                ),
              ))),
    );
  }
}
