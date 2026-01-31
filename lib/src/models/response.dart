import 'package:json_annotation/json_annotation.dart';

import './request.dart';

part 'response.g.dart';

// @JsonSerializable(
//   fieldRename: FieldRename.snake,
//   genericArgumentFactories: true,
// )
abstract class SpymetricsResponse {
  final SpymetricsResponseMeta meta;

  SpymetricsResponse({required this.meta});
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SpymetricsResponseMeta {
  final SpymetricsRequest request;
  final String status;
  final DateTime? lastUpdated;
  final int? hitCost;

  @JsonKey(name: 'error_code')
  final int? errorCode;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  SpymetricsResponseMeta({
    required this.request,
    required this.status,
    this.lastUpdated,
    this.hitCost,
    this.errorCode,
    this.errorMessage,
  });

  factory SpymetricsResponseMeta.fromJson(Map<String, dynamic> json) =>
      _$SpymetricsResponseMetaFromJson(json);

  Map<String, dynamic> toJson() => _$SpymetricsResponseMetaToJson(this);

  bool get isSuccess => status == 'Success';
}
