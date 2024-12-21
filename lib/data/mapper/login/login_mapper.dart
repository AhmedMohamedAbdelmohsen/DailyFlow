import 'package:daily_flow/app/constants.dart';
import 'package:daily_flow/app/extension.dart';
import 'package:daily_flow/data/responses/login/login_response.dart';
import 'package:daily_flow/domain/model/login/login_model.dart';
import 'package:daily_flow/domain/model/main/main_model.dart';


extension MessagesResponseMapper on MessagesResponse? {
  MessageItemModel toDomain() {
    return MessageItemModel(this?.code?.orZero() ?? Constants.zero,
        this?.message?.orEmpty() ?? Constants.empty);
  }
}

extension MessageResponseMapper on MessageResponse? {
  MessageModel toDomain() {
    return MessageModel(
      this?.messageType?.orZero() ?? Constants.zero,
      this?.messageTypeName?.orEmpty() ?? Constants.empty,
      (this?.messages?.map((message) => message.toDomain()) ??
              const Iterable.empty())
          .cast<MessageItemModel>()
          .toList(),
    );
  }
}

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(
      this?.jwtToken?.orEmpty() ?? Constants.empty,
      this?.message?.toDomain(),
    );
  }
}
