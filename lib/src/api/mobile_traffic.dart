import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../client/request.dart';

import '../../models.dart';

part 'mobile_traffic.g.dart';

//// *Mobile Web*
//// https://api.spymetrics.ru/doc/endpoints#mobile-web-traffic-visits
@RestApi()
abstract class MobileTrafficApi {
  factory MobileTrafficApi(Dio dio, {String baseUrl}) = _MobileTrafficApi;

  // GET Visits
  @GET('/v1/website/{domain}/mobile-web/visits')
  Future<VisitsResponse> visits(
    @Path('domain') String domain, {
    @Queries() SpymetricsRequest? request,
  });

  // GET Pages / Visit
  @GET('/v1/website/{domain}/mobile-web/pages-per-visit')
  Future<PagesPerVisitResponse> pagesPerVisit(
    @Path('domain') String domain, {
    @Queries() SpymetricsRequest? request,
  });

  // GET Total Avg. Visit Duration
  @GET('/v1/website/{domain}/mobile-web/average-visit-duration')
  Future<AverageVisitDurationResponse> averageVisitDuration(
    @Path('domain') String domain, {
    @Queries() SpymetricsRequest? request,
  });

  // GET Bounce Rate
  @GET('/v1/website/{domain}/mobile-web/bounce-rate')
  Future<BounceRateResponse> bounceRate(
    @Path('domain') String domain, {
    @Queries() SpymetricsRequest? request,
  });

  // GET Mobile Web Unique Visitors
  @GET('/v1/website/{domain}/unique-visitors/mobileweb_mau')
  Future<UniqueVisitorsResponse> uniqueVisitors(
    @Path('domain') String domain, {
    @Queries() SpymetricsRequest? request,
  });

  ///////////////////////////////////////////////////////
  ///
  // GET Mobile Web Visits [/describe]
  @GET('/v1/website/{domain}/mobile-web/describe')
  Future<DescribeResponse> describe(
    @Path('domain') String domain, {
    @Queries() SpymetricsRequest? request,
  });
}
