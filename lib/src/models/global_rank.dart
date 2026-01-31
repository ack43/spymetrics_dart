import 'package:json_annotation/json_annotation.dart';

import '../client/response.dart';
import '../client/spymetrics_date.dart';

part 'global_rank.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GlobalRankEntity {
  GlobalRankEntity({required this.date, required this.globalRank});
  @SpymetricsDateExtConverter()
  final SpymetricsDateExt? date;
  final int? globalRank;

  factory GlobalRankEntity.fromJson(Map<String, dynamic> json) =>
      _$GlobalRankEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalRankEntityToJson(this);
}

//
//
//

@JsonSerializable(fieldRename: FieldRename.snake)
class GlobalRankResponse extends SpymetricsResponse {
  final List<GlobalRankEntity>? globalRank;

  GlobalRankResponse({required super.meta, this.globalRank});

  factory GlobalRankResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalRankResponseFromJson(json);
}
