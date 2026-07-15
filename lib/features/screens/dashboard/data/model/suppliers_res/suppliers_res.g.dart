// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suppliers_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuppliersResImpl _$$SuppliersResImplFromJson(Map<String, dynamic> json) =>
    _$SuppliersResImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SuppliersResImplToJson(_$SuppliersResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$DataItemImpl _$$DataItemImplFromJson(Map<String, dynamic> json) =>
    _$DataItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      company_name: json['company_name'] as String?,
      phone: json['phone'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      tax_number: json['tax_number'] as String?,
      notes: json['notes'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$DataItemImplToJson(_$DataItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'company_name': instance.company_name,
      'phone': instance.phone,
      'mobile': instance.mobile,
      'email': instance.email,
      'address': instance.address,
      'tax_number': instance.tax_number,
      'notes': instance.notes,
      'status': instance.status,
    };
