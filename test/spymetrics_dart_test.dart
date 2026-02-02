import 'package:dio/dio.dart';
import 'package:spymetrics_dart/spymetrics_dart.dart';
// import 'package:spymetrics_dart/src/client/spymetrics_date.dart';
// import 'package:spymetrics_dart/src/models/visit.dart';
import 'package:test/test.dart';

void main() {
  group('total_traffic_and_engagement', () {
    final apiKey = 'demo';
    late final SpymetricsClient spymetricsClient;

    setUpAll(() {
      final dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.spymetrics.ru',
          queryParameters: {'api_key': apiKey},
        ),
      );
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

      spymetricsClient = SpymetricsClient.dio(dio, apiKey: apiKey);
      /////// OR:
      // spymetricsClient = SpymetricsClient(apiKey);
    });

    setUp(() async {
      print("pause");
      await Future.delayed(const Duration(milliseconds: 400));
    });

    test('First Test (/visits)', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final visitsResponse = await spymetricsClient.api.totalTraffic.visits(
        "amazon.com",
        SpymetricsRequest.json(),
      );
      print(visitsResponse.visits?.map((v) => v.visits));
    });

    test('First Test (/visits) with day(SpymetricsDateExt)', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final visitsResponse = await spymetricsClient.api.totalTraffic.visits(
        "amazon.com",
        SpymetricsRequest.json(
          endDate: SpymetricsDateExt(
            DateTime.now().subtract(Duration(days: 50)),
          ),
        ),
      );
      print(visitsResponse.visits?.map((v) => v.toJson()));
    });

    test('First Test (/visits) weekly', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final visitsResponse = await spymetricsClient.api.totalTraffic.visits(
        "amazon.com",
        SpymetricsRequest.weekly(
          endDate: SpymetricsDateExt(
            DateTime.now().subtract(Duration(days: 50)),
          ),
        ),
      );
      print(visitsResponse.visits?.map((v) => v.toJson()));
    });

    test('First Test (/visits) monthly', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final visitsResponse = await spymetricsClient.api.totalTraffic.visits(
        "amazon.com",
        SpymetricsRequest.monthly(
          endDate: SpymetricsDateExt(
            DateTime.now().subtract(Duration(days: 50)),
          ),
        ),
      );
      print(visitsResponse.visits?.map((v) => v.toJson()));
    });

    test('First failed Test /visits', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      try {
        final visitsResponse = await spymetricsClient.api.totalTraffic.visits(
          "amazon.com",
          SpymetricsRequest.json(
            endDate: SpymetricsDateExt(DateTime.now().add(Duration(days: 500))),
          ),
        );
        print(visitsResponse.visits?.map((v) => v.visits));
      } catch (e) {
        expect(e, isA<DioException>());
        if (e is DioException) {
          expect(e.error, isA<SpymetricsApiException>());
          final error = e.error as SpymetricsApiException;
          expect(error.status, "Error");
          expect(error.message, contains('Dates not in range.'));
        }
      }
    });

    test('First failed Test 2 /visits', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      try {
        final visitsResponse = await spymetricsClient.api.totalTraffic.visits(
          "amazon.com",
          SpymetricsRequest.json(
            endDate: SpymetricsDateExt(DateTime.now().add(Duration(days: 500))),
          ),
        );

        print(visitsResponse.visits?.map((v) => v.visits));
      } on SpymetricsApiException catch (e) {
        expect(e.status, "Error");
        print('Caught API exception!');
        print('Status code: ${e.status}');
        print('Message: ${e.message}');
      } on DioException catch (e) {
        // This will catch network-level errors, timeouts, etc.
        print('Caught Dio exception: ${e.message}');
        if (e.error is SpymetricsApiException) {
          final apiError = e.error as SpymetricsApiException;
          expect(apiError.status, "Error");
          print('API exception inside Dio: ${apiError.message}');
        }
      } catch (e, stack) {
        print('Other exception: $e');
        print(stack);
      }
    });
  });
}
