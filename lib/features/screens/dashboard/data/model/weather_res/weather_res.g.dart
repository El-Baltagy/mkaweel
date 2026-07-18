// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherResImpl _$$WeatherResImplFromJson(Map<String, dynamic> json) =>
    _$WeatherResImpl(
      status: json['status'] as String,
      data: WeatherData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherResImplToJson(_$WeatherResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.toJson(),
    };

_$WeatherDataImpl _$$WeatherDataImplFromJson(Map<String, dynamic> json) =>
    _$WeatherDataImpl(
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      weather: Weather.fromJson(json['weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherDataImplToJson(_$WeatherDataImpl instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates.toJson(),
      'location': instance.location.toJson(),
      'weather': instance.weather.toJson(),
    };

_$CoordinatesImpl _$$CoordinatesImplFromJson(Map<String, dynamic> json) =>
    _$CoordinatesImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$CoordinatesImplToJson(_$CoordinatesImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      region: json['region'] as String,
      subdivision: json['subdivision'] as String,
      country: json['country'] as String,
      formatted_address: json['formatted_address'] as String,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'region': instance.region,
      'subdivision': instance.subdivision,
      'country': instance.country,
      'formatted_address': instance.formatted_address,
    };

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      temperature: (json['temperature'] as num).toDouble(),
      temperature_unit: json['temperature_unit'] as String,
      wind_speed: (json['wind_speed'] as num).toDouble(),
      wind_speed_unit: json['wind_speed_unit'] as String,
      weather_code: (json['weather_code'] as num).toInt(),
      status: json['status'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'temperature_unit': instance.temperature_unit,
      'wind_speed': instance.wind_speed,
      'wind_speed_unit': instance.wind_speed_unit,
      'weather_code': instance.weather_code,
      'status': instance.status,
      'description': instance.description,
    };
