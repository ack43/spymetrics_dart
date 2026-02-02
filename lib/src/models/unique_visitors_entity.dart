import 'package:json_annotation/json_annotation.dart';

import '../client/response.dart';
import '../client/spymetrics_date.dart';

part 'unique_visitors_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UniqueVisitorsEntity {
  const UniqueVisitorsEntity({this.date, this.uniqueVisitors});
  //
  final SpymetricsDate? date;
  final double? uniqueVisitors;

  factory UniqueVisitorsEntity.fromJson(Map<String, dynamic> json) =>
      _$UniqueVisitorsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UniqueVisitorsEntityToJson(this);
}

//
//
//

@JsonSerializable(fieldRename: FieldRename.snake)
class UniqueVisitorsResponse extends SpymetricsResponse {
  final List<UniqueVisitorsEntity>? uniqueVisitors;
  const UniqueVisitorsResponse({super.meta, this.uniqueVisitors});

  factory UniqueVisitorsResponse.fromJson(Map<String, dynamic> json) =>
      _$UniqueVisitorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UniqueVisitorsResponseToJson(this);
}
