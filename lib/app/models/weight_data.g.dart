// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeightDataImpl _$$WeightDataImplFromJson(Map<String, dynamic> json) =>
    _$WeightDataImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      userId: json['userId'] as String? ?? '',
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$WeightDataImplToJson(_$WeightDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'dateTime': instance.dateTime?.toIso8601String(),
      'weight': instance.weight,
    };
