// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceResImpl _$$InvoiceResImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceResImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: InvoiceData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InvoiceResImplToJson(_$InvoiceResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

_$InvoiceDataImpl _$$InvoiceDataImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceDataImpl(
      invoice: Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      budget_summary: Budgetsummary.fromJson(
          json['budget_summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InvoiceDataImplToJson(_$InvoiceDataImpl instance) =>
    <String, dynamic>{
      'invoice': instance.invoice.toJson(),
      'budget_summary': instance.budget_summary.toJson(),
    };

_$InvoiceImpl _$$InvoiceImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceImpl(
      id: (json['id'] as num).toInt(),
      project_id: (json['project_id'] as num).toInt(),
      category_id: json['category_id'] as String,
      invoice_number: json['invoice_number'] as String?,
      amount: (json['amount'] as num).toInt(),
      invoice_date: json['invoice_date'] as String?,
      category_details: json['category_details'] == null
          ? null
          : Categorydetails.fromJson(
              json['category_details'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
      attachment: json['attachment'] as String?,
    );

Map<String, dynamic> _$$InvoiceImplToJson(_$InvoiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.project_id,
      'category_id': instance.category_id,
      'invoice_number': instance.invoice_number,
      'amount': instance.amount,
      'invoice_date': instance.invoice_date,
      'category_details': instance.category_details?.toJson(),
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
