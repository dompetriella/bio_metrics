// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_sugar_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodSugarDataImpl _$$BloodSugarDataImplFromJson(Map<String, dynamic> json) =>
    _$BloodSugarDataImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      userId: json['user_id'] as String? ?? '',
      dateTime: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      bloodGlucose: (json['blood_sugar'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BloodSugarDataImplToJson(
        _$BloodSugarDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'created_at': instance.dateTime?.toIso8601String(),
      'blood_sugar': instance.bloodGlucose,
    };
