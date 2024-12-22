import 'package:daily_flow/data/network/app_api.dart';
import 'package:daily_flow/data/network/requests.dart';
import 'package:daily_flow/data/responses/login/login_response.dart';
import 'package:daily_flow/data/responses/task/task_response.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);

  Future<TaskResponse> addTask(int id, TaskResponse request);

  Future<List<TaskResponse>> getAllTasks(int id);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _appServiceClient.login(loginRequest);
  }

  @override
  Future<TaskResponse> addTask(int id, TaskResponse request) {
    return _appServiceClient.addTask(id, request);
  }

  @override
  Future<List<TaskResponse>> getAllTasks(int id) {
    return _appServiceClient.getAllTasks(id);
  }
}
