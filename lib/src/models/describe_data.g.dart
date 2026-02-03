// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'describe_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDescribeRequestData _$CountryDescribeRequestDataFromJson(
  Map<String, dynamic> json,
) => CountryDescribeRequestData(
  startDate: json['start_date'] == null
      ? null
      : SpymetricsDate.fromJson(json['start_date'] as String?),
  endDate: json['end_date'] == null
      ? null
      : SpymetricsDate.fromJson(json['end_date'] as String?),
  freshData: json['fresh_data'] == null
      ? null
      : SpymetricsDate.fromJson(json['fresh_data'] as String?),
);

Map<String, dynamic> _$CountryDescribeRequestDataToJson(
  CountryDescribeRequestData instance,
) => <String, dynamic>{
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'fresh_data': instance.freshData,
};

RequestDescribeData _$RequestDescribeDataFromJson(Map<String, dynamic> json) =>
    RequestDescribeData(
      countries: json['countries'] == null
          ? null
          : CountriesData.fromJson(json['countries'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestDescribeDataToJson(
  RequestDescribeData instance,
) => <String, dynamic>{'countries': instance.countries};

DescribeResponse _$DescribeDataResponseFromJson(Map<String, dynamic> json) =>
    DescribeResponse(
      response: json['response'] == null
          ? null
          : DescribeData.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DescribeDataResponseToJson(DescribeResponse instance) =>
    <String, dynamic>{'response': instance.response};
