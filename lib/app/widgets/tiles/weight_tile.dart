import 'package:bio_metrics/app/models/weight_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String determineWeightGainPercentage(List<WeightData> dataList,
    int currentWeightIndex, int previousWeightIndex) {
  String returnString = '----';
  if (previousWeightIndex == dataList.length) {
    return returnString;
  }

  double currentWeight = dataList[currentWeightIndex].weight;
  double previousWeight = dataList[previousWeightIndex].weight;
  double weightDifference =
      (currentWeight - previousWeight) / previousWeight * 100;
  String weightPercentage = weightDifference.toStringAsFixed(2);
  if (weightDifference > 0) {
    weightPercentage = "+" + weightPercentage;
  }
  returnString = '${weightPercentage}%';

  return returnString;
}

class WeightDataTile extends StatelessWidget {
  final List<WeightData> weightList;
  final int index;
  const WeightDataTile(
      {super.key, required this.weightList, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isToday = DateTime.now().day == weightList[index].dateTime!.day;
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
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 72,
                      child: Center(
                        child: Text(DateFormat(isToday ? "h:mma" : 'MM/dd/yy')
                            .format(weightList[index].dateTime!.toLocal())),
                      ),
                    ),
                    SizedBox(
                        width: 72,
                        child:
                            Center(child: Text('${weightList[index].weight}'))),
                    SizedBox(
                      width: 72,
                      child: Center(
                        child: Text(determineWeightGainPercentage(
                            weightList, index, index + 1)),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
