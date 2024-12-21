import 'package:daily_flow/data/network/app_api.dart';
import 'package:daily_flow/data/network/requests.dart';
import 'package:daily_flow/data/responses/login/login_response.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _appServiceClient.login(loginRequest);
  }
}
