import 'package:json_annotation/json_annotation.dart';

import '../client/spymetrics_date.dart';

part 'capabilities.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CapabilitiesResponse {
  final int? remainingHits;
  final WebData? webDesktopData;
  final WebData? webMobileData;

  const CapabilitiesResponse({
    this.remainingHits,
    this.webDesktopData,
    this.webMobileData,
  });

  factory CapabilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$CapabilitiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CapabilitiesResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WebData {
  final List<CountryData>? countries;
  final SnapshotInterval? snapshotInterval;

  const WebData({this.countries, this.snapshotInterval});

  factory WebData.fromJson(Map<String, dynamic> json) =>
      _$WebDataFromJson(json);

  Map<String, dynamic> toJson() => _$WebDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CountryData {
  final String? code;
  final String? name;

  const CountryData({this.code, this.name});

  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SnapshotInterval {
  final SpymetricsDate? startDate;
  final SpymetricsDate? endDate;

  const SnapshotInterval({this.startDate, this.endDate});

  factory SnapshotInterval.fromJson(Map<String, dynamic> json) =>
      _$SnapshotIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$SnapshotIntervalToJson(this);
}
