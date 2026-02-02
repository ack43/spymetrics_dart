import 'package:json_annotation/json_annotation.dart';

import './capabilities.dart';
import '../client/response.dart';
import '../client/spymetrics_date.dart';

part 'describe_data.g.dart';

//
//
//
//
//
@JsonSerializable(fieldRename: FieldRename.snake)
class CountryDescribeRequestData extends SnapshotInterval {
  CountryDescribeRequestData({super.startDate, super.endDate, this.freshData});

  final SpymetricsDate? freshData;

  factory CountryDescribeRequestData.fromJson(Map<String, dynamic> json) =>
      _$CountryDescribeRequestDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CountryDescribeRequestDataToJson(this);
}

//
//
//
//
//
class CountriesData {
  final Map<String, CountryDescribeRequestData> data;

  const CountriesData(this.data);

  factory CountriesData.fromJson(Map<String, dynamic> json) => CountriesData(
    json.map(
      (k, v) => MapEntry(
        k,
        CountryDescribeRequestData.fromJson(v as Map<String, dynamic>),
      ),
    ),
  );

  Map<String, dynamic> toJson() => data.map((k, v) => MapEntry(k, v.toJson()));

  CountryDescribeRequestData? operator [](String key) => data[key];
}

//
//
//
//
//
@JsonSerializable(fieldRename: FieldRename.snake)
class RequestDescribeData {
  RequestDescribeData({this.countries});

  final CountriesData? countries;

  factory RequestDescribeData.fromJson(Map<String, dynamic> json) =>
      _$RequestDescribeDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDescribeDataToJson(this);
}

//
//
//
//
//
class DescribeData {
  final Map<String, RequestDescribeData> data;

  const DescribeData(this.data);

  factory DescribeData.fromJson(Map<String, dynamic> json) => DescribeData(
    json.map(
      (k, v) =>
          MapEntry(k, RequestDescribeData.fromJson(v as Map<String, dynamic>)),
    ),
  );

  Map<String, dynamic> toJson() => data.map((k, v) => MapEntry(k, v.toJson()));

  RequestDescribeData? operator [](String key) => data[key];
}

//
//
//
//
//
//
@JsonSerializable(fieldRename: FieldRename.snake)
class DescribeDataResponse {
  final DescribeData? response;

  const DescribeDataResponse({this.response});

  factory DescribeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeDataResponseToJson(this);
}
