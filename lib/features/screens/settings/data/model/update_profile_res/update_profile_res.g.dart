// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateProfileResImpl _$$UpdateProfileResImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateProfileResImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UpdateProfileResImplToJson(
        _$UpdateProfileResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      user: User.fromJson(json['user']),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
    };
