import 'package:json_annotation/json_annotation.dart';

import '../client/response.dart';
import '../client/spymetrics_date.dart';

part 'geo_distribution.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GeoDistributionEntity {
  GeoDistributionEntity({
    this.rank,
    this.country,
    this.countryName,
    this.share,
    this.change,
    this.pagesPerVisit,
    this.averageTime,
    this.bounceRate,
  });
  //
  final int? rank;
  final String? countryName;
  //
  final int? country;
  final double? share;
  final double? change;
  final double? pagesPerVisit;
  final double? averageTime;
  final double? bounceRate;

  factory GeoDistributionEntity.fromJson(Map<String, dynamic> json) =>
      _$GeoDistributionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GeoDistributionEntityToJson(this);
}

//
//
//

@JsonSerializable(fieldRename: FieldRename.snake)
class GeoDistributionResponse extends SpymetricsResponse {
  final List<GeoDistributionEntity>? records;
  GeoDistributionResponse({required super.meta, this.records});

  factory GeoDistributionResponse.fromJson(Map<String, dynamic> json) =>
      _$GeoDistributionResponseFromJson(json);
}
