import 'package:bio_metrics/app/models/blood_pressure_data.dart';
import 'package:bio_metrics/app/models/blood_sugar_data.dart';
import 'package:bio_metrics/app/models/weight_data.dart';
import 'package:bio_metrics/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future addBloodPressureEntryToDatabase(
    BloodPressureData bloodPressureData, BuildContext context) async {
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
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Insert did not complete successfully")));
  }
}

Future addBloodSugarEntryToDatabase(
    BloodSugarData bloodPressureData, BuildContext context) async {
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
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Insert did not complete successfully")));
  }
}

Future addWeightEntryToDatabase(
    WeightData weightData, BuildContext context) async {
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
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Insert did not complete successfully")));
  }
}
