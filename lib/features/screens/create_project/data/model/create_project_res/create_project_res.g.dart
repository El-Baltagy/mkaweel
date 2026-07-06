// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateProjectResImpl _$$CreateProjectResImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateProjectResImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: ProjectInfoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateProjectResImplToJson(
        _$CreateProjectResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

_$ProjectInfoDataImpl _$$ProjectInfoDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectInfoDataImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      owner_name: json['owner_name'] as String,
      start_date: json['start_date'] as String,
      end_date: json['end_date'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      description: json['description'] as String?,
      extra_details: json['extra_details'] as String?,
      contract_value: json['contract_value'] as String,
      currency: json['currency'] as String,
      progress_percentage: (json['progress_percentage'] as num).toInt(),
      project_phases: (json['project_phases'] as List<dynamic>?)
          ?.map((e) => ProjectphaseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$ProjectInfoDataImplToJson(
        _$ProjectInfoDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner_name': instance.owner_name,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'description': instance.description,
      'extra_details': instance.extra_details,
      'contract_value': instance.contract_value,
      'currency': instance.currency,
      'progress_percentage': instance.progress_percentage,
      'project_phases':
          instance.project_phases?.map((e) => e.toJson()).toList(),
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

_$ProjectphaseItemImpl _$$ProjectphaseItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectphaseItemImpl(
      id: (json['id'] as num).toInt(),
      project_id: (json['project_id'] as num).toInt(),
      phase_id: (json['phase_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
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
