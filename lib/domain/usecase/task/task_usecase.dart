import 'package:daily_flow/data/network/failure.dart';
import 'package:daily_flow/domain/model/task/task_model.dart';
import 'package:daily_flow/domain/repository/repository.dart';
import 'package:daily_flow/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class TaskUseCase implements BaseUseCase<int, List<TaskModel>> {
  final Repository _repository;

  TaskUseCase(this._repository);

  @override
  Future<Either<Failure, List<TaskModel>>> execute(int id) async {
    return await _repository.getAllTasks(id);
  }
}
