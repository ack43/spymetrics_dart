import 'package:json_annotation/json_annotation.dart';

import '../client/response.dart';
import '../client/spymetrics_date.dart';

part 'average_visit_duration.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AverageVisitDurationEntity {
  const AverageVisitDurationEntity({this.date, this.averageVisitDuration});
  @SpymetricsDateExtConverter()
  final SpymetricsDateExt? date;
  final double? averageVisitDuration;

  factory AverageVisitDurationEntity.fromJson(Map<String, dynamic> json) =>
      _$AverageVisitDurationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AverageVisitDurationEntityToJson(this);
}

//
//
//

@JsonSerializable(fieldRename: FieldRename.snake)
class AverageVisitDurationResponse extends SpymetricsResponse {
  final List<AverageVisitDurationEntity>? averageVisitDuration;

  const AverageVisitDurationResponse({super.meta, this.averageVisitDuration});

  factory AverageVisitDurationResponse.fromJson(Map<String, dynamic> json) =>
      _$AverageVisitDurationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AverageVisitDurationResponseToJson(this);
}
