import 'package:dio/dio.dart';
import 'package:spymetrics_dart/spymetrics_dart.dart';
import 'package:test/test.dart';

void main() {
  group('total_traffic_and_engagement', () {
    final apiKey = 'demo';
    late final SpymetricsClient spymetricsClient;

    setUpAll(() {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.spymetrics.ru'));
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

    test('First Test', () async {
      final visitsResponse = await spymetricsClient
          .api
          .totalTrafficAndEngagement
          .visits("amazon.com", SpymetricsRequest.json());
      print(visitsResponse.visits?.map((v) => v.visits));
    });
  });
}
