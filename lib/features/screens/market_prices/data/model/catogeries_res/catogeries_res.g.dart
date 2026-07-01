// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catogeries_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatogeriesResImpl _$$CatogeriesResImplFromJson(Map<String, dynamic> json) =>
    _$CatogeriesResImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CatogeryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CatogeriesResImplToJson(_$CatogeriesResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$CatogeryItemImpl _$$CatogeryItemImplFromJson(Map<String, dynamic> json) =>
    _$CatogeryItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image_path: json['image_path'] as String?,
      description: json['description'] as String,
      is_active: json['is_active'] as bool,
      type: json['type'] as String,
      construction_materials_count:
          (json['construction_materials_count'] as num?)?.toInt(),
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$CatogeryItemImplToJson(_$CatogeryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_path': instance.image_path,
      'description': instance.description,
      'is_active': instance.is_active,
      'type': instance.type,
      'construction_materials_count': instance.construction_materials_count,
      'created_at': instance.created_at,
    };
