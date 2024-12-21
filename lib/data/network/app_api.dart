import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:daily_flow/app/constants.dart';
import 'package:daily_flow/data/network/requests.dart';
import 'package:daily_flow/data/responses/login/login_response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/Login/AuthorizationAndLogin/Login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}