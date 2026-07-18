class WeatherParameter {
  const WeatherParameter({required this.latitude, required this.longitude});

  final double latitude, longitude;

  Map<String, dynamic> toJson() => {
        'lat': latitude,
        'lng': longitude,
      };
}
