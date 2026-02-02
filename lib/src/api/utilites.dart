import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../client/request.dart';

import '../../models.dart' show CapabilitiesResponse, CategoriesResponse;

part 'utilites.g.dart';

//// *Utilities*
//// https://api.spymetrics.ru/doc/endpoints#utilities-check-capabilities
@RestApi()
abstract class UtilitesApi {
  factory UtilitesApi(Dio dio, {String baseUrl}) = _UtilitesApi;

  // GET Check Capabilities
  @GET('/capabilities')
  Future<CapabilitiesResponse> capabilities();

  // GET List Categories
  @GET('/v1/topsites/categories')
  Future<CategoriesResponse> categories();
}
