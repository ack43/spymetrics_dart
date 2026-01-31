// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SpymetricsRequestCWProxy {
  SpymetricsRequest granularity(SpymetricsGranularity? granularity);

  SpymetricsRequest mainDomainOnly(bool? mainDomainOnly);

  SpymetricsRequest format(String? format);

  SpymetricsRequest domain(String? domain);

  SpymetricsRequest startDate(SpymetricsDate? startDate);

  SpymetricsRequest endDate(SpymetricsDate? endDate);

  SpymetricsRequest country(String? country);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SpymetricsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SpymetricsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SpymetricsRequest call({
    SpymetricsGranularity? granularity,
    bool? mainDomainOnly,
    String? format,
    String? domain,
    SpymetricsDate? startDate,
    SpymetricsDate? endDate,
    String? country,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSpymetricsRequest.copyWith(...)` or call `instanceOfSpymetricsRequest.copyWith.fieldName(value)` for a single field.
class _$SpymetricsRequestCWProxyImpl implements _$SpymetricsRequestCWProxy {
  const _$SpymetricsRequestCWProxyImpl(this._value);

  final SpymetricsRequest _value;

  @override
  SpymetricsRequest granularity(SpymetricsGranularity? granularity) =>
      call(granularity: granularity);

  @override
  SpymetricsRequest mainDomainOnly(bool? mainDomainOnly) =>
      call(mainDomainOnly: mainDomainOnly);

  @override
  SpymetricsRequest format(String? format) => call(format: format);

  @override
  SpymetricsRequest domain(String? domain) => call(domain: domain);

  @override
  SpymetricsRequest startDate(SpymetricsDate? startDate) =>
      call(startDate: startDate);

  @override
  SpymetricsRequest endDate(SpymetricsDate? endDate) => call(endDate: endDate);

  @override
  SpymetricsRequest country(String? country) => call(country: country);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SpymetricsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SpymetricsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SpymetricsRequest call({
    Object? granularity = const $CopyWithPlaceholder(),
    Object? mainDomainOnly = const $CopyWithPlaceholder(),
    Object? format = const $CopyWithPlaceholder(),
    Object? domain = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
  }) {
    return SpymetricsRequest(
      granularity: granularity == const $CopyWithPlaceholder()
          ? _value.granularity
          // ignore: cast_nullable_to_non_nullable
          : granularity as SpymetricsGranularity?,
      mainDomainOnly: mainDomainOnly == const $CopyWithPlaceholder()
          ? _value.mainDomainOnly
          // ignore: cast_nullable_to_non_nullable
          : mainDomainOnly as bool?,
      format: format == const $CopyWithPlaceholder()
          ? _value.format
          // ignore: cast_nullable_to_non_nullable
          : format as String?,
      domain: domain == const $CopyWithPlaceholder()
          ? _value.domain
          // ignore: cast_nullable_to_non_nullable
          : domain as String?,
      startDate: startDate == const $CopyWithPlaceholder()
          ? _value.startDate
          // ignore: cast_nullable_to_non_nullable
          : startDate as SpymetricsDate?,
      endDate: endDate == const $CopyWithPlaceholder()
          ? _value.endDate
          // ignore: cast_nullable_to_non_nullable
          : endDate as SpymetricsDate?,
      country: country == const $CopyWithPlaceholder()
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String?,
    );
  }
}

extension $SpymetricsRequestCopyWith on SpymetricsRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSpymetricsRequest.copyWith(...)` or `instanceOfSpymetricsRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SpymetricsRequestCWProxy get copyWith =>
      _$SpymetricsRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpymetricsRequest _$SpymetricsRequestFromJson(Map<String, dynamic> json) =>
    SpymetricsRequest(
      granularity: $enumDecodeNullable(
        _$SpymetricsGranularityEnumMap,
        json['granularity'],
      ),
      mainDomainOnly: json['main_domain_only'] as bool?,
      format: json['format'] as String?,
      domain: json['domain'] as String?,
      startDate: json['start_date'] == null
          ? null
          : SpymetricsDate.fromJson(json['start_date'] as String?),
      endDate: json['end_date'] == null
          ? null
          : SpymetricsDate.fromJson(json['end_date'] as String?),
      country: json['country'] as String?,
    );

Map<String, dynamic> _$SpymetricsRequestToJson(SpymetricsRequest instance) =>
    <String, dynamic>{
      'granularity': ?_$SpymetricsGranularityEnumMap[instance.granularity],
      'main_domain_only': ?instance.mainDomainOnly,
      'format': ?instance.format,
      'domain': ?instance.domain,
      'start_date': ?instance.startDate,
      'end_date': ?instance.endDate,
      'country': ?instance.country,
    };

const _$SpymetricsGranularityEnumMap = {
  SpymetricsGranularity.daily: 'Daily',
  SpymetricsGranularity.weekly: 'Weekly',
  SpymetricsGranularity.monthly: 'Monthly',
};
