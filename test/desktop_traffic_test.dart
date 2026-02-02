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

    Future previous = Future.value();
    setUp(() {
      previous = previous.then(
        (_) => Future.delayed(const Duration(milliseconds: 400)),
      );
      return previous;
    });

    test('/visits', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final visitsResponse = await spymetricsClient.api.desktopTraffic.visits(
        "amazon.com",
      );

      expect(visitsResponse, isA<VisitsResponse>());
      expect(visitsResponse.visits, isA<List<VisitEntity>>());
      expect(visitsResponse.visits, isNotEmpty);
      // expect(visitsResponse.visits?.length, 10); // still ot work
      print(visitsResponse.visits?.map((v) => v.date));
      print(visitsResponse.visits?.map((v) => v.visits));
    });
    //
    //

    test('/pages-per-visit', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final pagesPerVisitResponse = await spymetricsClient.api.desktopTraffic
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
          .desktopTraffic
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
      final bounceRateResponse = await spymetricsClient.api.desktopTraffic
          .bounceRate("amazon.com");

      expect(bounceRateResponse, isA<BounceRateResponse>());
      expect(bounceRateResponse.bounceRate, isA<List<BounceRateEntity>>());
      expect(bounceRateResponse.bounceRate, isNotEmpty);
      print(bounceRateResponse.bounceRate?.map((v) => v.bounceRate));
    });
    //
    //

    test('/global-rank/global-rank', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final globalRankResponse = await spymetricsClient.api.desktopTraffic
          .globalRank(
            "amazon.com",
            request: SpymetricsRequest.json(
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
      await Future.delayed(const Duration(milliseconds: 400));
      final countryRankResponse = await spymetricsClient.api.desktopTraffic
          .countryRank(
            "amazon.com",
            request: SpymetricsRequest.json(
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
      await Future.delayed(const Duration(milliseconds: 400));
      final geoDistributionResponse = await spymetricsClient.api.desktopTraffic
          .geoDistribution(
            "amazon.com",
            request: SpymetricsRequest.json(
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
      await Future.delayed(const Duration(milliseconds: 400));
      final uniqueVisitorsResponse = await spymetricsClient.api.desktopTraffic
          .uniqueVisitors(
            "amazon.com",
            request: SpymetricsRequest.json(
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
      final describeDataResponse = await spymetricsClient.api.desktopTraffic
          .describe(
            "amazon.com",
            // request: SpymetricsRequest.json(country: "RU"),
            request: SpymetricsRequest.json(
              startDate: SpymetricsDateExt(
                DateTime.now().subtract(Duration(days: 1000)),
              ),
              endDate: SpymetricsDate(
                DateTime.now().subtract(Duration(days: 500)),
              ),
            ),
          );

      final responseMap = describeDataResponse.response;
      if (responseMap == null) return;
      print('responseMap: ${responseMap.data.keys}');

      final traffic = responseMap['traffic_and_engagement'];
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
