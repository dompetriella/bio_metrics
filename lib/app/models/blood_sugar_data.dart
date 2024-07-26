import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_sugar_data.freezed.dart';
part 'blood_sugar_data.g.dart';

@freezed
class BloodSugarData with _$BloodSugarData {
  factory BloodSugarData({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default('') @JsonKey(name: 'user_id') String userId,
    @Default(null) @JsonKey(name: 'created_at') DateTime? dateTime,
    @Default(0) @JsonKey(name: 'blood_sugar') int bloodGlucose,
  }) = _BloodSugarData;
  factory BloodSugarData.fromJson(Map<String, dynamic> json) =>
      _$BloodSugarDataFromJson(json);
}
