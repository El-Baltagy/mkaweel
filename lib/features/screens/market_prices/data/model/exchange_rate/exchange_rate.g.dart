// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExchangeRateImpl _$$ExchangeRateImplFromJson(Map<String, dynamic> json) =>
    _$ExchangeRateImpl(
      status: json['status'] as String,
      data: RateData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExchangeRateImplToJson(_$ExchangeRateImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$RateDataImpl _$$RateDataImplFromJson(Map<String, dynamic> json) =>
    _$RateDataImpl(
      USD: json['USD'],
    );

Map<String, dynamic> _$$RateDataImplToJson(_$RateDataImpl instance) =>
    <String, dynamic>{
      'USD': instance.USD,
    };

_$USDImpl _$$USDImplFromJson(Map<String, dynamic> json) => _$USDImpl(
      rateSyp: (json['rateSyp'] as num).toDouble(),
      rateTry: (json['rateTry'] as num).toDouble(),
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$USDImplToJson(_$USDImpl instance) => <String, dynamic>{
      'rateSyp': instance.rateSyp,
      'rateTry': instance.rateTry,
      'updatedAt': instance.updatedAt,
    };
