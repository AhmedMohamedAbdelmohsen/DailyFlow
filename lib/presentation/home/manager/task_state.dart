part of 'task_cubit.dart';

@immutable
class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskSuccess extends TaskState {
  final List<TaskDataModel> tasksList;

  TaskSuccess(this.tasksList);
}

class TaskFailure extends TaskState {
  final String errorMsg;

  TaskFailure(this.errorMsg);
}
