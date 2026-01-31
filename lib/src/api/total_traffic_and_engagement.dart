import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../client/request.dart';

import '../models/visit.dart';
import '../models/page_per_visit.dart';
import '../models/average_visit_duration.dart';
import '../models/bounce_rate.dart';
import '../models/visits_split.dart';

part 'total_traffic_and_engagement.g.dart';

//// https://api.spymetrics.ru/doc/endpoints#total-traffic-visits
@RestApi()
abstract class TotalTrafficAndEngagementApi {
  factory TotalTrafficAndEngagementApi(Dio dio, {String baseUrl}) =
      _TotalTrafficAndEngagementApi;

  // GET Visits
  @GET('/v1/website/{domain}/total-traffic-and-engagement/visits')
  Future<VisitsResponse> visits(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );

  // GET Pages / Visit
  @GET('/v1/website/{domain}/total-traffic-and-engagement/pages-per-visit')
  Future<PagesPerVisitResponse> pagesPerVisit(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );

  // GET Total Avg. Visit Duration
  @GET(
    '/v1/website/{domain}/total-traffic-and-engagement/average-visit-duration',
  )
  Future<AverageVisitDurationResponse> averageVisitDuration(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );

  // GET Bounce Rate
  @GET('/v1/website/{domain}/total-traffic-and-engagement/bounce-rate')
  Future<BounceRateResponse> bounceRate(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );

  // GET Desktop vs Mobile Split
  @GET('/v1/website/{domain}/total-traffic-and-engagement/visits-split')
  Future<VisitsSplitResponse> visitsSplit(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );
}
