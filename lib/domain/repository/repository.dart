import 'package:daily_flow/data/responses/task/task_response.dart';
import 'package:daily_flow/domain/model/task/task_model.dart';
import 'package:dartz/dartz.dart';
import 'package:daily_flow/data/network/failure.dart';
import 'package:daily_flow/data/network/requests.dart';
import 'package:daily_flow/domain/model/login/login_model.dart';

abstract class Repository {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);

  Future<Either<Failure, TaskModel>> addTask(int id, TaskResponse request);

  Future<Either<Failure, List<TaskDataModel>>> getAllTasks(int id);
}
