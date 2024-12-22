part of 'add_task_cubit.dart';

@immutable
abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {
  final TaskModel model;

  AddTaskSuccess(this.model);
}

class AddTaskFailure extends AddTaskState {
  final String errorMsg;

  AddTaskFailure(this.errorMsg);
}