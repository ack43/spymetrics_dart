import 'package:dio/dio.dart';
import 'package:spymetrics_dart/spymetrics_dart.dart';
// import 'package:spymetrics_dart/src/client/response.dart';

import 'package:spymetrics_dart/models.dart';

import 'package:test/test.dart';

void main() {
  group('utilities', () {
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

    test('/capabilities', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final capabilitiesResponse = await spymetricsClient.api.utilites
          .capabilities();

      print(capabilitiesResponse.toJson());
      expect(capabilitiesResponse, isA<CapabilitiesResponse>());
      expect(capabilitiesResponse.remainingHits, isNotNull);
      expect(capabilitiesResponse.remainingHits, isNonNegative);
      expect(capabilitiesResponse.webDesktopData, isNotNull);
      expect(capabilitiesResponse.webMobileData, isNotNull);

      expect(capabilitiesResponse.webDesktopData?.countries, isA<List>());
    });
    //
    //

    test('/categories', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final categoriesResponse = await spymetricsClient.api.utilites
          .categories();

      print(categoriesResponse.toJson());
      expect(categoriesResponse, isA<CategoriesResponse>());
      expect(categoriesResponse.categories, isNotEmpty);
    });
  });
}
