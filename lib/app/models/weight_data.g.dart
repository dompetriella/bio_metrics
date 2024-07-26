// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeightDataImpl _$$WeightDataImplFromJson(Map<String, dynamic> json) =>
    _$WeightDataImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      userId: json['user_id'] as String? ?? '',
      dateTime: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$WeightDataImplToJson(_$WeightDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'created_at': instance.dateTime?.toIso8601String(),
      'weight': instance.weight,
    };
