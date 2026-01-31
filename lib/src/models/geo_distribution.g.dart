// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_distribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoDistributionEntity _$GeoDistributionEntityFromJson(
  Map<String, dynamic> json,
) => GeoDistributionEntity(
  rank: (json['rank'] as num?)?.toInt(),
  country: (json['country'] as num?)?.toInt(),
  countryName: json['country_name'] as String?,
  share: (json['share'] as num?)?.toDouble(),
  change: (json['change'] as num?)?.toDouble(),
  pagesPerVisit: (json['pages_per_visit'] as num?)?.toDouble(),
  averageTime: (json['average_time'] as num?)?.toDouble(),
  bounceRate: (json['bounce_rate'] as num?)?.toDouble(),
);

Map<String, dynamic> _$GeoDistributionEntityToJson(
  GeoDistributionEntity instance,
) => <String, dynamic>{
  'rank': instance.rank,
  'country_name': instance.countryName,
  'country': instance.country,
  'share': instance.share,
  'change': instance.change,
  'pages_per_visit': instance.pagesPerVisit,
  'average_time': instance.averageTime,
  'bounce_rate': instance.bounceRate,
};

GeoDistributionResponse _$GeoDistributionResponseFromJson(
  Map<String, dynamic> json,
) => GeoDistributionResponse(
  meta: SpymetricsResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
  records: (json['records'] as List<dynamic>?)
      ?.map((e) => GeoDistributionEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GeoDistributionResponseToJson(
  GeoDistributionResponse instance,
) => <String, dynamic>{'meta': instance.meta, 'records': instance.records};
