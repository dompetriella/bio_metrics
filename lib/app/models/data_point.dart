import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_point.freezed.dart';

@freezed
class DataPoint with _$DataPoint {
  factory DataPoint(
      {@Default(null) DateTime? dateTime,
      @Default(0) double data}) = _DataPoint;
}
