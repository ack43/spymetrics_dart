import 'package:spymetrics_dart/spymetrics_dart.dart';
import 'package:dio/dio.dart';

void main() async {
  final apiKey = 'demo';
  final spymetricsClient = SpymetricsClient(apiKey);
  spymetricsClient.api.totalTraffic.visits("amazon.com");
  //
  //
  //
  try {
    final visitsResponse = await spymetricsClient.api.totalTraffic.visits(
      "amazon.com",
      request: SpymetricsRequest.json(
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
    final visitsResponse = await spymetricsClient.api.totalTraffic.visits(
      "amazon.com",
      request: SpymetricsRequest.json(
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

  //
  //
  //

  final responseXml = await spymetricsClient.api.rawRequest(
    SpymetricsApi.constructPath(
      domain: "amazon.com",
      action: "total-traffic-and-engagement/visits",
    ),
    request: SpymetricsRequest.xml(
      granularity: SpymetricsGranularity.daily,
      startDate: SpymetricsDateExt(
        DateTime.now().subtract(Duration(days: 100)),
      ),
      endDate: SpymetricsDateExt(DateTime.now().subtract(Duration(days: 80))),
    ),
  );
  print(responseXml.data); // <?xml ...
}
