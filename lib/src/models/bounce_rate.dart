import 'package:json_annotation/json_annotation.dart';

import '../client/response.dart';
import '../client/spymetrics_date.dart';

part 'bounce_rate.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BounceRateEntity {
  const BounceRateEntity({this.date, this.bounceRate});
  @SpymetricsDateExtConverter()
  final SpymetricsDateExt? date;
  final double? bounceRate;

  factory BounceRateEntity.fromJson(Map<String, dynamic> json) =>
      _$BounceRateEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BounceRateEntityToJson(this);
}

//
//
//

@JsonSerializable(fieldRename: FieldRename.snake)
class BounceRateResponse extends SpymetricsResponse {
  final List<BounceRateEntity>? bounceRate;

  const BounceRateResponse({super.meta, this.bounceRate});

  factory BounceRateResponse.fromJson(Map<String, dynamic> json) =>
      _$BounceRateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BounceRateResponseToJson(this);
}
