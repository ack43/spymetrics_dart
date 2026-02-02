import 'package:json_annotation/json_annotation.dart';

import '../client/response.dart';
import '../client/spymetrics_date.dart';

part 'visit.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VisitEntity {
  const VisitEntity({this.date, this.visits});
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

  const VisitsResponse({super.meta, this.visits});

  factory VisitsResponse.fromJson(Map<String, dynamic> json) =>
      _$VisitsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VisitsResponseToJson(this);
}
