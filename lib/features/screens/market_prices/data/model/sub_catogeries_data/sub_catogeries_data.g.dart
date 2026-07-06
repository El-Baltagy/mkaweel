// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_catogeries_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubCatogeriesDataImpl _$$SubCatogeriesDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SubCatogeriesDataImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      currency: json['currency'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => SubCatogeryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SubCatogeriesDataImplToJson(
        _$SubCatogeriesDataImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'currency': instance.currency,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination?.toJson(),
    };

_$SubCatogeryItemImpl _$$SubCatogeryItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SubCatogeryItemImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String?,
      name: json['name'] as String,
      category_id: (json['category_id'] as num?)?.toInt(),
      category: CatogeryItem.fromJson(json['category'] as Map<String, dynamic>),
      unit: json['unit'] as String?,
      origin_country: json['origin_country'] as String,
      unit_price: (json['unit_price'] as num).toDouble(),
      selling_price: (json['selling_price'] as num?)?.toDouble(),
      image_path: json['image_path'] as String?,
      currency: json['currency'] as String?,
      current_quantity: (json['current_quantity'] as num?)?.toInt(),
      minimum_quantity: (json['minimum_quantity'] as num?)?.toInt(),
      reorder_quantity: (json['reorder_quantity'] as num?)?.toInt(),
      supplier_name: json['supplier_name'] as String?,
      supplier_phone: json['supplier_phone'] as String?,
      status: json['status'] as String?,
      waste_percentage: json['waste_percentage'] as String?,
      is_available: json['is_available'] as bool?,
      notes: json['notes'] as String?,
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$SubCatogeryItemImplToJson(
        _$SubCatogeryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'category_id': instance.category_id,
      'category': instance.category.toJson(),
      'unit': instance.unit,
      'origin_country': instance.origin_country,
      'unit_price': instance.unit_price,
      'selling_price': instance.selling_price,
      'image_path': instance.image_path,
      'currency': instance.currency,
      'current_quantity': instance.current_quantity,
      'minimum_quantity': instance.minimum_quantity,
      'reorder_quantity': instance.reorder_quantity,
      'supplier_name': instance.supplier_name,
      'supplier_phone': instance.supplier_phone,
      'status': instance.status,
      'waste_percentage': instance.waste_percentage,
      'is_available': instance.is_available,
      'notes': instance.notes,
      'created_at': instance.created_at,
    };

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      current_page: (json['current_page'] as num).toInt(),
      last_page: (json['last_page'] as num).toInt(),
      per_page: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'last_page': instance.last_page,
      'per_page': instance.per_page,
      'total': instance.total,
    };
