import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
 class LocationService {
   LocationService._();
   factory LocationService() => _instance;
   static final LocationService _instance = LocationService._();
  Future<Position?> getCurrentLocation() async {
    // Check if location service is enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // throw Exception('Location permission denied.');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // throw Exception(
      //   'Location permission permanently denied. Please enable it in settings.',
      // );
      return null;
    }
// var x=;
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    ) ;
  }


  Future<Placemark?> getPlacemark(Position position) async {
    try{
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      return placemarks.first;
    }catch(e){
      return null;
    }
  }
    String localOfPlaceMark(Placemark? cityPlaceMark) {
    return cityPlaceMark == null
        ? ''
        : '${cityPlaceMark.locality!} ${cityPlaceMark.subAdministrativeArea!} , ${cityPlaceMark.administrativeArea!}';
  }
}