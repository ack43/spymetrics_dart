import 'package:json_annotation/json_annotation.dart';

class SpymetricsDate {
  SpymetricsDate(this.date);
  SpymetricsDate.fromJson(String? dateString) {
    if (dateString == null) {
      date = null;
      return;
    }

    final parts = dateString.split('-');
    if (parts.length == 1) {
      date = DateTime.parse("$dateString-01-01"); // or 12?
    } else if (parts.length == 2) {
      date = DateTime.parse("$dateString-01"); // or 28-31?
    } else {
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);

      date = DateTime(year, month, 1);
    }
  }
  DateTime? date;

  int get year => date!.year;
  int get month => date!.month;
  String get yearMonth => '$year-${month.toString().padLeft(2, '0')}';

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

  String toJson() => yearMonth;

  @override
  String toString() => yearMonth;
}
//

class SpymetricsDateExt extends SpymetricsDate {
  SpymetricsDateExt(super.date) : super();

  /// Create from existing SpymetricsDate, optionally override day
  factory SpymetricsDateExt.from(SpymetricsDate spymetricsDate, {int? day}) {
    final original = spymetricsDate.date!;
    final newDate = DateTime(
      original.year,
      original.month,
      day ?? original.day,
    );
    return SpymetricsDateExt(newDate);
  }

  int get day => date!.day;

  String get yearMonthDay => '$yearMonth-${day.toString().padLeft(2, '0')}';

  @override
  String toJson() => yearMonthDay;

  @override
  String toString() => yearMonthDay;
}

///
///
/// CONVERTERS
///

class SpymetricsDateConverter
    implements JsonConverter<SpymetricsDate?, String?> {
  const SpymetricsDateConverter();

  @override
  SpymetricsDate? fromJson(String? json) {
    try {
      return json == null ? null : SpymetricsDate.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  @override
  String? toJson(SpymetricsDate? object) => object?.toJson();
}

///
class SpymetricsDateExtConverter
    implements JsonConverter<SpymetricsDateExt?, String?> {
  const SpymetricsDateExtConverter();

  @override
  SpymetricsDateExt? fromJson(String? json) {
    try {
      return json == null
          ? null
          : (json.split("-").length == 3
                ? SpymetricsDateExt(DateTime.parse(json))
                : SpymetricsDateExt.from(SpymetricsDate.fromJson(json)));
    } catch (e) {
      return null;
    }
  }

  @override
  String? toJson(SpymetricsDateExt? object) => object?.toJson();
}
