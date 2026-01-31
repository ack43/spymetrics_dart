// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalRankEntity _$GlobalRankEntityFromJson(Map<String, dynamic> json) =>
    GlobalRankEntity(
      date: const SpymetricsDateExtConverter().fromJson(
        json['date'] as String?,
      ),
      globalRank: (json['global_rank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GlobalRankEntityToJson(GlobalRankEntity instance) =>
    <String, dynamic>{
      'date': const SpymetricsDateExtConverter().toJson(instance.date),
      'global_rank': instance.globalRank,
    };

GlobalRankResponse _$GlobalRankResponseFromJson(Map<String, dynamic> json) =>
    GlobalRankResponse(
      meta: SpymetricsResponseMeta.fromJson(
        json['meta'] as Map<String, dynamic>,
      ),
      globalRank: (json['global_rank'] as List<dynamic>?)
          ?.map((e) => GlobalRankEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GlobalRankResponseToJson(GlobalRankResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'global_rank': instance.globalRank,
    };
