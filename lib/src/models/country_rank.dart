import 'package:json_annotation/json_annotation.dart';

import '../client/response.dart';
import '../client/spymetrics_date.dart';

part 'country_rank.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CountryRankEntity {
  const CountryRankEntity({this.date, this.countryRank});
  @SpymetricsDateExtConverter()
  final SpymetricsDateExt? date;
  final int? countryRank;

  factory CountryRankEntity.fromJson(Map<String, dynamic> json) =>
      _$CountryRankEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CountryRankEntityToJson(this);
}

//
//
//

@JsonSerializable(fieldRename: FieldRename.snake)
class CountryRankResponse extends SpymetricsResponse {
  final List<CountryRankEntity>? countryRank;

  const CountryRankResponse({super.meta, this.countryRank});

  factory CountryRankResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryRankResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryRankResponseToJson(this);
}
