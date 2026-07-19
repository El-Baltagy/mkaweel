// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pj_phase_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PjPhaseUpdateImpl _$$PjPhaseUpdateImplFromJson(Map<String, dynamic> json) =>
    _$PjPhaseUpdateImpl(
      status: json['status'] as String,
      data: PhaseUpdateData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PjPhaseUpdateImplToJson(_$PjPhaseUpdateImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.toJson(),
    };

_$PhaseUpdateDataImpl _$$PhaseUpdateDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PhaseUpdateDataImpl(
      progress_updates: (json['progress_updates'] as List<dynamic>)
          .map((e) => ProgressupdateItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PhaseUpdateDataImplToJson(
        _$PhaseUpdateDataImpl instance) =>
    <String, dynamic>{
      'progress_updates':
          instance.progress_updates.map((e) => e.toJson()).toList(),
    };

_$ProgressupdateItemImpl _$$ProgressupdateItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProgressupdateItemImpl(
      id: (json['id'] as num).toInt(),
      progress_percentage: (json['progress_percentage'] as num).toInt(),
      update_date: json['update_date'] as String,
      notes: json['notes'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      creator_name: json['creator_name'] as String,
    );

Map<String, dynamic> _$$ProgressupdateItemImplToJson(
        _$ProgressupdateItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'progress_percentage': instance.progress_percentage,
      'update_date': instance.update_date,
      'notes': instance.notes,
      'photos': instance.photos,
      'creator_name': instance.creator_name,
    };
