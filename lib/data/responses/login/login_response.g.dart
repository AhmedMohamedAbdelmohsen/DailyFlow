// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      id: json['id'] as num?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      enabled: json['enabled'] as num?,
      token: json['token'] as String?,
      message: json['message'] as String?,
      admin: json['admin'] as num?,
      warnings: json['warnings'] as num?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'enabled': instance.enabled,
      'token': instance.token,
      'message': instance.message,
      'admin': instance.admin,
      'warnings': instance.warnings,
    };
