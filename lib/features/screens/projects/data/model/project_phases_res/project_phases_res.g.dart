// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_phases_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectPhasesResImpl _$$ProjectPhasesResImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectPhasesResImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProjectphaseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProjectPhasesResImplToJson(
        _$ProjectPhasesResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$ProjectphaseItemImpl _$$ProjectphaseItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectphaseItemImpl(
      id: (json['id'] as num).toInt(),
      project_id: (json['project_id'] as num).toInt(),
      phase_id: (json['phase_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      planned_start_date: json['planned_start_date'] as String?,
      planned_end_date: json['planned_end_date'] as String?,
      actual_start_date: json['actual_start_date'] as String?,
      actual_end_date: json['actual_end_date'] as String?,
      progress_percentage: (json['progress_percentage'] as num).toInt(),
      status: json['status'] as String,
      notes: json['notes'] as String?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$ProjectphaseItemImplToJson(
        _$ProjectphaseItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.project_id,
      'phase_id': instance.phase_id,
      'name': instance.name,
      'description': instance.description,
      'planned_start_date': instance.planned_start_date,
      'planned_end_date': instance.planned_end_date,
      'actual_start_date': instance.actual_start_date,
      'actual_end_date': instance.actual_end_date,
      'progress_percentage': instance.progress_percentage,
      'status': instance.status,
      'notes': instance.notes,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
