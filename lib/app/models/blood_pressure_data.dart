import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_pressure_data.freezed.dart';
part 'blood_pressure_data.g.dart';

@freezed
class BloodPressureData with _$BloodPressureData {
  factory BloodPressureData({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default('') @JsonKey(name: 'user_id') String userId,
    @Default(null) @JsonKey(name: 'created_at') DateTime? dateTime,
    @Default(0)
    @JsonKey(name: 'systolic_blood_pressure')
    int systolicBloodPressure,
    @Default(0)
    @JsonKey(name: 'diastolic_blood_pressure')
    int diastolicBloodPressure,
  }) = _BloodPressureData;
  factory BloodPressureData.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureDataFromJson(json);
}
