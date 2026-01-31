import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

// APIS:
import 'api/total_traffic_and_engagement.dart';

// Client

class SpymetricsClient {
  final Dio _dio;
  //
  // API  shortcut
  late final SpymetricsApi _api;
  SpymetricsApi get api => _api;

  SpymetricsClient(String apiKey) : _dio = _createDio(apiKey: apiKey) {
    _api = SpymetricsApi(_dio);
  }

  SpymetricsClient.baseUrl(String baseUrl, {required String apiKey})
    : _dio = _createDio(apiKey: apiKey, baseUrl: baseUrl) {
    _api = SpymetricsApi(_dio);
  }

  SpymetricsClient.dio(Dio dio, {required String apiKey})
    : _dio = _createDio(apiKey: apiKey, orDio: dio) {
    _api = SpymetricsApi(_dio);
  }

  // // APIS:
  // TotalTrafficAndEngagementApi get totalTrafficAndEngagementApi =>
  //     TotalTrafficAndEngagementApi(_dio);
}

/// API Wrapper

class SpymetricsApi {
  SpymetricsApi(this._dio);
  final Dio _dio;
  TotalTrafficAndEngagementApi get totalTrafficAndEngagement =>
      TotalTrafficAndEngagementApi(_dio, baseUrl: _dio.options.baseUrl);
}

/// utils
///
Dio _createDio({
  required String apiKey,
  String baseUrl = 'https://api.spymetrics.ru',
  Dio? orDio,
}) {
  final dio =
      orDio ??
      Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    final client = HttpClient();
    client.badCertificateCallback = (cert, host, port) => true;
    return client;
  };

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters['api_key'] = apiKey;
        handler.next(options);
      },
    ),
  );

  return dio;
}
