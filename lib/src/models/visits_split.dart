import 'package:json_annotation/json_annotation.dart';

import '../client/response.dart';
import '../client/spymetrics_date.dart';

part 'visits_split.g.dart';

// @JsonSerializable(fieldRename: FieldRename.snake)
// class VisitsSplitEntity {
//   VisitsSplitEntity({required this.date, required this.visitsSplit});
//   @SpymetricsDateExtConverter()
//   final SpymetricsDateExt? date;
//   final double? visitsSplit;

//   factory VisitsSplitEntity.fromJson(Map<String, dynamic> json) =>
//       _$VisitsSplitEntityFromJson(json);

//   Map<String, dynamic> toJson() => _$VisitsSplitEntityToJson(this);
// }

//
//
//

@JsonSerializable(fieldRename: FieldRename.snake)
class VisitsSplitResponse extends SpymetricsResponse {
  // final List<VisitsSplitEntity>? visitsSplit;
  // VisitsSplitResponse({required super.meta, this.visitsSplit});

  final double? desktopVisitShare;
  final double? mobileWebVisitShare;
  VisitsSplitResponse({
    required super.meta,
    this.desktopVisitShare,
    this.mobileWebVisitShare,
  });

  factory VisitsSplitResponse.fromJson(Map<String, dynamic> json) =>
      _$VisitsSplitResponseFromJson(json);
}
