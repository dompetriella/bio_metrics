import 'package:bio_metrics/app/models/blood_pressure_data.dart';
import 'package:bio_metrics/app/models/blood_sugar_data.dart';
import 'package:bio_metrics/app/models/weight_data.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:bio_metrics/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future getBloodPressureDataFromDatabase(
    BuildContext context, WidgetRef ref) async {
  PostgrestResponse<List<Map<String, dynamic>>>? getResponse;

  try {
    getResponse =
        await supabase.from('biometrics_blood_pressure').select().count();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: couldn't reach database")));
  }

  if (getResponse != null) {
    var appStateActions = ref.watch(appStateProvider.notifier);
    print('blood pressure retrived successfully');
    List<BloodPressureData> bloodPressureData =
        getResponse.data.map((bloodPressureJson) {
      return BloodPressureData.fromJson(bloodPressureJson);
    }).toList();
    appStateActions.setBloodPressureData(bloodPressureData);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Insert did not complete successfully")));
  }
}

Future getBloodSugarDataFromDatabase(
    BuildContext context, WidgetRef ref) async {
  PostgrestResponse<List<Map<String, dynamic>>>? getResponse;

  try {
    getResponse =
        await supabase.from('biometrics_blood_sugar').select().count();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: couldn't reach database")));
  }

  if (getResponse != null) {
    var appStateActions = ref.watch(appStateProvider.notifier);
    print('blood sugar retrived successfully');
    List<BloodSugarData> bloodSugarData =
        getResponse.data.map((bloodSugarJson) {
      return BloodSugarData.fromJson(bloodSugarJson);
    }).toList();
    appStateActions.setBloodSugarData(bloodSugarData);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Insert did not complete successfully")));
  }
}

Future getWeightDataFromDatabase(BuildContext context, WidgetRef ref) async {
  PostgrestResponse<List<Map<String, dynamic>>>? getResponse;

  try {
    getResponse = await supabase.from('biometrics_weight').select().count();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: couldn't reach database")));
  }

  if (getResponse != null) {
    var appStateActions = ref.watch(appStateProvider.notifier);
    print('weight retrived successfully');
    List<WeightData> weightData = getResponse.data.map((weightDataJson) {
      return WeightData.fromJson(weightDataJson);
    }).toList();
    appStateActions.setWeightData(weightData);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Insert did not complete successfully")));
  }
}
