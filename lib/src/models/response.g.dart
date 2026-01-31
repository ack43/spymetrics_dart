// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpymetricsResponseMeta _$SpymetricsResponseMetaFromJson(
  Map<String, dynamic> json,
) => SpymetricsResponseMeta(
  request: SpymetricsRequest.fromJson(json['request'] as Map<String, dynamic>),
  status: json['status'] as String,
  lastUpdated: json['last_updated'] == null
      ? null
      : DateTime.parse(json['last_updated'] as String),
  hitCost: (json['hit_cost'] as num?)?.toInt(),
  errorCode: (json['error_code'] as num?)?.toInt(),
  errorMessage: json['error_message'] as String?,
);

Map<String, dynamic> _$SpymetricsResponseMetaToJson(
  SpymetricsResponseMeta instance,
) => <String, dynamic>{
  'request': instance.request,
  'status': instance.status,
  'last_updated': instance.lastUpdated?.toIso8601String(),
  'hit_cost': instance.hitCost,
  'error_code': instance.errorCode,
  'error_message': instance.errorMessage,
};
