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


class TaskNameValidationState extends AddTaskState {
  final String text;
  final String? error;

  TaskNameValidationState({required this.text, required this.error});
}

class PriorityValidationState extends AddTaskState {
  final String text;
  final String? error;

  PriorityValidationState({required this.text, required this.error});
}

class CreateTaskIsAllValidState extends AddTaskState {
  final bool isAllValid;

  CreateTaskIsAllValidState(this.isAllValid);
}
