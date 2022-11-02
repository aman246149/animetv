// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) => LoginEntity(
      json['email'] as String?,
      json['password'] as String?,
    );

Map<String, dynamic> _$LoginEntityToJson(LoginEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
