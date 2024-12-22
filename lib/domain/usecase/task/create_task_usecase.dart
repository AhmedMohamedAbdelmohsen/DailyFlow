import 'package:daily_flow/data/responses/task/task_response.dart';
import 'package:daily_flow/domain/model/task/task_model.dart';
import 'package:dartz/dartz.dart';
import 'package:daily_flow/data/network/failure.dart';
import 'package:daily_flow/domain/repository/repository.dart';
import 'package:daily_flow/domain/usecase/base_usecase.dart';

class CreateTaskUseCase implements BaseUseCase<TaskMainModel, TaskModel> {
  final Repository _repository;

  CreateTaskUseCase(this._repository);

  @override
  Future<Either<Failure, TaskModel>> execute(TaskMainModel request) async {
    return await _repository.addTask(request.id, request.taskRequest);
  }
}
