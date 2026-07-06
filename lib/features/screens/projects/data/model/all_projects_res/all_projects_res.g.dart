// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_projects_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllProjectsResImpl _$$AllProjectsResImplFromJson(Map<String, dynamic> json) =>
    _$AllProjectsResImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProjectInfoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AllProjectsResImplToJson(
        _$AllProjectsResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
