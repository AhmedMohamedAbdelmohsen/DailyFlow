part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  LoginSuccess(this.loginModel);
}

class LoginFailure extends LoginState {
  final String errorMsg;

  LoginFailure(this.errorMsg);
}

class LoginEmailValidationState extends LoginState {
  final String text;
  final String? error;

  LoginEmailValidationState({required this.text, required this.error});
}

class LoginPasswordValidationState extends LoginState {
  final String text;
  final String? error;

  LoginPasswordValidationState({required this.text, required this.error});
}

class LoginIsAllValidState extends LoginState {
  final bool isAllValid;

  LoginIsAllValidState(this.isAllValid);
}
