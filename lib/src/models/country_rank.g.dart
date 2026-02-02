// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryRankEntity _$CountryRankEntityFromJson(Map<String, dynamic> json) =>
    CountryRankEntity(
      date: const SpymetricsDateExtConverter().fromJson(
        json['date'] as String?,
      ),
      countryRank: (json['country_rank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CountryRankEntityToJson(CountryRankEntity instance) =>
    <String, dynamic>{
      'date': const SpymetricsDateExtConverter().toJson(instance.date),
      'country_rank': instance.countryRank,
    };

CountryRankResponse _$CountryRankResponseFromJson(Map<String, dynamic> json) =>
    CountryRankResponse(
      meta: json['meta'] == null
          ? null
          : SpymetricsResponseMeta.fromJson(
              json['meta'] as Map<String, dynamic>,
            ),
      countryRank: (json['country_rank'] as List<dynamic>?)
          ?.map((e) => CountryRankEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryRankResponseToJson(
  CountryRankResponse instance,
) => <String, dynamic>{
  'meta': instance.meta,
  'country_rank': instance.countryRank,
};
