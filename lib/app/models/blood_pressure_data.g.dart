// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_pressure_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodPressureDataImpl _$$BloodPressureDataImplFromJson(
        Map<String, dynamic> json) =>
    _$BloodPressureDataImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      userId: json['userId'] as String? ?? '',
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      systolicBloodPressure:
          (json['systolicBloodPressure'] as num?)?.toInt() ?? 0,
      diastolicBloodPressure:
          (json['diastolicBloodPressure'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BloodPressureDataImplToJson(
        _$BloodPressureDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'dateTime': instance.dateTime?.toIso8601String(),
      'systolicBloodPressure': instance.systolicBloodPressure,
      'diastolicBloodPressure': instance.diastolicBloodPressure,
    };
