import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

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

  factory SpymetricsRequest.fromJson(Map<String, dynamic> json) =>
      _$SpymetricsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SpymetricsRequestToJson(this);
  //
  //
  //
  final SpymetricsGranularity? granularity;
  final bool? mainDomainOnly;
  final String? format;
  final String? domain;
  final SpymetricsDate? startDate;
  final SpymetricsDate? endDate;
  final String? country;
}

///
///
///
@JsonEnum()
enum SpymetricsGranularity {
  @JsonValue('Daily')
  daily,

  @JsonValue('Weekly')
  weekly,

  @JsonValue('Monthly')
  monthly,
} // TODO: implement SpymetricsGranularity

///
///
///
class SpymetricsDate {
  SpymetricsDate({this.date});
  SpymetricsDate.fromJson(String? dateString) {
    date = DateTime.parse(dateString!);
  }
  DateTime? date;

  int get year => date!.year;
  int get month => date!.month;

  SpymetricsDate add(int months) {
    date!.add(Duration(days: 31 * months));
    return this;
  }

  SpymetricsDate subtract(int months) {
    date!.subtract(Duration(days: 31 * months));
    return this;
  }

  SpymetricsDate inc() => add(1);

  SpymetricsDate dec() => subtract(1);

  String toJson() => '$year-${month.toString().padLeft(2, '0')}';
}
