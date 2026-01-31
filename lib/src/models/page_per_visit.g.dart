// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_per_visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagesPerVisitPoint _$PagesPerVisitPointFromJson(Map<String, dynamic> json) =>
    PagesPerVisitPoint(
      date: json['date'] as String?,
      pagesPerVisit: (json['pages_per_visit'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PagesPerVisitPointToJson(PagesPerVisitPoint instance) =>
    <String, dynamic>{
      'date': instance.date,
      'pages_per_visit': instance.pagesPerVisit,
    };

PagesPerVisitResponse _$PagesPerVisitResponseFromJson(
  Map<String, dynamic> json,
) => PagesPerVisitResponse(
  meta: SpymetricsResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
  pagesPerVisit: (json['pages_per_visit'] as List<dynamic>?)
      ?.map((e) => PagesPerVisitPoint.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PagesPerVisitResponseToJson(
  PagesPerVisitResponse instance,
) => <String, dynamic>{
  'meta': instance.meta,
  'pages_per_visit': instance.pagesPerVisit,
};
