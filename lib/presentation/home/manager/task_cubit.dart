import 'package:bloc/bloc.dart';
import 'package:daily_flow/app/app_prefs.dart';
import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/domain/model/task/task_model.dart';
import 'package:daily_flow/domain/usecase/task/task_usecase.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this._taskUseCase) : super(TaskInitial());

  final TaskUseCase _taskUseCase;

  final AppPreferences _appPreferences = instance<AppPreferences>();

  getTasksList() async {
    int userId = _appPreferences.getUserId();
    emit(TaskLoading());
    (await _taskUseCase.execute(userId)).fold((failure) {
      emit(TaskFailure(failure.message));
    }, (response) {
      emit(TaskSuccess(response));
    });
  }
}
