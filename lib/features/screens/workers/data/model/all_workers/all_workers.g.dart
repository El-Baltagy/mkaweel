// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_workers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllWorkersImpl _$$AllWorkersImplFromJson(Map<String, dynamic> json) =>
    _$AllWorkersImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => WorkerItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AllWorkersImplToJson(_$AllWorkersImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$WorkerItemImpl _$$WorkerItemImplFromJson(Map<String, dynamic> json) =>
    _$WorkerItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      dob: json['dob'] as String,
      phone: json['phone'] as String,
      specialization: json['specialization'] as String,
      role: json['role'] as String,
      avatar: json['avatar'] as String,
      projects: (json['projects'] as List<dynamic>)
          .map((e) => ProjectItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$WorkerItemImplToJson(_$WorkerItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'dob': instance.dob,
      'phone': instance.phone,
      'specialization': instance.specialization,
      'role': instance.role,
      'avatar': instance.avatar,
      'projects': instance.projects.map((e) => e.toJson()).toList(),
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

_$ProjectItemImpl _$$ProjectItemImplFromJson(Map<String, dynamic> json) =>
    _$ProjectItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ProjectItemImplToJson(_$ProjectItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
