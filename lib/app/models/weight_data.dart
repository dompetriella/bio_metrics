import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight_data.freezed.dart';
part 'weight_data.g.dart';

@freezed
class WeightData with _$WeightData {
  factory WeightData({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default('') @JsonKey(name: 'user_id') String userId,
    @Default(null) @JsonKey(name: 'created_at') DateTime? dateTime,
    @Default(0) @JsonKey(name: 'weight') double weight,
  }) = _WeightData;
  factory WeightData.fromJson(Map<String, dynamic> json) =>
      _$WeightDataFromJson(json);
}
