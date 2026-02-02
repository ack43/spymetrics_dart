# spymetrics_dart

Unofficial **Spymetrics API client for Dart**, built with **Dio** and **Retrofit**.

This package provides a clean, typed client for accessing Spymetrics traffic,
engagement, and ranking endpoints for **Desktop**, **Mobile Web**, and
**Total Traffic**.

> ⚠️ Unofficial client. See official docs:  
> https://api.spymetrics.ru/

---

## Features

- ✅ Unified `SpymetricsClient`
- ✅ Dio + Retrofit powered
- ✅ Typed request & response models
- ✅ Automatic API wrapper access
- ✅ Desktop / Mobile Web / Total Traffic APIs
- ✅ Backend & CLI friendly

---
<!-- 
## Installation

```yaml
dependencies:
  spymetrics_dart: ^0.1.0
```

```bash
dart pub get
```

---
-->
## Quick Start

### Create client

```dart
final client = SpymetricsClient('<YOUR_API_TOKEN>');
```

Custom base URL:

```dart
final client = SpymetricsClient.baseUrl(
  'https://api.spymetrics.ru',
  apiKey: '<YOUR_API_TOKEN>',
);
```

Using existing Dio:

```dart
final dio = Dio();
final client = SpymetricsClient.dio(
  dio,
  apiKey: '<YOUR_API_TOKEN>',
);
```

---

## API Access

All APIs are available through a single entry point:

```dart
client.api.totalTraffic
client.api.desktopTraffic
client.api.mobileTraffic
```

---

## Example Request

```dart
final response = await client.api.totalTraffic.visits(
  'amazon.com',
  SpymetricsRequest.json(
    startDate: SpymetricsDate(DateTime(2024, 1)),
    endDate: SpymetricsDate(DateTime(2024, 12)),
    country: 'world',
  ),
);

print(response.meta.status);
print(response.visits);
```

---

## Available APIs

### Total Traffic

```dart
client.api.totalTraffic.visits(...)
client.api.totalTraffic.pagesPerVisit(...)
client.api.totalTraffic.averageVisitDuration(...)
client.api.totalTraffic.bounceRate(...)
client.api.totalTraffic.visitsSplit(...)
```

---

### Desktop Traffic

```dart
client.api.desktopTraffic.visits(...)
client.api.desktopTraffic.pagesPerVisit(...)
client.api.desktopTraffic.averageVisitDuration(...)
client.api.desktopTraffic.bounceRate(...)
client.api.desktopTraffic.globalRank(...)
client.api.desktopTraffic.countryRank(...)
client.api.desktopTraffic.geoDistribution(...)
client.api.desktopTraffic.uniqueVisitors(...)
```

---

### Mobile Web Traffic

```dart
client.api.mobileTraffic.visits(...)
client.api.mobileTraffic.pagesPerVisit(...)
client.api.mobileTraffic.averageVisitDuration(...)
client.api.mobileTraffic.bounceRate(...)
client.api.mobileTraffic.uniqueVisitors(...)
```

---

## Dates

### Monthly (default)

```dart
SpymetricsDate(DateTime(2024, 1)) // → "2024-01"
```

### Daily

```dart
SpymetricsDateExt(DateTime(2024, 1, 15)) // → "2024-01-15"
```

---

## Error Handling

```dart
try {
  final response = await client.api.totalTraffic.visits(...);
} on DioException catch (e) {
  print(e.message);
}
```

API-level errors are returned in `response.meta`.

---

## Code Generation

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Requirements

- Dart SDK >= 3.0
- Spymetrics API token

---

## Disclaimer

This package is **not affiliated** with Spymetrics.
Use at your own risk and respect API limits and terms.

---

## License

MIT
