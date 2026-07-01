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
      'data': instance.data.toJson(),
    };

_$RateDataImpl _$$RateDataImplFromJson(Map<String, dynamic> json) =>
    _$RateDataImpl(
      usd: USD.fromJson(json['USD'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RateDataImplToJson(_$RateDataImpl instance) =>
    <String, dynamic>{
      'USD': instance.usd.toJson(),
    };

_$USDImpl _$$USDImplFromJson(Map<String, dynamic> json) => _$USDImpl(
      sell_rate_syp: (json['sell_rate_syp'] as num).toDouble(),
      in_try: (json['in_try'] as num).toDouble(),
      fetched_at: json['fetched_at'] as String,
    );

Map<String, dynamic> _$$USDImplToJson(_$USDImpl instance) => <String, dynamic>{
      'sell_rate_syp': instance.sell_rate_syp,
      'in_try': instance.in_try,
      'fetched_at': instance.fetched_at,
    };
