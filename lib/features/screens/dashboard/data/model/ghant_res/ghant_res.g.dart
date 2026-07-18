// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ghant_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GhantResImpl _$$GhantResImplFromJson(Map<String, dynamic> json) =>
    _$GhantResImpl(
      status: json['status'] as String,
      data: GhantData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GhantResImplToJson(_$GhantResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.toJson(),
    };

_$GhantDataImpl _$$GhantDataImplFromJson(Map<String, dynamic> json) =>
    _$GhantDataImpl(
      selected_project: Selectedproject.fromJson(
          json['selected_project'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GhantDataImplToJson(_$GhantDataImpl instance) =>
    <String, dynamic>{
      'selected_project': instance.selected_project.toJson(),
    };

_$SelectedprojectImpl _$$SelectedprojectImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectedprojectImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      progress_percentage: (json['progress_percentage'] as num).toDouble(),
      phases: (json['phases'] as List<dynamic>)
          .map((e) => PhaseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SelectedprojectImplToJson(
        _$SelectedprojectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'progress_percentage': instance.progress_percentage,
      'phases': instance.phases.map((e) => e.toJson()).toList(),
    };

_$PhaseItemImpl _$$PhaseItemImplFromJson(Map<String, dynamic> json) =>
    _$PhaseItemImpl(
      phase_id: (json['phase_id'] as num).toInt(),
      phase_name: json['phase_name'] as String,
      progress_percentage: (json['progress_percentage'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$PhaseItemImplToJson(_$PhaseItemImpl instance) =>
    <String, dynamic>{
      'phase_id': instance.phase_id,
      'phase_name': instance.phase_name,
      'progress_percentage': instance.progress_percentage,
      'status': instance.status,
    };
