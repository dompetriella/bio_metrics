// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_sugar_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodSugarDataImpl _$$BloodSugarDataImplFromJson(Map<String, dynamic> json) =>
    _$BloodSugarDataImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      userId: json['userId'] as String? ?? '',
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      bloodGlucose: (json['bloodGlucose'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BloodSugarDataImplToJson(
        _$BloodSugarDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'dateTime': instance.dateTime?.toIso8601String(),
      'bloodGlucose': instance.bloodGlucose,
    };
