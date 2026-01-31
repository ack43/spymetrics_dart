import 'package:spymetrics_dart/spymetrics_dart.dart';

void main() {
  final apiKey = 'demo';
  final spymetricsClient = SpymetricsClient(apiKey);
  spymetricsClient.api.totalTrafficAndEngagement.visits(
    "amazon.com",
    SpymetricsRequest.json(),
  );
}
