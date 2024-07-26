// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_pressure_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BloodPressureData _$BloodPressureDataFromJson(Map<String, dynamic> json) {
  return _BloodPressureData.fromJson(json);
}

/// @nodoc
mixin _$BloodPressureData {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'systolic_blood_pressure')
  int get systolicBloodPressure => throw _privateConstructorUsedError;
  @JsonKey(name: 'diastolic_blood_pressure')
  int get diastolicBloodPressure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BloodPressureDataCopyWith<BloodPressureData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodPressureDataCopyWith<$Res> {
  factory $BloodPressureDataCopyWith(
          BloodPressureData value, $Res Function(BloodPressureData) then) =
      _$BloodPressureDataCopyWithImpl<$Res, BloodPressureData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'created_at') DateTime? dateTime,
      @JsonKey(name: 'systolic_blood_pressure') int systolicBloodPressure,
      @JsonKey(name: 'diastolic_blood_pressure') int diastolicBloodPressure});
}

/// @nodoc
class _$BloodPressureDataCopyWithImpl<$Res, $Val extends BloodPressureData>
    implements $BloodPressureDataCopyWith<$Res> {
  _$BloodPressureDataCopyWithImpl(this._value, this._then);

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
    Object? systolicBloodPressure = null,
    Object? diastolicBloodPressure = null,
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
      systolicBloodPressure: null == systolicBloodPressure
          ? _value.systolicBloodPressure
          : systolicBloodPressure // ignore: cast_nullable_to_non_nullable
              as int,
      diastolicBloodPressure: null == diastolicBloodPressure
          ? _value.diastolicBloodPressure
          : diastolicBloodPressure // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodPressureDataImplCopyWith<$Res>
    implements $BloodPressureDataCopyWith<$Res> {
  factory _$$BloodPressureDataImplCopyWith(_$BloodPressureDataImpl value,
          $Res Function(_$BloodPressureDataImpl) then) =
      __$$BloodPressureDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'created_at') DateTime? dateTime,
      @JsonKey(name: 'systolic_blood_pressure') int systolicBloodPressure,
      @JsonKey(name: 'diastolic_blood_pressure') int diastolicBloodPressure});
}

/// @nodoc
class __$$BloodPressureDataImplCopyWithImpl<$Res>
    extends _$BloodPressureDataCopyWithImpl<$Res, _$BloodPressureDataImpl>
    implements _$$BloodPressureDataImplCopyWith<$Res> {
  __$$BloodPressureDataImplCopyWithImpl(_$BloodPressureDataImpl _value,
      $Res Function(_$BloodPressureDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? dateTime = freezed,
    Object? systolicBloodPressure = null,
    Object? diastolicBloodPressure = null,
  }) {
    return _then(_$BloodPressureDataImpl(
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
      systolicBloodPressure: null == systolicBloodPressure
          ? _value.systolicBloodPressure
          : systolicBloodPressure // ignore: cast_nullable_to_non_nullable
              as int,
      diastolicBloodPressure: null == diastolicBloodPressure
          ? _value.diastolicBloodPressure
          : diastolicBloodPressure // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodPressureDataImpl implements _BloodPressureData {
  _$BloodPressureDataImpl(
      {@JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'user_id') this.userId = '',
      @JsonKey(name: 'created_at') this.dateTime = null,
      @JsonKey(name: 'systolic_blood_pressure') this.systolicBloodPressure = 0,
      @JsonKey(name: 'diastolic_blood_pressure')
      this.diastolicBloodPressure = 0});

  factory _$BloodPressureDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodPressureDataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? dateTime;
  @override
  @JsonKey(name: 'systolic_blood_pressure')
  final int systolicBloodPressure;
  @override
  @JsonKey(name: 'diastolic_blood_pressure')
  final int diastolicBloodPressure;

  @override
  String toString() {
    return 'BloodPressureData(id: $id, userId: $userId, dateTime: $dateTime, systolicBloodPressure: $systolicBloodPressure, diastolicBloodPressure: $diastolicBloodPressure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodPressureDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.systolicBloodPressure, systolicBloodPressure) ||
                other.systolicBloodPressure == systolicBloodPressure) &&
            (identical(other.diastolicBloodPressure, diastolicBloodPressure) ||
                other.diastolicBloodPressure == diastolicBloodPressure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, dateTime,
      systolicBloodPressure, diastolicBloodPressure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodPressureDataImplCopyWith<_$BloodPressureDataImpl> get copyWith =>
      __$$BloodPressureDataImplCopyWithImpl<_$BloodPressureDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodPressureDataImplToJson(
      this,
    );
  }
}

abstract class _BloodPressureData implements BloodPressureData {
  factory _BloodPressureData(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'user_id') final String userId,
      @JsonKey(name: 'created_at') final DateTime? dateTime,
      @JsonKey(name: 'systolic_blood_pressure') final int systolicBloodPressure,
      @JsonKey(name: 'diastolic_blood_pressure')
      final int diastolicBloodPressure}) = _$BloodPressureDataImpl;

  factory _BloodPressureData.fromJson(Map<String, dynamic> json) =
      _$BloodPressureDataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get dateTime;
  @override
  @JsonKey(name: 'systolic_blood_pressure')
  int get systolicBloodPressure;
  @override
  @JsonKey(name: 'diastolic_blood_pressure')
  int get diastolicBloodPressure;
  @override
  @JsonKey(ignore: true)
  _$$BloodPressureDataImplCopyWith<_$BloodPressureDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
