import 'package:spymetrics_dart/spymetrics_dart.dart';
import 'package:dio/dio.dart';

void main() async {
  final apiKey = 'demo';
  final spymetricsClient = SpymetricsClient(apiKey);
  spymetricsClient.api.totalTrafficAndEngagement.visits(
    "amazon.com",
    SpymetricsRequest.json(),
  );
  //
  //
  //
  try {
    final visitsResponse = await spymetricsClient.api.totalTrafficAndEngagement
        .visits(
          "amazon.com",
          SpymetricsRequest.json(
            endDate: SpymetricsDateExt(DateTime.now().add(Duration(days: 500))),
          ),
        );
    print(visitsResponse.visits?.map((v) => v.visits));
  } catch (e) {
    print(e.runtimeType);
    if (e is DioException && e.error is SpymetricsApiException) {
      final error = e.error as SpymetricsApiException;
      print(error.status);
      print(error.message);
    }
  }
  //
  //
  //
  try {
    final visitsResponse = await spymetricsClient.api.totalTrafficAndEngagement
        .visits(
          "amazon.com",
          SpymetricsRequest.json(
            endDate: SpymetricsDateExt(DateTime.now().add(Duration(days: 500))),
          ),
        );

    print(visitsResponse.visits?.map((v) => v.visits));
  } on SpymetricsApiException catch (e) {
    print('Caught API exception!');
    print('Status code: ${e.status}');
    print('Message: ${e.message}');
  } on DioException catch (e) {
    // This will catch network-level errors, timeouts, etc.
    print('Caught Dio exception: ${e.message}');
    if (e.error is SpymetricsApiException) {
      final apiError = e.error as SpymetricsApiException;
      print('API exception inside Dio: ${apiError.message}');
    }
  } catch (e, stack) {
    print('Other exception: $e');
    print(stack);
  }
}
