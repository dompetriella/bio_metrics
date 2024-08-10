// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataPoint {
  DateTime? get dateTime => throw _privateConstructorUsedError;
  double get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataPointCopyWith<DataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataPointCopyWith<$Res> {
  factory $DataPointCopyWith(DataPoint value, $Res Function(DataPoint) then) =
      _$DataPointCopyWithImpl<$Res, DataPoint>;
  @useResult
  $Res call({DateTime? dateTime, double data});
}

/// @nodoc
class _$DataPointCopyWithImpl<$Res, $Val extends DataPoint>
    implements $DataPointCopyWith<$Res> {
  _$DataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataPointImplCopyWith<$Res>
    implements $DataPointCopyWith<$Res> {
  factory _$$DataPointImplCopyWith(
          _$DataPointImpl value, $Res Function(_$DataPointImpl) then) =
      __$$DataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? dateTime, double data});
}

/// @nodoc
class __$$DataPointImplCopyWithImpl<$Res>
    extends _$DataPointCopyWithImpl<$Res, _$DataPointImpl>
    implements _$$DataPointImplCopyWith<$Res> {
  __$$DataPointImplCopyWithImpl(
      _$DataPointImpl _value, $Res Function(_$DataPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? data = null,
  }) {
    return _then(_$DataPointImpl(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DataPointImpl implements _DataPoint {
  _$DataPointImpl({this.dateTime = null, this.data = 0});

  @override
  @JsonKey()
  final DateTime? dateTime;
  @override
  @JsonKey()
  final double data;

  @override
  String toString() {
    return 'DataPoint(dateTime: $dateTime, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataPointImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataPointImplCopyWith<_$DataPointImpl> get copyWith =>
      __$$DataPointImplCopyWithImpl<_$DataPointImpl>(this, _$identity);
}

abstract class _DataPoint implements DataPoint {
  factory _DataPoint({final DateTime? dateTime, final double data}) =
      _$DataPointImpl;

  @override
  DateTime? get dateTime;
  @override
  double get data;
  @override
  @JsonKey(ignore: true)
  _$$DataPointImplCopyWith<_$DataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
