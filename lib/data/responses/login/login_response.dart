import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'id')
  num? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'enabled')
  num? enabled;
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'admin')
  num? admin;
  @JsonKey(name: 'warnings')
  num? warnings;

  LoginResponse({
    this.id,
    this.name,
    this.email,
    this.enabled,
    this.token,
    this.message,
    this.admin,
    this.warnings,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
