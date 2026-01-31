import 'package:json_annotation/json_annotation.dart';

import './response.dart';

part 'page_per_visit.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PagesPerVisitPoint {
  PagesPerVisitPoint({required this.date, required this.pagesPerVisit});
  final String? date;
  final double? pagesPerVisit;

  factory PagesPerVisitPoint.fromJson(Map<String, dynamic> json) =>
      _$PagesPerVisitPointFromJson(json);

  Map<String, dynamic> toJson() => _$PagesPerVisitPointToJson(this);
}

//
//
//

@JsonSerializable(fieldRename: FieldRename.snake)
class PagesPerVisitResponse extends SpymetricsResponse {
  final List<PagesPerVisitPoint>? pagesPerVisit;

  PagesPerVisitResponse({required super.meta, this.pagesPerVisit});

  factory PagesPerVisitResponse.fromJson(Map<String, dynamic> json) =>
      _$PagesPerVisitResponseFromJson(json);
}
