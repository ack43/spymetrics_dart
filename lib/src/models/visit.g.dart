// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitEntity _$VisitEntityFromJson(Map<String, dynamic> json) => VisitEntity(
  date: const SpymetricsDateExtConverter().fromJson(json['date'] as String?),
  visits: (json['visits'] as num?)?.toDouble(),
);

Map<String, dynamic> _$VisitEntityToJson(VisitEntity instance) =>
    <String, dynamic>{
      'date': const SpymetricsDateExtConverter().toJson(instance.date),
      'visits': instance.visits,
    };

VisitsResponse _$VisitsResponseFromJson(Map<String, dynamic> json) =>
    VisitsResponse(
      meta: SpymetricsResponseMeta.fromJson(
        json['meta'] as Map<String, dynamic>,
      ),
      visits: (json['visits'] as List<dynamic>?)
          ?.map((e) => VisitEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VisitsResponseToJson(VisitsResponse instance) =>
    <String, dynamic>{'meta': instance.meta, 'visits': instance.visits};
