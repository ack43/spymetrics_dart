// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_per_visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagesPerVisitEntity _$PagesPerVisitEntityFromJson(Map<String, dynamic> json) =>
    PagesPerVisitEntity(
      date: const SpymetricsDateExtConverter().fromJson(
        json['date'] as String?,
      ),
      pagesPerVisit: (json['pages_per_visit'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PagesPerVisitEntityToJson(
  PagesPerVisitEntity instance,
) => <String, dynamic>{
  'date': const SpymetricsDateExtConverter().toJson(instance.date),
  'pages_per_visit': instance.pagesPerVisit,
};

PagesPerVisitResponse _$PagesPerVisitResponseFromJson(
  Map<String, dynamic> json,
) => PagesPerVisitResponse(
  meta: SpymetricsResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
  pagesPerVisit: (json['pages_per_visit'] as List<dynamic>?)
      ?.map((e) => PagesPerVisitEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PagesPerVisitResponseToJson(
  PagesPerVisitResponse instance,
) => <String, dynamic>{
  'meta': instance.meta,
  'pages_per_visit': instance.pagesPerVisit,
};
