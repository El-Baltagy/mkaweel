// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TasksResImpl _$$TasksResImplFromJson(Map<String, dynamic> json) =>
    _$TasksResImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => TaskItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TasksResImplToJson(_$TasksResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$TaskItemImpl _$$TaskItemImplFromJson(Map<String, dynamic> json) =>
    _$TaskItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      due_date: json['due_date'] as String,
      project:
          ProjectInfoData.fromJson(json['project'] as Map<String, dynamic>),
      worker: Worker.fromJson(json['worker'] as Map<String, dynamic>),
      project_phase: json['project_phase'] == null
          ? null
          : ProjectphaseItem.fromJson(
              json['project_phase'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskItemImplToJson(_$TaskItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
      'due_date': instance.due_date,
      'project': instance.project.toJson(),
      'worker': instance.worker.toJson(),
      'project_phase': instance.project_phase?.toJson(),
    };

_$WorkerImpl _$$WorkerImplFromJson(Map<String, dynamic> json) => _$WorkerImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      dob: json['dob'] as String,
      phone: json['phone'] as String,
      specialization: json['specialization'] as String,
      role: json['role'] as String,
      avatar: json['avatar'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$WorkerImplToJson(_$WorkerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'dob': instance.dob,
      'phone': instance.phone,
      'specialization': instance.specialization,
      'role': instance.role,
      'avatar': instance.avatar,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
