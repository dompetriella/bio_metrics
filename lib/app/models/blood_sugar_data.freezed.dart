// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_sugar_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BloodSugarData _$BloodSugarDataFromJson(Map<String, dynamic> json) {
  return _BloodSugarData.fromJson(json);
}

/// @nodoc
mixin _$BloodSugarData {
  int? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;
  int get bloodGlucose => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BloodSugarDataCopyWith<BloodSugarData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodSugarDataCopyWith<$Res> {
  factory $BloodSugarDataCopyWith(
          BloodSugarData value, $Res Function(BloodSugarData) then) =
      _$BloodSugarDataCopyWithImpl<$Res, BloodSugarData>;
  @useResult
  $Res call({int? id, String userId, DateTime? dateTime, int bloodGlucose});
}

/// @nodoc
class _$BloodSugarDataCopyWithImpl<$Res, $Val extends BloodSugarData>
    implements $BloodSugarDataCopyWith<$Res> {
  _$BloodSugarDataCopyWithImpl(this._value, this._then);

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
    Object? bloodGlucose = null,
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
      bloodGlucose: null == bloodGlucose
          ? _value.bloodGlucose
          : bloodGlucose // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodSugarDataImplCopyWith<$Res>
    implements $BloodSugarDataCopyWith<$Res> {
  factory _$$BloodSugarDataImplCopyWith(_$BloodSugarDataImpl value,
          $Res Function(_$BloodSugarDataImpl) then) =
      __$$BloodSugarDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String userId, DateTime? dateTime, int bloodGlucose});
}

/// @nodoc
class __$$BloodSugarDataImplCopyWithImpl<$Res>
    extends _$BloodSugarDataCopyWithImpl<$Res, _$BloodSugarDataImpl>
    implements _$$BloodSugarDataImplCopyWith<$Res> {
  __$$BloodSugarDataImplCopyWithImpl(
      _$BloodSugarDataImpl _value, $Res Function(_$BloodSugarDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? dateTime = freezed,
    Object? bloodGlucose = null,
  }) {
    return _then(_$BloodSugarDataImpl(
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
      bloodGlucose: null == bloodGlucose
          ? _value.bloodGlucose
          : bloodGlucose // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodSugarDataImpl implements _BloodSugarData {
  _$BloodSugarDataImpl(
      {this.id = null,
      this.userId = '',
      this.dateTime = null,
      this.bloodGlucose = 0});

  factory _$BloodSugarDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodSugarDataImplFromJson(json);

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
  final int bloodGlucose;

  @override
  String toString() {
    return 'BloodSugarData(id: $id, userId: $userId, dateTime: $dateTime, bloodGlucose: $bloodGlucose)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodSugarDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.bloodGlucose, bloodGlucose) ||
                other.bloodGlucose == bloodGlucose));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, dateTime, bloodGlucose);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodSugarDataImplCopyWith<_$BloodSugarDataImpl> get copyWith =>
      __$$BloodSugarDataImplCopyWithImpl<_$BloodSugarDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodSugarDataImplToJson(
      this,
    );
  }
}

abstract class _BloodSugarData implements BloodSugarData {
  factory _BloodSugarData(
      {final int? id,
      final String userId,
      final DateTime? dateTime,
      final int bloodGlucose}) = _$BloodSugarDataImpl;

  factory _BloodSugarData.fromJson(Map<String, dynamic> json) =
      _$BloodSugarDataImpl.fromJson;

  @override
  int? get id;
  @override
  String get userId;
  @override
  DateTime? get dateTime;
  @override
  int get bloodGlucose;
  @override
  @JsonKey(ignore: true)
  _$$BloodSugarDataImplCopyWith<_$BloodSugarDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
