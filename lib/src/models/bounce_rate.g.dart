// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bounce_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BounceRateEntity _$BounceRateEntityFromJson(Map<String, dynamic> json) =>
    BounceRateEntity(
      date: const SpymetricsDateExtConverter().fromJson(
        json['date'] as String?,
      ),
      bounceRate: (json['bounce_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BounceRateEntityToJson(BounceRateEntity instance) =>
    <String, dynamic>{
      'date': const SpymetricsDateExtConverter().toJson(instance.date),
      'bounce_rate': instance.bounceRate,
    };

BounceRateResponse _$BounceRateResponseFromJson(Map<String, dynamic> json) =>
    BounceRateResponse(
      meta: SpymetricsResponseMeta.fromJson(
        json['meta'] as Map<String, dynamic>,
      ),
      bounceRate: (json['bounce_rate'] as List<dynamic>?)
          ?.map((e) => BounceRateEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BounceRateResponseToJson(BounceRateResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'bounce_rate': instance.bounceRate,
    };
