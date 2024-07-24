// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weight_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeightData _$WeightDataFromJson(Map<String, dynamic> json) {
  return _WeightData.fromJson(json);
}

/// @nodoc
mixin _$WeightData {
  int? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeightDataCopyWith<WeightData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightDataCopyWith<$Res> {
  factory $WeightDataCopyWith(
          WeightData value, $Res Function(WeightData) then) =
      _$WeightDataCopyWithImpl<$Res, WeightData>;
  @useResult
  $Res call({int? id, String userId, DateTime? dateTime, double weight});
}

/// @nodoc
class _$WeightDataCopyWithImpl<$Res, $Val extends WeightData>
    implements $WeightDataCopyWith<$Res> {
  _$WeightDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? dateTime = freezed,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeightDataImplCopyWith<$Res>
    implements $WeightDataCopyWith<$Res> {
  factory _$$WeightDataImplCopyWith(
          _$WeightDataImpl value, $Res Function(_$WeightDataImpl) then) =
      __$$WeightDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String userId, DateTime? dateTime, double weight});
}

/// @nodoc
class __$$WeightDataImplCopyWithImpl<$Res>
    extends _$WeightDataCopyWithImpl<$Res, _$WeightDataImpl>
    implements _$$WeightDataImplCopyWith<$Res> {
  __$$WeightDataImplCopyWithImpl(
      _$WeightDataImpl _value, $Res Function(_$WeightDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? dateTime = freezed,
    Object? weight = null,
  }) {
    return _then(_$WeightDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeightDataImpl implements _WeightData {
  _$WeightDataImpl(
      {this.id = null,
      this.userId = '',
      this.dateTime = null,
      this.weight = 0});

  factory _$WeightDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeightDataImplFromJson(json);

  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final DateTime? dateTime;
  @override
  @JsonKey()
  final double weight;

  @override
  String toString() {
    return 'WeightData(id: $id, userId: $userId, dateTime: $dateTime, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, dateTime, weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeightDataImplCopyWith<_$WeightDataImpl> get copyWith =>
      __$$WeightDataImplCopyWithImpl<_$WeightDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeightDataImplToJson(
      this,
    );
  }
}

abstract class _WeightData implements WeightData {
  factory _WeightData(
      {final int? id,
      final String userId,
      final DateTime? dateTime,
      final double weight}) = _$WeightDataImpl;

  factory _WeightData.fromJson(Map<String, dynamic> json) =
      _$WeightDataImpl.fromJson;

  @override
  int? get id;
  @override
  String get userId;
  @override
  DateTime? get dateTime;
  @override
  double get weight;
  @override
  @JsonKey(ignore: true)
  _$$WeightDataImplCopyWith<_$WeightDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
