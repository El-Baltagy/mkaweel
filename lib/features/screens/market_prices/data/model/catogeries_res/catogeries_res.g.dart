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
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CatogeriesResImplToJson(_$CatogeriesResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };

_$CatogeryItemImpl _$$CatogeryItemImplFromJson(Map<String, dynamic> json) =>
    _$CatogeryItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image_path: json['image_path'],
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

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      current_page: (json['current_page'] as num).toInt(),
      last_page: (json['last_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'last_page': instance.last_page,
      'total': instance.total,
    };
