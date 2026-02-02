import 'package:dio/dio.dart';
import 'package:spymetrics_dart/spymetrics_dart.dart';
// import 'package:spymetrics_dart/src/client/response.dart';

import 'package:spymetrics_dart/models.dart';

import 'package:test/test.dart';

void main() {
  group('mobile_traffic', () {
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
      final visitsResponse = await spymetricsClient.api.mobileTraffic.visits(
        "amazon.com",
        SpymetricsRequest.json(),
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
      final pagesPerVisitResponse = await spymetricsClient.api.mobileTraffic
          .pagesPerVisit("amazon.com", SpymetricsRequest.json());

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
          .mobileTraffic
          .averageVisitDuration("amazon.com", SpymetricsRequest.json());

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
      final bounceRateResponse = await spymetricsClient.api.mobileTraffic
          .bounceRate("amazon.com", SpymetricsRequest.json());

      expect(bounceRateResponse, isA<BounceRateResponse>());
      expect(bounceRateResponse.bounceRate, isA<List<BounceRateEntity>>());
      expect(bounceRateResponse.bounceRate, isNotEmpty);
      print(bounceRateResponse.bounceRate?.map((v) => v.bounceRate));
    });
    //
    //

    test('/unique-visitors/mobileweb_mau', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final uniqueVisitorsResponse = await spymetricsClient.api.mobileTraffic
          .uniqueVisitors(
            "amazon.com",
            SpymetricsRequest.json(
              startDate: SpymetricsDateExt(
                DateTime.now().subtract(Duration(days: 100)),
              ),
              endDate: SpymetricsDate(
                DateTime.now().subtract(Duration(days: 50)),
              ),
            ),
          );

      print(uniqueVisitorsResponse);
      print(uniqueVisitorsResponse.uniqueVisitors);
      print(uniqueVisitorsResponse.uniqueVisitors);
      expect(uniqueVisitorsResponse, isA<UniqueVisitorsResponse>());
      expect(
        uniqueVisitorsResponse.uniqueVisitors,
        isA<List<UniqueVisitorsEntity>>(),
      );
      expect(uniqueVisitorsResponse.uniqueVisitors, isNotEmpty);
      print(uniqueVisitorsResponse.uniqueVisitors?.map((v) => v.date));
      print(
        uniqueVisitorsResponse.uniqueVisitors?.map((v) => v.uniqueVisitors),
      );
    });
    //
    //

    test('/describe', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final describeResponse = await spymetricsClient.api.mobileTraffic
          .describe(
            "wildberries.ru",
            // SpymetricsRequest.json(country: "RU"),
            SpymetricsRequest.json(
              startDate: SpymetricsDateExt(
                DateTime.now().subtract(Duration(days: 100)),
              ),
              endDate: SpymetricsDate(
                DateTime.now().subtract(Duration(days: 50)),
              ),
            ),
          );

      print(describeResponse);
    });
  });
}
