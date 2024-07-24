import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_pressure_data.freezed.dart';
part 'blood_pressure_data.g.dart';

@freezed
class BloodPressureData with _$BloodPressureData {
  factory BloodPressureData({
    @Default(null) int? id,
    @Default('') String userId,
    @Default(null) DateTime? dateTime,
    @Default(0) int systolicBloodPressure,
    @Default(0) int diastolicBloodPressure,
  }) = _BloodPressureData;
  factory BloodPressureData.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureDataFromJson(json);
}
