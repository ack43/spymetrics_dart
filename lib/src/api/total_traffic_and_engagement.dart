import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/request.dart';

import '../models/visit.dart';
import '../models/page_per_visit.dart';

part 'total_traffic_and_engagement.g.dart';

//// https://api.spymetrics.ru/doc/endpoints#total-traffic-visits
@RestApi()
abstract class TotalTrafficAndEngagementApi {
  factory TotalTrafficAndEngagementApi(Dio dio, {String baseUrl}) =
      _TotalTrafficAndEngagementApi;

  @GET('/v1/website/{domain}/total-traffic-and-engagement/visits')
  Future<VisitsResponse> visits(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );

  @GET('/v1/website/{domain}/total-traffic-and-engagement/pages-per-visit')
  Future<PagesPerVisitResponse> pagesPerVisit(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );
}
