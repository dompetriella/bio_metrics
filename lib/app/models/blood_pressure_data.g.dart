// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_pressure_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodPressureDataImpl _$$BloodPressureDataImplFromJson(
        Map<String, dynamic> json) =>
    _$BloodPressureDataImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      userId: json['user_id'] as String? ?? '',
      dateTime: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      systolicBloodPressure:
          (json['systolic_blood_pressure'] as num?)?.toInt() ?? 0,
      diastolicBloodPressure:
          (json['diastolic_blood_pressure'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BloodPressureDataImplToJson(
        _$BloodPressureDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'created_at': instance.dateTime?.toIso8601String(),
      'systolic_blood_pressure': instance.systolicBloodPressure,
      'diastolic_blood_pressure': instance.diastolicBloodPressure,
    };
