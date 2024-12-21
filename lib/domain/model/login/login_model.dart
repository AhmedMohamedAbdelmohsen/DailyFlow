import 'package:daily_flow/domain/model/main/main_model.dart';

class LoginModel {
  String jwtToken;
  MessageModel? message;

  LoginModel(
    this.jwtToken,
    this.message,
  );
}
