// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unique_visitors_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniqueVisitorsEntity _$UniqueVisitorsEntityFromJson(
  Map<String, dynamic> json,
) => UniqueVisitorsEntity(
  date: json['date'] == null
      ? null
      : SpymetricsDate.fromJson(json['date'] as String?),
  uniqueVisitors: (json['unique_visitors'] as num?)?.toDouble(),
);

Map<String, dynamic> _$UniqueVisitorsEntityToJson(
  UniqueVisitorsEntity instance,
) => <String, dynamic>{
  'date': instance.date,
  'unique_visitors': instance.uniqueVisitors,
};

UniqueVisitorsResponse _$UniqueVisitorsResponseFromJson(
  Map<String, dynamic> json,
) => UniqueVisitorsResponse(
  meta: SpymetricsResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
  uniqueVisitors: (json['unique_visitors'] as List<dynamic>?)
      ?.map((e) => UniqueVisitorsEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UniqueVisitorsResponseToJson(
  UniqueVisitorsResponse instance,
) => <String, dynamic>{
  'meta': instance.meta,
  'unique_visitors': instance.uniqueVisitors,
};
