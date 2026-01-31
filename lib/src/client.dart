import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

// APIS:
import 'api/total_traffic.dart';
import 'api/desktop_traffic.dart';

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

  TotalTrafficApi get totalTraffic =>
      TotalTrafficApi(_dio, baseUrl: _dio.options.baseUrl);

  DesktopTrafficApi get desktopTraffic =>
      DesktopTrafficApi(_dio, baseUrl: _dio.options.baseUrl);
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
        // print('➡️ onRequest: ${options.path} - adding api_key $apiKey');
        options.queryParameters['api_key'] = apiKey;
        // print('➡️ uri => ${options.uri}');
        handler.next(options);
      },
    ),
  );

  // TODO: correct exceptions
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (error, handler) {
        // print('⚠️ onError: $error');
        final response = error.response;
        if (response == null) {
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: error.error,
            ),
          );
          // handler.next(error);
          return;
        }
        // Check for API-level errors in JSON
        // print("response.data['meta']");
        // print(response.data['meta']);
        if (response.data['meta']?['status'] != 'Success') {
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              error: SpymetricsApiException(
                httpCode: response.statusCode,
                status: response.data['meta']['status'],
                code: response.data['meta']['error_code'],
                message:
                    response.data['meta']['error_message'] ?? 'Unknown error',
              ),
            ),
          );
          return;
        }
        handler.next(error);
      },
      onResponse: (response, handler) {
        // Check for API-level errors in JSON
        // print("response.data['meta']");
        // print(response.data['meta']);
        if (response.data['meta']?['status'] != 'Success') {
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              error: SpymetricsApiException(
                httpCode: response.statusCode,
                status: response.data['meta']['status'],
                code: response.data['meta']['error_code'],
                message:
                    response.data['meta']['error_message'] ?? 'Unknown error',
              ),
            ),
          );
          return;
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

  SpymetricsApiException({this.httpCode, this.status, this.code, this.message});

  @override
  String toString() =>
      'SpymetricsApiException($httpCode | $code)[$status]: $message';
}
