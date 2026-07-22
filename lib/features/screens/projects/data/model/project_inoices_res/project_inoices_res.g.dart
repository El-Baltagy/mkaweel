// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_inoices_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectInoicesResImpl _$$ProjectInoicesResImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectInoicesResImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: ProjectInoiceData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProjectInoicesResImplToJson(
        _$ProjectInoicesResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

_$ProjectInoiceDataImpl _$$ProjectInoiceDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectInoiceDataImpl(
      invoices: (json['invoices'] as List<dynamic>)
          .map((e) => InvoiceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      budget_summary: Budgetsummary.fromJson(
          json['budget_summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProjectInoiceDataImplToJson(
        _$ProjectInoiceDataImpl instance) =>
    <String, dynamic>{
      'invoices': instance.invoices.map((e) => e.toJson()).toList(),
      'budget_summary': instance.budget_summary.toJson(),
    };

_$InvoiceItemImpl _$$InvoiceItemImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceItemImpl(
      id: (json['id'] as num).toInt(),
      project_id: (json['project_id'] as num).toInt(),
      category_id: (json['category_id'] as num).toInt(),
      invoice_number: json['invoice_number'] as String,
      amount: (json['amount'] as num).toInt(),
      invoice_date: json['invoice_date'] as String,
      category_details: Categorydetails.fromJson(
          json['category_details'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
      attachment: json['attachment'] as String?,
    );

Map<String, dynamic> _$$InvoiceItemImplToJson(_$InvoiceItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.project_id,
      'category_id': instance.category_id,
      'invoice_number': instance.invoice_number,
      'amount': instance.amount,
      'invoice_date': instance.invoice_date,
      'category_details': instance.category_details.toJson(),
      'notes': instance.notes,
      'attachment': instance.attachment,
    };

_$CategorydetailsImpl _$$CategorydetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$CategorydetailsImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image_path: json['image_path'],
      description: json['description'] as String,
      is_active: json['is_active'] as bool,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$CategorydetailsImplToJson(
        _$CategorydetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_path': instance.image_path,
      'description': instance.description,
      'is_active': instance.is_active,
      'type': instance.type,
    };

_$BudgetsummaryImpl _$$BudgetsummaryImplFromJson(Map<String, dynamic> json) =>
    _$BudgetsummaryImpl(
      total_budget: (json['total_budget'] as num).toInt(),
      total_expenses: (json['total_expenses'] as num).toInt(),
      remaining_budget: (json['remaining_budget'] as num).toInt(),
      budget_consumption_percentage:
          (json['budget_consumption_percentage'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$BudgetsummaryImplToJson(_$BudgetsummaryImpl instance) =>
    <String, dynamic>{
      'total_budget': instance.total_budget,
      'total_expenses': instance.total_expenses,
      'remaining_budget': instance.remaining_budget,
      'budget_consumption_percentage': instance.budget_consumption_percentage,
      'currency': instance.currency,
    };
