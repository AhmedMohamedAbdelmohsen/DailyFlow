import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:daily_flow/app/app_prefs.dart';
import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/data/network/requests.dart';
import 'package:daily_flow/domain/model/login/login_model.dart';
import 'package:daily_flow/domain/usecase/login/login_usecase.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitial());
  final AppPreferences appPreferences = instance<AppPreferences>();

  final LoginUseCase _loginUseCase;
  bool showPassword = true;
  bool all = false;

  login(LoginRequest loginRequest) async {
    emit(LoginLoading());
    (await _loginUseCase.execute(loginRequest)).fold((failure) {
      emit(LoginFailure(failure.message));
    }, (response) {
      _saveUserDataLocal(response, loginRequest.password!.length).then((value) {
        emit(LoginSuccess(response));
      });
    });
  }

  Future<void> _saveUserDataLocal(LoginModel data, int passwordLength) async {
    appPreferences.setUserLoggedIn(true);
    appPreferences.setUserId(data.id.toInt());
    appPreferences.setUserName(data.name);
    appPreferences.setUserEmail(data.email);
    appPreferences.setUserToken(data.token);
    appPreferences.setPasswordLength(passwordLength);
    resetModules();
  }

  void updatePassword(String newText) {
    final error = _validateText(newText, 1);
    emit(LoginPasswordValidationState(text: newText, error: error));
  }

  void updateEmail(String newText) {
    final error = _validateText(newText, 0);
    emit(LoginEmailValidationState(text: newText, error: error));
  }

  void isAllValid(String name, String pass) {
    emit(LoginIsAllValidState(
        _validateText(name, 0) == null && _validateText(pass, 1) == null));
  }

  String? _validateText(String text, int type) {
    if (text.isEmpty) {
      if (type == 0 /*email validation*/) {
        return LocaleKeys.enterEmail.tr();
      } else {
        return LocaleKeys.enterPassword.tr();
      }
    }
    return null;
  }
}
