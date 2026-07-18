import 'package:flutter/material.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/entrance_fader.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/weather_res/weather_res.dart';
import 'package:mkaweel/features/screens/dashboard/ui/weather/widgets/weather_description_card_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/weather/widgets/weather_details_row_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/weather/widgets/weather_error_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/weather/widgets/weather_header_widget.dart';
 import 'package:mkaweel/features/screens/dashboard/ui/weather/widgets/weather_location_card_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Renders the weather content based on the current [BaseEmit] state.
class WeatherContentWidget extends StatelessWidget {
  const WeatherContentWidget({
    super.key,
    required this.state,
    required this.onRetry,
  });

  final BaseEmit? state;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    // Error state
    if (state is ErrorState) {
      return WeatherErrorWidget(onRetry: onRetry);
    }

    // Loading or success
    final bool isLoading = state is! Success<WeatherRes>;

    // Use dummy data for skeleton loading
    final WeatherRes data = isLoading
        ? _dummyWeatherRes
        : (state as Success<WeatherRes>).data!;

    final weather = data.data.weather;
    final location = data.data.location;

    return EntranceFader(
      dx: context.isLTR ? -32 : 32,
      enableAnimation: !isLoading,
      child: Skeletonizer(
        enabled: isLoading,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          child: Column(
            children: [

              // Hero temperature display
              WeatherHeaderWidget(
                temperature: weather.temperature,
                temperatureUnit: weather.temperature_unit,
                weatherCode: weather.weather_code,
                status: weather.status,
                locationName: location.formatted_address,
              ),
              24.verticalSpace,

              // Wind speed + condition row
               WeatherDetailsRowWidget(
                windSpeed: weather.wind_speed,
                windSpeedUnit: weather.wind_speed_unit,
                status: weather.status,
                description: weather.description,
              ),
              16.verticalSpace,

              // Description card
              WeatherDescriptionCardWidget(
                description: weather.description,
              ),
              16.verticalSpace,

              // Location card
              WeatherLocationCardWidget(
                formattedAddress: location.formatted_address,
                region: location.region,
                subdivision: location.subdivision,
                country: location.country,
              ),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

/// Dummy data used for skeleton loading state.
final WeatherRes _dummyWeatherRes = WeatherRes(
  status: 'ok',
  data: WeatherData(
    coordinates: const Coordinates(latitude: 0, longitude: 0),
    location: const Location(
      region: 'Loading region',
      subdivision: 'Loading sub',
      country: 'Loading country',
      formatted_address: 'Loading address...',
    ),
    weather: const Weather(
      temperature: 25,
      temperature_unit: '°C',
      wind_speed: 10,
      wind_speed_unit: 'km/h',
      weather_code: 0,
      status: 'Loading...',
      description: 'Loading weather description...',
    ),
  ),
);
