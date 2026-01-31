import 'package:json_annotation/json_annotation.dart';

import '../client/response.dart';
import '../client/spymetrics_date.dart';

part 'visit.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VisitEntity {
  VisitEntity({required this.date, required this.visits});
  @SpymetricsDateExtConverter()
  final SpymetricsDateExt? date;
  final double? visits;

  factory VisitEntity.fromJson(Map<String, dynamic> json) =>
      _$VisitEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VisitEntityToJson(this);
}

//
//
//

@JsonSerializable(fieldRename: FieldRename.snake)
class VisitsResponse extends SpymetricsResponse {
  final List<VisitEntity>? visits;

  VisitsResponse({required super.meta, this.visits});

  factory VisitsResponse.fromJson(Map<String, dynamic> json) =>
      _$VisitsResponseFromJson(json);
}
