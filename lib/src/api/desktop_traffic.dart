import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../client/request.dart';

import '../../models.dart';

part 'desktop_traffic.g.dart';

//// *Desktop Traffic*
//// https://api.spymetrics.ru/doc/endpoints#desktop-traffic-visits
@RestApi()
abstract class DesktopTrafficApi {
  factory DesktopTrafficApi(Dio dio, {String baseUrl}) = _DesktopTrafficApi;

  // GET Desktop Visits
  @GET('/v1/website/{domain}/traffic-and-engagement/visits')
  Future<VisitsResponse> visits(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );

  // GET Desktop Pages / Visit
  @GET('/v1/website/{domain}/traffic-and-engagement/pages-per-visit')
  Future<PagesPerVisitResponse> pagesPerVisit(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );

  // GET Desktop Avg. Visit Duration
  @GET('/v1/website/{domain}/traffic-and-engagement/average-visit-duration')
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

  // GET Global Rank
  @GET('/v1/website/{domain}/global-rank/global-rank')
  Future<GlobalRankResponse> globalRank(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );

  // GET Country Rank
  @GET('/v1/website/{domain}/country-rank/country-rank')
  Future<CountryRankResponse> countryRank(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );

  // GET Geography Distribution
  @GET('/v1/website/{domain}/geo/traffic-by-country')
  Future<GeoDistributionResponse> geoDistribution(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );

  // GET Desktop Unique Visitors
  @GET('/v1/website/{domain}/unique-visitors/desktop_mau')
  Future<UniqueVisitorsResponse> uniqueVisitors(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );

  ///////////////////////////////////////////////////////
  ///
  // GET Desktop Visits [Describe]
  @GET('/v1/website/{domain}/traffic-and-engagement/describe')
  Future<Map<String, Object>> describe(
    @Path('domain') String domain,
    @Queries() SpymetricsRequest request,
  );
}
