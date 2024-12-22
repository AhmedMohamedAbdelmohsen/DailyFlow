import 'package:bloc/bloc.dart';
import 'package:daily_flow/app/app_prefs.dart';
import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/data/responses/task/task_response.dart';
import 'package:daily_flow/domain/model/task/task_model.dart';
import 'package:daily_flow/domain/usecase/task/create_task_usecase.dart';
import 'package:meta/meta.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this._createTaskUseCase) : super(AddTaskInitial());

  final CreateTaskUseCase _createTaskUseCase;

  final AppPreferences _appPreferences = instance<AppPreferences>();
  TaskResponse requestModel = TaskResponse();

  getTasksList() async {
    int userId = _appPreferences.getUserId();
    emit(AddTaskLoading());
    (await _createTaskUseCase.execute(TaskMainModel(userId, requestModel)))
        .fold((failure) {
      emit(AddTaskFailure(failure.message));
    }, (response) {
      emit(AddTaskSuccess(response));
    });
  }
}
