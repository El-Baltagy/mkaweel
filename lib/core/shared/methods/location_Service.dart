import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/create_project/data/model/address_model.dart';

class LocationService {
  LocationService._();

  static final LocationService _instance = LocationService._();

  factory LocationService() => _instance;

  /// Get current device location
  Future<Position?> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return null;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return null;
      }

      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
    } catch (e) {
      PrintHelper().ordinaryPrint('Location Error: $e');
      return null;
    }
  }

  /// Convert Position to Placemark
  Future<Placemark?> getPlacemark(Position? position) async {
    if (position == null) return null;

    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
        // localeIdentifier: "en",
      );

      if (placemarks.isEmpty) {
        return null;
      }

      return placemarks.first;
    } on PlatformException catch (e, stack) {
      PrintHelper().ordinaryPrint("Reverse Geocode Error:");
      PrintHelper().ordinaryPrint(e);
      PrintHelper().ordinaryPrint(stack);
      return null;
    }catch(e){}
  }

  /// Create readable address
  String? localOfPlaceMark(Placemark? place) {
    if (place == null) return null;

    final parts = <String>[
      ?place .street,
      ?place.subLocality,
      ?place.locality,
      ?place.subAdministrativeArea,
      ?place.administrativeArea,
      ?place.country,
    ].where((e) => e.trim().isNotEmpty).toList();

    if (parts.isEmpty) {
      return null;
    }

    return parts.join(", ");
  }

  /// Get formatted address directly
  Future<String?> getCurrentAddress() async {
    final position = await getCurrentLocation();

    if (position == null) return null;

    final place = await getPlacemark(position);

    return localOfPlaceMark(place);
  }


  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://nominatim.openstreetmap.org/',
      headers: {
        'User-Agent': 'MkaweelApp/1.0',
      },
    ),
  );



  Future<AddressModel?> reverseGeocode(Position position) async {
    try {
      final response = await _dio.get(
        'reverse',
        queryParameters: {
          'lat': position.latitude,
          'lon': position.longitude,
          'format': 'jsonv2',
        },
      );

      return AddressModel.fromJson(response.data as Map<String,dynamic>);
    } catch (e) {
      PrintHelper().ordinaryPrint(e);
      return null;
    }
  }
}