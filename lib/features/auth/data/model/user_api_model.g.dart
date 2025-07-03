// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) => UserApiModel(
      userId: json['userId'] as String?,
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      profilePhoto: json['profilePhoto'] as String?,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserApiModelToJson(UserApiModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'profilePhoto': instance.profilePhoto,
      'role': instance.role,
    };
