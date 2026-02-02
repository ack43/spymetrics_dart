import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../client/request.dart';

import '../../models.dart';

part 'total_traffic.g.dart';

//// *Total Traffic*
//// https://api.spymetrics.ru/doc/endpoints#total-traffic-visits
@RestApi()
abstract class TotalTrafficApi {
  factory TotalTrafficApi(Dio dio, {String baseUrl}) = _TotalTrafficApi;

  // GET Visits
  @GET('/v1/website/{domain}/total-traffic-and-engagement/visits')
  Future<VisitsResponse> visits(
    @Path('domain') String domain, {
    @Queries() SpymetricsRequest? request,
  });

  // GET Pages / Visit
  @GET('/v1/website/{domain}/total-traffic-and-engagement/pages-per-visit')
  Future<PagesPerVisitResponse> pagesPerVisit(
    @Path('domain') String domain, {
    @Queries() SpymetricsRequest? request,
  });

  // GET Total Avg. Visit Duration
  @GET(
    '/v1/website/{domain}/total-traffic-and-engagement/average-visit-duration',
  )
  Future<AverageVisitDurationResponse> averageVisitDuration(
    @Path('domain') String domain, {
    @Queries() SpymetricsRequest? request,
  });

  // GET Bounce Rate
  @GET('/v1/website/{domain}/total-traffic-and-engagement/bounce-rate')
  Future<BounceRateResponse> bounceRate(
    @Path('domain') String domain, {
    @Queries() SpymetricsRequest? request,
  });

  // GET Desktop vs Mobile Split
  @GET('/v1/website/{domain}/total-traffic-and-engagement/visits-split')
  Future<VisitsSplitResponse> visitsSplit(
    @Path('domain') String domain, {
    @Queries() SpymetricsRequest? request,
  });

  ///////////////////////////////////////////////////////
  ///
  // GET Desktop Visits [Describe]
  @GET('/v1/website/{domain}/total-traffic-and-engagement/describe')
  Future<DescribeDataResponse> describe(
    @Path('domain') String domain, {
    @Queries() SpymetricsRequest? request,
  });
}
