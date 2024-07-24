import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight_data.freezed.dart';
part 'weight_data.g.dart';

@freezed
class WeightData with _$WeightData {
  factory WeightData({
    @Default(null) int? id,
    @Default('') String userId,
    @Default(null) DateTime? dateTime,
    @Default(0) double weight,
  }) = _WeightData;
  factory WeightData.fromJson(Map<String, dynamic> json) =>
      _$WeightDataFromJson(json);
}
