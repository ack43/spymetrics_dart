import 'package:json_annotation/json_annotation.dart';

import './response.dart';

part 'visit.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VisitPoint {
  VisitPoint({required this.date, required this.visits});
  final String? date;
  final double? visits;

  factory VisitPoint.fromJson(Map<String, dynamic> json) =>
      _$VisitPointFromJson(json);

  Map<String, dynamic> toJson() => _$VisitPointToJson(this);
}

//
//
//

@JsonSerializable(fieldRename: FieldRename.snake)
class VisitsResponse extends SpymetricsResponse {
  final List<VisitPoint>? visits;

  VisitsResponse({required super.meta, this.visits});

  factory VisitsResponse.fromJson(Map<String, dynamic> json) =>
      _$VisitsResponseFromJson(json);
}
