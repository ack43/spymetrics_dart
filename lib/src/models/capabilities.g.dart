// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CapabilitiesResponse _$CapabilitiesResponseFromJson(
  Map<String, dynamic> json,
) => CapabilitiesResponse(
  remainingHits: (json['remaining_hits'] as num?)?.toInt(),
  webDesktopData: json['web_desktop_data'] == null
      ? null
      : WebData.fromJson(json['web_desktop_data'] as Map<String, dynamic>),
  webMobileData: json['web_mobile_data'] == null
      ? null
      : WebData.fromJson(json['web_mobile_data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CapabilitiesResponseToJson(
  CapabilitiesResponse instance,
) => <String, dynamic>{
  'remaining_hits': instance.remainingHits,
  'web_desktop_data': instance.webDesktopData,
  'web_mobile_data': instance.webMobileData,
};

WebData _$WebDataFromJson(Map<String, dynamic> json) => WebData(
  countries: (json['countries'] as List<dynamic>?)
      ?.map((e) => CountryData.fromJson(e as Map<String, dynamic>))
      .toList(),
  snapshotInterval: json['snapshot_interval'] == null
      ? null
      : SnapshotInterval.fromJson(
          json['snapshot_interval'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$WebDataToJson(WebData instance) => <String, dynamic>{
  'countries': instance.countries,
  'snapshot_interval': instance.snapshotInterval,
};

CountryData _$CountryDataFromJson(Map<String, dynamic> json) =>
    CountryData(code: json['code'] as String?, name: json['name'] as String?);

Map<String, dynamic> _$CountryDataToJson(CountryData instance) =>
    <String, dynamic>{'code': instance.code, 'name': instance.name};

SnapshotInterval _$SnapshotIntervalFromJson(Map<String, dynamic> json) =>
    SnapshotInterval(
      startDate: json['start_date'] == null
          ? null
          : SpymetricsDate.fromJson(json['start_date'] as String?),
      endDate: json['end_date'] == null
          ? null
          : SpymetricsDate.fromJson(json['end_date'] as String?),
    );

Map<String, dynamic> _$SnapshotIntervalToJson(SnapshotInterval instance) =>
    <String, dynamic>{
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
