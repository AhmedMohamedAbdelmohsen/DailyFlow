import 'package:daily_flow/app/constants.dart';
import 'package:daily_flow/app/extension.dart';
import 'package:daily_flow/data/responses/login/login_response.dart';
import 'package:daily_flow/domain/model/login/login_model.dart';

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(
        this?.id?.orZero() ?? Constants.zero,
        this?.name?.orEmpty() ?? Constants.empty,
        this?.email?.orEmpty() ?? Constants.empty,
        this?.enabled?.orZero() ?? Constants.zero,
        this?.token?.orEmpty() ?? Constants.empty,
        this?.message?.orEmpty() ?? Constants.empty,
        this?.admin?.orZero() ?? Constants.zero,
        this?.warnings?.orZero() ?? Constants.zero);
  }
}
