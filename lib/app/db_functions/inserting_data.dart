import 'package:bio_metrics/app/models/blood_pressure_data.dart';
import 'package:bio_metrics/app/models/blood_sugar_data.dart';
import 'package:bio_metrics/app/models/weight_data.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:bio_metrics/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future addBloodPressureEntryToDatabase(BloodPressureData bloodPressureData,
    BuildContext context, WidgetRef ref) async {
  PostgrestResponse<List<Map<String, dynamic>>>? insertResponse;

  try {
    insertResponse = await supabase
        .from('biometrics_blood_pressure')
        .insert({
          'user_id': bloodPressureData.userId,
          'systolic_blood_pressure': bloodPressureData.systolicBloodPressure,
          'diastolic_blood_pressure': bloodPressureData.diastolicBloodPressure
        })
        .select()
        .count();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: couldn't reach database")));
  }

  if (insertResponse != null) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Blood Pressure Data Added\n")));
    var appStateActions = ref.watch(appStateProvider.notifier);
    print('weight retrived successfully');
    List<BloodPressureData> bloodPressureData =
        insertResponse.data.map((bloodPressureJson) {
      return BloodPressureData.fromJson(bloodPressureJson);
    }).toList();
    appStateActions.setBloodPressureData(bloodPressureData);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Insert did not complete successfully")));
  }
}

Future addBloodSugarEntryToDatabase(BloodSugarData bloodPressureData,
    BuildContext context, WidgetRef ref) async {
  PostgrestResponse<List<Map<String, dynamic>>>? insertResponse;

  try {
    insertResponse = await supabase
        .from('biometrics_blood_sugar')
        .insert({
          'user_id': bloodPressureData.userId,
          'blood_sugar': bloodPressureData.bloodGlucose,
        })
        .select()
        .count();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: couldn't reach database")));
  }

  if (insertResponse != null) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Blood Sugar Data Added\n")));
    var appStateActions = ref.watch(appStateProvider.notifier);
    print('blood sugar retrived successfully');
    List<BloodSugarData> bloodSugarData =
        insertResponse.data.map((bloodSugarJson) {
      return BloodSugarData.fromJson(bloodSugarJson);
    }).toList();
    appStateActions.setBloodSugarData(bloodSugarData);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Insert did not complete successfully")));
  }
}

Future addWeightEntryToDatabase(
    WeightData weightData, BuildContext context, WidgetRef ref) async {
  PostgrestResponse<List<Map<String, dynamic>>>? insertResponse;

  try {
    insertResponse = await supabase
        .from('biometrics_weight')
        .insert({
          'user_id': weightData.userId,
          'weight': weightData.weight,
        })
        .select()
        .count();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: couldn't reach database")));
  }

  if (insertResponse != null) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Weight Data Added\n")));
    var appStateActions = ref.watch(appStateProvider.notifier);
    print('weight retrived successfully');
    List<WeightData> weightData = insertResponse.data.map((weightDataJson) {
      return WeightData.fromJson(weightDataJson);
    }).toList();
    appStateActions.setWeightData(weightData);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Insert did not complete successfully")));
  }
}
