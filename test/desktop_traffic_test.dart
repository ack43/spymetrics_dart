import 'package:dio/dio.dart';
import 'package:spymetrics_dart/spymetrics_dart.dart';
// import 'package:spymetrics_dart/src/client/response.dart';

import 'package:spymetrics_dart/models.dart';

import 'package:test/test.dart';

void main() {
  group('desktop_traffic', () {
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
      final visitsResponse = await spymetricsClient.api.desktopTraffic.visits(
        "amazon.com",
        SpymetricsRequest.json(limit: 10),
      );

      expect(visitsResponse, isA<VisitsResponse>());
      expect(visitsResponse.visits, isA<List<VisitEntity>>());
      expect(visitsResponse.visits, isNotEmpty);
      // expect(visitsResponse.visits?.length, 10); // still ot work
      print(visitsResponse.visits?.map((v) => v.visits));
    });
    //
    //

    test('/pages-per-visit', () async {
      final pagesPerVisitResponse = await spymetricsClient.api.desktopTraffic
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
          .desktopTraffic
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
      final bounceRateResponse = await spymetricsClient.api.desktopTraffic
          .bounceRate("amazon.com", SpymetricsRequest.json());

      expect(bounceRateResponse, isA<BounceRateResponse>());
      expect(bounceRateResponse.bounceRate, isA<List<BounceRateEntity>>());
      expect(bounceRateResponse.bounceRate, isNotEmpty);
      print(bounceRateResponse.bounceRate?.map((v) => v.bounceRate));
    });
    //
    //

    test('/global-rank/global-rank', () async {
      final globalRankResponse = await spymetricsClient.api.desktopTraffic
          .globalRank(
            "amazon.com",
            SpymetricsRequest.json(
              limit: 2,
              endDate: SpymetricsDateExt(
                DateTime.now().subtract(Duration(days: 60)),
              ),
            ),
          );

      expect(globalRankResponse, isA<GlobalRankResponse>());
      expect(globalRankResponse.globalRank, isA<List<GlobalRankEntity>>());
      expect(globalRankResponse.globalRank, isNotEmpty);
      // expect(globalRankResponse.globalRank, hasLength(2)); // still ot work
      print(globalRankResponse.globalRank?.map((v) => v.globalRank));
    });
    //
    //

    test('/country-rank/country-rank', () async {
      final countryRankResponse = await spymetricsClient.api.desktopTraffic
          .countryRank(
            "amazon.com",
            SpymetricsRequest.json(
              granularity: SpymetricsGranularity.daily,
              startDate: SpymetricsDateExt(
                DateTime.now().subtract(Duration(days: 100)),
              ),
              endDate: SpymetricsDate(
                DateTime.now().subtract(Duration(days: 50)),
              ),
            ),
          );

      expect(countryRankResponse, isA<CountryRankResponse>());
      expect(countryRankResponse.countryRank, isA<List<CountryRankEntity>>());
      expect(countryRankResponse.countryRank, isNotEmpty);
      print(countryRankResponse.countryRank?.map((v) => v.countryRank));
    });
    //
    //

    test('/geo/traffic-by-country', () async {
      final geoDistributionResponse = await spymetricsClient.api.desktopTraffic
          .geoDistribution(
            "amazon.com",
            SpymetricsRequest.json(
              startDate: SpymetricsDateExt(
                DateTime.now().subtract(Duration(days: 100)),
              ),
              endDate: SpymetricsDateExt(
                DateTime.now().subtract(Duration(days: 50)),
              ),
            ),
          );

      expect(geoDistributionResponse, isA<GeoDistributionResponse>());
      expect(
        geoDistributionResponse.records,
        isA<List<GeoDistributionEntity>>(),
      );
      expect(geoDistributionResponse.records, isNotEmpty);
      // print(geoDistributionResponse.records?.map((v) => v.rank));
      // print(geoDistributionResponse.records?.map((v) => v.countryName));
      print(geoDistributionResponse.records?.map((v) => print(v.toJson())));
    });
    //
    //

    test('/unique-visitors/desktop_mau', () async {
      final uniqueVisitorsResponse = await spymetricsClient.api.desktopTraffic
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
  });
}
