import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

// APIS:
import 'api/utilites.dart';
import 'api/total_traffic.dart';
import 'api/desktop_traffic.dart';
import 'api/mobile_traffic.dart';

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
  const SpymetricsApi(this._dio);
  final Dio _dio;

  UtilitesApi get utilites => UtilitesApi(_dio, baseUrl: _dio.options.baseUrl);

  TotalTrafficApi get totalTraffic =>
      TotalTrafficApi(_dio, baseUrl: _dio.options.baseUrl);

  DesktopTrafficApi get desktopTraffic =>
      DesktopTrafficApi(_dio, baseUrl: _dio.options.baseUrl);

  MobileTrafficApi get mobileTraffic =>
      MobileTrafficApi(_dio, baseUrl: _dio.options.baseUrl);
}

///
///
///

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
          queryParameters: {'api_key': apiKey},
          // headers, queryParameters:
        ),
      );

  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    final client = HttpClient();
    client.badCertificateCallback = (cert, host, port) => true;
    return client;
  };

  // dio.interceptors.add(
  //   InterceptorsWrapper(
  //     onRequest: (options, handler) {
  //       // print('➡️ onRequest: ${options.path} - adding api_key $apiKey');
  //       options.queryParameters['api_key'] = apiKey;
  //       // print('➡️ uri => ${options.uri}');
  //       handler.next(options);
  //     },
  //   ),
  // );

  // TODO: correct exceptions
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (error, handler) {
        // print('⚠️ onError: $error');
        final response = error.response;
        // // Check for API-level errors in JSON
        // print("onError.response.data");
        // print(response);
        if (response == null) {
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: error.error,
            ),
          );
          handler.next(error);
          return;
        }
        // print("onError.response.data['meta']");
        // print(response.data['meta']);
        if (response.data is Map && response.data.containsKey('meta')) {
          final meta = response.data['meta'] as Map<String, dynamic>?;
          // print(response.data);
          if (meta != null &&
              meta.containsKey('status') &&
              meta['status'] != 'Success') {
            handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                error: SpymetricsApiException(
                  httpCode: response.statusCode,
                  status: meta['status'],
                  code: meta['error_code'],
                  message: meta['error_message'] ?? 'Unknown error',
                ),
              ),
            );
            return;
          }
        }
        handler.next(error);
      },
      onResponse: (response, handler) {
        // // Check for API-level errors in JSON
        // print("onResponse.response.data");
        // print(response.data);
        // // print("onResponse.response.data['meta']");
        // // print(response.data['meta']);

        if (response.data is Map && response.data.containsKey('meta')) {
          final meta = response.data['meta'] as Map<String, dynamic>?;
          // print(response.data);
          if (meta != null &&
              meta.containsKey('status') &&
              meta['status'] != 'Success') {
            handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                error: SpymetricsApiException(
                  httpCode: response.statusCode,
                  status: meta['status'],
                  code: meta['error_code'],
                  message: meta['error_message'] ?? 'Unknown error',
                ),
              ),
            );
            return;
          }
        }
        handler.next(response);
      },
    ),
  );

  return dio;
}

//// TODO: not work now
class SpymetricsApiException implements Exception {
  final int? httpCode;
  final String? status;
  final int? code;
  final String? message;

  const SpymetricsApiException({
    this.httpCode,
    this.status,
    this.code,
    this.message,
  });

  @override
  String toString() =>
      'SpymetricsApiException($httpCode | $code)[$status]: $message';
}
