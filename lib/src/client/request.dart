import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import './spymetrics_date.dart';

part 'request.g.dart';

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class SpymetricsRequest {
  SpymetricsRequest({
    this.granularity,
    this.mainDomainOnly,
    this.format,
    this.domain,
    this.startDate,
    this.endDate,
    this.country,
  });
  SpymetricsRequest.json({
    this.granularity,
    this.mainDomainOnly,
    this.domain,
    this.startDate,
    this.endDate,
    this.country,
  }) : format = 'json';
  SpymetricsRequest.xml({
    this.granularity,
    this.mainDomainOnly,
    this.domain,
    this.startDate,
    this.endDate,
    this.country,
  }) : format = 'xml';
  //
  SpymetricsRequest.mainDomainOnly({
    this.granularity,
    this.domain,
    this.startDate,
    this.endDate,
    this.country,
    this.format = 'json',
  }) : mainDomainOnly = true;
  //
  SpymetricsRequest.daily({
    this.domain,
    this.startDate,
    this.endDate,
    this.country,
    this.mainDomainOnly = false,
    this.format = 'json',
  }) : granularity = SpymetricsGranularity.daily;
  SpymetricsRequest.weekly({
    this.domain,
    this.startDate,
    this.endDate,
    this.country,
    this.mainDomainOnly = false,
    this.format = 'json',
  }) : granularity = SpymetricsGranularity.weekly;
  SpymetricsRequest.monthly({
    this.domain,
    this.startDate,
    this.endDate,
    this.country,
    this.mainDomainOnly = false,
    this.format = 'json',
  }) : granularity = SpymetricsGranularity.monthly;

  factory SpymetricsRequest.fromJson(Map<String, dynamic> json) =>
      _$SpymetricsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SpymetricsRequestToJson(this);
  //
  //
  //
  @SpymetricsGranularityConverter()
  final SpymetricsGranularity? granularity;
  final bool? mainDomainOnly;
  final String? format;
  final String? domain;
  @SpymetricsDateConverter()
  final SpymetricsDate? startDate;
  @SpymetricsDateConverter()
  final SpymetricsDate? endDate;
  final String? country;
}

///
///
///
@JsonEnum()
enum SpymetricsGranularity {
  @JsonValue('Daily')
  // @JsonValue('daily')
  daily,

  @JsonValue('Weekly')
  // @JsonValue('weekly')
  weekly,

  @JsonValue('Monthly')
  // @JsonValue('monthly')
  monthly,
} // TODO: implement SpymetricsGranularity

// cause of Monthly <-> monthly and etc
class SpymetricsGranularityConverter
    implements JsonConverter<SpymetricsGranularity?, String?> {
  const SpymetricsGranularityConverter();

  static const Map<String, SpymetricsGranularity> _mapping = {
    'daily': SpymetricsGranularity.daily,
    'weekly': SpymetricsGranularity.weekly,
    'monthly': SpymetricsGranularity.monthly,
  };

  @override
  SpymetricsGranularity? fromJson(String? json) {
    if (json == null) return null;
    return _mapping[json.toLowerCase()];
  }

  @override
  String? toJson(SpymetricsGranularity? object) {
    if (object == null) return null;
    // choose canonical output (lowercase or capitalized)
    return object.name.toLowerCase();
  }
}
