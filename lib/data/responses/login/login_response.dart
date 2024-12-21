import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "jwtToken")
  String? jwtToken;
  @JsonKey(name: "message")
  MessageResponse? message;

  LoginResponse({
    this.jwtToken,
    this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class MessageResponse {
  @JsonKey(name: "messageType")
  num? messageType;
  @JsonKey(name: "messageTypeName")
  String? messageTypeName;
  @JsonKey(name: "messages")
  List<MessagesResponse>? messages;

  MessageResponse({
    this.messageType,
    this.messageTypeName,
    this.messages,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}

@JsonSerializable()
class MessagesResponse {
  @JsonKey(name: "code")
  num? code;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "refrenceID")
  int? referenceID;

  MessagesResponse({
    this.code,
    this.message,
    this.referenceID,
  });

  factory MessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesResponseToJson(this);
}

@JsonSerializable()
class TokenPayLoad {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "PIID")
  String? pIID;
  @JsonKey(name: "PersonID")
  String? pID;
  @JsonKey(name: "UID")
  String? uID;
  @JsonKey(name: "nbf")
  num? nbf;
  @JsonKey(name: "exp")
  num? exp;
  @JsonKey(name: "iat")
  num? iat;
  @JsonKey(name: "iss")
  String? iss;
  @JsonKey(name: "aud")
  String? aud;

  TokenPayLoad(
      {this.name,
      this.pIID,
      this.pID,
      this.uID,
      this.nbf,
      this.exp,
      this.iat,
      this.iss,
      this.aud});

  factory TokenPayLoad.fromJson(Map<String, dynamic> json) =>
      _$TokenPayLoadFromJson(json);

  Map<String, dynamic> toJson() => _$TokenPayLoadToJson(this);
}
