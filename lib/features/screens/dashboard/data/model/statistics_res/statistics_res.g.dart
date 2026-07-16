// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatisticsResImpl _$$StatisticsResImplFromJson(Map<String, dynamic> json) =>
    _$StatisticsResImpl(
      status: json['status'] as String,
      data: StatisticData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StatisticsResImplToJson(_$StatisticsResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.toJson(),
    };

_$StatisticDataImpl _$$StatisticDataImplFromJson(Map<String, dynamic> json) =>
    _$StatisticDataImpl(
      total_projects: (json['total_projects'] as num).toInt(),
      completed_projects: (json['completed_projects'] as num).toInt(),
      total_tasks: (json['total_tasks'] as num).toInt(),
      completed_tasks: (json['completed_tasks'] as num).toInt(),
      total_workers: (json['total_workers'] as num).toInt(),
    );

Map<String, dynamic> _$$StatisticDataImplToJson(_$StatisticDataImpl instance) =>
    <String, dynamic>{
      'total_projects': instance.total_projects,
      'completed_projects': instance.completed_projects,
      'total_tasks': instance.total_tasks,
      'completed_tasks': instance.completed_tasks,
      'total_workers': instance.total_workers,
    };
