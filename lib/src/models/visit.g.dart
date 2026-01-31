// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitPoint _$VisitPointFromJson(Map<String, dynamic> json) => VisitPoint(
  date: json['date'] as String?,
  visits: (json['visits'] as num?)?.toDouble(),
);

Map<String, dynamic> _$VisitPointToJson(VisitPoint instance) =>
    <String, dynamic>{'date': instance.date, 'visits': instance.visits};

VisitsResponse _$VisitsResponseFromJson(Map<String, dynamic> json) =>
    VisitsResponse(
      meta: SpymetricsResponseMeta.fromJson(
        json['meta'] as Map<String, dynamic>,
      ),
      visits: (json['visits'] as List<dynamic>?)
          ?.map((e) => VisitPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VisitsResponseToJson(VisitsResponse instance) =>
    <String, dynamic>{'meta': instance.meta, 'visits': instance.visits};
