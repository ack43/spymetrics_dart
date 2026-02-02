import 'package:json_annotation/json_annotation.dart';

import '../client/response.dart';
import '../client/spymetrics_date.dart';

part 'page_per_visit.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PagesPerVisitEntity {
  const PagesPerVisitEntity({this.date, this.pagesPerVisit});
  @SpymetricsDateExtConverter()
  final SpymetricsDateExt? date;
  final double? pagesPerVisit;

  factory PagesPerVisitEntity.fromJson(Map<String, dynamic> json) =>
      _$PagesPerVisitEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PagesPerVisitEntityToJson(this);
}

//
//
//

@JsonSerializable(fieldRename: FieldRename.snake)
class PagesPerVisitResponse extends SpymetricsResponse {
  final List<PagesPerVisitEntity>? pagesPerVisit;

  const PagesPerVisitResponse({super.meta, this.pagesPerVisit});

  factory PagesPerVisitResponse.fromJson(Map<String, dynamic> json) =>
      _$PagesPerVisitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PagesPerVisitResponseToJson(this);
}
