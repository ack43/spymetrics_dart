import 'package:dio/dio.dart';
import 'package:spymetrics_dart/spymetrics_dart.dart';
// import 'package:spymetrics_dart/src/client/response.dart';

import 'package:spymetrics_dart/models.dart';

import 'package:test/test.dart';

void main() {
  group('total_traffic', () {
    final apiKey = 'demo';
    late final SpymetricsClient spymetricsClient;

    setUpAll(() {
      final dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.spymetrics.ru',
          queryParameters: {'api_key': apiKey},
        ),
      );

      spymetricsClient = SpymetricsClient.dio(dio, apiKey: apiKey);
      /////// OR:
      // spymetricsClient = SpymetricsClient(apiKey);

      // Add a simple interceptor to print the full URL before request
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            final query = options.queryParameters.entries
                .map((e) => '${e.key}=${e.value}')
                .join('&');

            final fullUrl =
                '${options.baseUrl}${options.path}${query.isEmpty ? '' : '?$query'}';
            print("-");
            print('➡️ Request URL: $fullUrl');

            handler.next(options); // continue request
          },
        ),
      );
    });

    setUp(() async {
      print("pause");
      await Future.delayed(const Duration(milliseconds: 400));
    });

    test('/visits', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final visitsResponse = await spymetricsClient.api.totalTraffic.visits(
        "amazon.com",
      );

      expect(visitsResponse, isA<VisitsResponse>());
      expect(visitsResponse.visits, isA<List<VisitEntity>>());
      expect(visitsResponse.visits, isNotEmpty);
      print(visitsResponse.visits?.map((v) => v.visits));
    });
    //
    //

    test('/pages-per-visit', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final pagesPerVisitResponse = await spymetricsClient.api.totalTraffic
          .pagesPerVisit("amazon.com");

      expect(pagesPerVisitResponse, isA<PagesPerVisitResponse>());
      expect(
        pagesPerVisitResponse.pagesPerVisit,
        isA<List<PagesPerVisitEntity>>(),
      );
      expect(pagesPerVisitResponse.pagesPerVisit, isNotEmpty);
      print(pagesPerVisitResponse.pagesPerVisit?.map((v) => v.pagesPerVisit));
    });
    //
    //

    test('/average-visit-duration', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final averageVisitDurationResponse = await spymetricsClient
          .api
          .totalTraffic
          .averageVisitDuration("amazon.com");

      expect(averageVisitDurationResponse, isA<AverageVisitDurationResponse>());
      expect(
        averageVisitDurationResponse.averageVisitDuration,
        isA<List<AverageVisitDurationEntity>>(),
      );
      expect(averageVisitDurationResponse.averageVisitDuration, isNotEmpty);
      print(
        averageVisitDurationResponse.averageVisitDuration?.map(
          (v) => v.averageVisitDuration,
        ),
      );
    });
    //
    //

    test('/bounce-rate', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final bounceRateResponse = await spymetricsClient.api.totalTraffic
          .bounceRate("amazon.com");

      expect(bounceRateResponse, isA<BounceRateResponse>());
      expect(bounceRateResponse.bounceRate, isA<List<BounceRateEntity>>());
      expect(bounceRateResponse.bounceRate, isNotEmpty);
      print(bounceRateResponse.bounceRate?.map((v) => v.bounceRate));
    });
    //
    //

    test('/visits-split', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final visitsSplitResponse = await spymetricsClient.api.totalTraffic
          .visitsSplit("amazon.com");

      expect(visitsSplitResponse, isA<VisitsSplitResponse>());
      expect(visitsSplitResponse.visitsSplit, isNotNull);
      expect(
        visitsSplitResponse.visitsSplit!.mobileWebVisitShare,
        isNonNegative,
      );
      expect(
        visitsSplitResponse.visitsSplit!.mobileWebVisitShare,
        isNonNegative,
      );
      print(visitsSplitResponse.visitsSplit!.desktopVisitShare);
      print(visitsSplitResponse.visitsSplit!.mobileWebVisitShare);

      final responseJson = visitsSplitResponse.toJson();
      print(responseJson);
      expect(responseJson, isA<Map<String, dynamic>>());
      expect(responseJson['meta'], isNotNull);
      expect(responseJson['desktop_visit_share'], isNotNull);
      expect(responseJson['mobile_web_visit_share'], isNotNull);
      expect(responseJson['visitsSplit'], isNull);

      // expect(visitsResponse.visitsSplit, isA<List<VisitsSplitEntity>>());
      // expect(visitsResponse.visitsSplit, isNotEmpty);
    });
    //
    //

    test('/describe', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final describeResponse = await spymetricsClient.api.totalTraffic.describe(
        "amazon.com",
        // request: SpymetricsRequest.json(country: "RU"),
        request: SpymetricsRequest.json(
          startDate: SpymetricsDateExt(
            DateTime.now().subtract(Duration(days: 100)),
          ),
          endDate: SpymetricsDate(DateTime.now().subtract(Duration(days: 50))),
        ),
      );

      final responseMap = describeResponse.response;
      if (responseMap == null) return;
      print('responseMap: ${responseMap.data.keys}');

      final traffic = responseMap['total_traffic_and_engagement'];
      print('traffic ${traffic?.countries}');

      final countries = traffic?.countries;
      print('countriesRaw ${countries?.data.keys}');

      if (countries == null) return;
      for (final countryEntry in countries.data.entries) {
        final (country, data) = (countryEntry.key, countryEntry.value);
        print('country $country');
        print(
          'country ${data.startDate} - ${data.endDate} | ${data.freshData}',
        );
      }
    });
  });
}
