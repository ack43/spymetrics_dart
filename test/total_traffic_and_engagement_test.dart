import 'package:dio/dio.dart';
import 'package:spymetrics_dart/spymetrics_dart.dart';
// import 'package:spymetrics_dart/src/client/response.dart';

import 'package:spymetrics_dart/src/models/visit.dart';
import 'package:spymetrics_dart/src/models/page_per_visit.dart';
import 'package:spymetrics_dart/src/models/average_visit_duration.dart';
import 'package:spymetrics_dart/src/models/bounce_rate.dart';
import 'package:spymetrics_dart/src/models/visits_split.dart';

import 'package:test/test.dart';

void main() {
  group('total_traffic_and_engagement', () {
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
      final visitsResponse = await spymetricsClient
          .api
          .totalTrafficAndEngagement
          .visits("amazon.com", SpymetricsRequest.json());

      expect(visitsResponse, isA<VisitsResponse>());
      expect(visitsResponse.visits, isA<List<VisitEntity>>());
      expect(visitsResponse.visits, isNotEmpty);
    });
    //
    //

    test('/pages-per-visit', () async {
      final pagesPerVisitResponse = await spymetricsClient
          .api
          .totalTrafficAndEngagement
          .pagesPerVisit("amazon.com", SpymetricsRequest.json());

      expect(pagesPerVisitResponse, isA<PagesPerVisitResponse>());
      expect(
        pagesPerVisitResponse.pagesPerVisit,
        isA<List<PagesPerVisitEntity>>(),
      );
      expect(pagesPerVisitResponse.pagesPerVisit, isNotEmpty);
    });
    //
    //

    test('/average-visit-duration', () async {
      final averageVisitDurationResponse = await spymetricsClient
          .api
          .totalTrafficAndEngagement
          .averageVisitDuration("amazon.com", SpymetricsRequest.json());

      expect(averageVisitDurationResponse, isA<AverageVisitDurationResponse>());
      expect(
        averageVisitDurationResponse.averageVisitDuration,
        isA<List<AverageVisitDurationEntity>>(),
      );
      expect(averageVisitDurationResponse.averageVisitDuration, isNotEmpty);
    });
    //
    //

    test('/bounce-rate', () async {
      final bounceRateResponse = await spymetricsClient
          .api
          .totalTrafficAndEngagement
          .bounceRate("amazon.com", SpymetricsRequest.json());

      expect(bounceRateResponse, isA<BounceRateResponse>());
      expect(bounceRateResponse.bounceRate, isA<List<BounceRateEntity>>());
      expect(bounceRateResponse.bounceRate, isNotEmpty);
    });
    //
    //

    test('/visits-split', () async {
      final visitsSplitResponse = await spymetricsClient
          .api
          .totalTrafficAndEngagement
          .visitsSplit("amazon.com", SpymetricsRequest.json());

      expect(visitsSplitResponse, isA<VisitsSplitResponse>());
      expect(visitsSplitResponse.desktopVisitShare, isNonNegative);
      expect(visitsSplitResponse.mobileWebVisitShare, isNonNegative);

      // expect(visitsResponse.visitsSplit, isA<List<VisitsSplitEntity>>());
      // expect(visitsResponse.visitsSplit, isNotEmpty);
    });
  });
}
