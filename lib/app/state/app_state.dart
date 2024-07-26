import 'package:bio_metrics/app/models/blood_pressure_data.dart';
import 'package:bio_metrics/app/models/blood_sugar_data.dart';
import 'package:bio_metrics/app/models/weight_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppStateData with _$AppStateData {
  factory AppStateData({
    @Default(null) User? user,
    @Default(0) int currentPageIndex,
    @Default([]) List<BloodPressureData> bloodPressureData,
    @Default([]) List<BloodSugarData> bloodSugarData,
    @Default([]) List<WeightData> weightData,
  }) = _AppStateData;
}

@Riverpod(keepAlive: true)
class AppState extends _$AppState {
  @override
  AppStateData build() {
    return AppStateData();
  }

  changePageIndex(int index) {
    state = state.copyWith(currentPageIndex: index);
  }

  setUserState(User? user) {
    state = state.copyWith(user: user);
  }

  setBloodPressureData(List<BloodPressureData> bloodPressureData) {
    state = state.copyWith(bloodPressureData: bloodPressureData);
  }

  setBloodSugarData(List<BloodSugarData> bloodSugarData) {
    state = state.copyWith(bloodSugarData: bloodSugarData);
  }

  setWeightData(List<WeightData> weightData) {
    state = state.copyWith(weightData: weightData);
  }
}
