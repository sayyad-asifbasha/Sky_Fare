// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      token: json['token'] as String? ?? '',
      message: json['message'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isAdmin: json['isAdmin'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'message': instance.message,
      'name': instance.name,
      'isAdmin': instance.isAdmin,
    };
