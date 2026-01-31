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
      final dio = Dio(BaseOptions(baseUrl: 'https://api.spymetrics.ru'));

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

    setUp(() {
      Future.delayed(const Duration(milliseconds: 400));
    });

    test('/visits', () async {
      final visitsResponse = await spymetricsClient.api.totalTraffic.visits(
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
      final pagesPerVisitResponse = await spymetricsClient.api.totalTraffic
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
      final averageVisitDurationResponse = await spymetricsClient
          .api
          .totalTraffic
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
      final bounceRateResponse = await spymetricsClient.api.totalTraffic
          .bounceRate("amazon.com", SpymetricsRequest.json());

      expect(bounceRateResponse, isA<BounceRateResponse>());
      expect(bounceRateResponse.bounceRate, isA<List<BounceRateEntity>>());
      expect(bounceRateResponse.bounceRate, isNotEmpty);
      print(bounceRateResponse.bounceRate?.map((v) => v.bounceRate));
    });
    //
    //

    test('/visits-split', () async {
      final visitsSplitResponse = await spymetricsClient.api.totalTraffic
          .visitsSplit("amazon.com", SpymetricsRequest.json());

      expect(visitsSplitResponse, isA<VisitsSplitResponse>());
      expect(visitsSplitResponse.desktopVisitShare, isNonNegative);
      expect(visitsSplitResponse.mobileWebVisitShare, isNonNegative);
      print(visitsSplitResponse.desktopVisitShare);
      print(visitsSplitResponse.mobileWebVisitShare);

      // expect(visitsResponse.visitsSplit, isA<List<VisitsSplitEntity>>());
      // expect(visitsResponse.visitsSplit, isNotEmpty);
    });
  });
}
