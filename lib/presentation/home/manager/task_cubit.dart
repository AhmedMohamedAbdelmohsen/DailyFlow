import 'package:bloc/bloc.dart';
import 'package:daily_flow/app/app_prefs.dart';
import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/app/extension.dart';
import 'package:daily_flow/app/functions.dart';
import 'package:daily_flow/domain/model/task/task_model.dart';
import 'package:daily_flow/domain/usecase/task/task_usecase.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this._taskUseCase) : super(TaskInitial());

  final TaskUseCase _taskUseCase;

  final AppPreferences _appPreferences = instance<AppPreferences>();

  getTasksList(BuildContext context,String selectedDate) async {
    int userId = _appPreferences.getUserId();
    emit(TaskLoading());
    (await _taskUseCase.execute(userId)).fold((failure) {
      emit(TaskFailure(failure.message));

      /// logout if expired token
      _showExpiredTokenToast(LocaleKeys.expiredSession.tr());
      logOut(context);
    }, (response) {
      for (var item in response) {
        item.startTime = getRandomTimeRange();
        item.date = getRandomDateWithinFiveDays();
        item.date = DateTime.now().defaultToSend();
        item.color = getPriorityColor(item.meta!.priority);
      }
      /// filter by selected date
      response = response.where((task) => task.date == selectedDate).toList();
      emit(TaskSuccess(response));
    });
  }

  _showExpiredTokenToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: FontSize.s16.sp);
  }
}
