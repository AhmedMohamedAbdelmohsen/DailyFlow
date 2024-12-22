import 'package:bloc/bloc.dart';
import 'package:daily_flow/app/app_prefs.dart';
import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/data/responses/task/task_response.dart';
import 'package:daily_flow/domain/model/task/task_model.dart';
import 'package:daily_flow/domain/usecase/task/create_task_usecase.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this._createTaskUseCase) : super(AddTaskInitial());

  final CreateTaskUseCase _createTaskUseCase;

  final AppPreferences _appPreferences = instance<AppPreferences>();
  TaskResponse requestModel = TaskResponse();

  addTask() async {
    int userId = _appPreferences.getUserId();
    requestModel.completed = true;
    emit(AddTaskLoading());
    (await _createTaskUseCase.execute(TaskMainModel(userId, requestModel)))
        .fold((failure) {
      emit(AddTaskFailure(failure.message));
    }, (response) {
      emit(AddTaskSuccess(response));
    });
  }

  void updateTaskName(String newText) {
    requestModel.description = newText;
    final error = _validateText(newText, 1);
    emit(TaskNameValidationState(text: newText, error: error));
  }

  void updatePriority(String newText) {
    final error = _validateText(newText, 0);
    emit(PriorityValidationState(text: newText, error: error));
  }

  void isAllValid(String name) {
    emit(CreateTaskIsAllValidState(
        _validateText(name, 0) == null));
  }

  String? _validateText(String text, int type) {
    if (text.isEmpty) {
      if (type == 0 /*name validation*/) {
        return LocaleKeys.taskName.tr();
      }
    }
    return null;
  }
}
