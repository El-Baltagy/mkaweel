// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waste_calc_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WasteCalcResImpl _$$WasteCalcResImplFromJson(Map<String, dynamic> json) =>
    _$WasteCalcResImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => WasteCalcItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WasteCalcResImplToJson(_$WasteCalcResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$WasteCalcItemImpl _$$WasteCalcItemImplFromJson(Map<String, dynamic> json) =>
    _$WasteCalcItemImpl(
      material_id: (json['material_id'] as num).toInt(),
      material_code: json['material_code'] as String,
      material_name: json['material_name'] as String,
      unit: json['unit'] as String,
      waste_percentage: (json['waste_percentage'] as num).toDouble(),
      required_quantity: (json['required_quantity'] as num).toDouble(),
      waste_quantity: (json['waste_quantity'] as num).toDouble(),
      purchase_quantity: (json['purchase_quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$$WasteCalcItemImplToJson(_$WasteCalcItemImpl instance) =>
    <String, dynamic>{
      'material_id': instance.material_id,
      'material_code': instance.material_code,
      'material_name': instance.material_name,
      'unit': instance.unit,
      'waste_percentage': instance.waste_percentage,
      'required_quantity': instance.required_quantity,
      'waste_quantity': instance.waste_quantity,
      'purchase_quantity': instance.purchase_quantity,
    };
