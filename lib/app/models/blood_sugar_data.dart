import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_sugar_data.freezed.dart';
part 'blood_sugar_data.g.dart';

@freezed
class BloodSugarData with _$BloodSugarData {
  factory BloodSugarData({
    @Default(null) int? id,
    @Default('') String userId,
    @Default(null) DateTime? dateTime,
    @Default(0) int bloodGlucose,
  }) = _BloodSugarData;
  factory BloodSugarData.fromJson(Map<String, dynamic> json) =>
      _$BloodSugarDataFromJson(json);
}
