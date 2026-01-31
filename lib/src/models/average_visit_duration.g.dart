// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'average_visit_duration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AverageVisitDurationEntity _$AverageVisitDurationEntityFromJson(
  Map<String, dynamic> json,
) => AverageVisitDurationEntity(
  date: const SpymetricsDateExtConverter().fromJson(json['date'] as String?),
  averageVisitDuration: (json['average_visit_duration'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AverageVisitDurationEntityToJson(
  AverageVisitDurationEntity instance,
) => <String, dynamic>{
  'date': const SpymetricsDateExtConverter().toJson(instance.date),
  'average_visit_duration': instance.averageVisitDuration,
};

AverageVisitDurationResponse _$AverageVisitDurationResponseFromJson(
  Map<String, dynamic> json,
) => AverageVisitDurationResponse(
  meta: SpymetricsResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
  averageVisitDuration: (json['average_visit_duration'] as List<dynamic>?)
      ?.map(
        (e) => AverageVisitDurationEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$AverageVisitDurationResponseToJson(
  AverageVisitDurationResponse instance,
) => <String, dynamic>{
  'meta': instance.meta,
  'average_visit_duration': instance.averageVisitDuration,
};
