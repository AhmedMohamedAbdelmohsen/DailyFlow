// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      jwtToken: json['jwtToken'] as String?,
      message: json['message'] == null
          ? null
          : MessageResponse.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'jwtToken': instance.jwtToken,
      'message': instance.message,
    };

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      messageType: json['messageType'] as num?,
      messageTypeName: json['messageTypeName'] as String?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => MessagesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'messageTypeName': instance.messageTypeName,
      'messages': instance.messages,
    };

MessagesResponse _$MessagesResponseFromJson(Map<String, dynamic> json) =>
    MessagesResponse(
      code: json['code'] as num?,
      message: json['message'] as String?,
      referenceID: (json['refrenceID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MessagesResponseToJson(MessagesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'refrenceID': instance.referenceID,
    };

TokenPayLoad _$TokenPayLoadFromJson(Map<String, dynamic> json) => TokenPayLoad(
      name: json['name'] as String?,
      pIID: json['PIID'] as String?,
      pID: json['PersonID'] as String?,
      uID: json['UID'] as String?,
      nbf: json['nbf'] as num?,
      exp: json['exp'] as num?,
      iat: json['iat'] as num?,
      iss: json['iss'] as String?,
      aud: json['aud'] as String?,
    );

Map<String, dynamic> _$TokenPayLoadToJson(TokenPayLoad instance) =>
    <String, dynamic>{
      'name': instance.name,
      'PIID': instance.pIID,
      'PersonID': instance.pID,
      'UID': instance.uID,
      'nbf': instance.nbf,
      'exp': instance.exp,
      'iat': instance.iat,
      'iss': instance.iss,
      'aud': instance.aud,
    };
