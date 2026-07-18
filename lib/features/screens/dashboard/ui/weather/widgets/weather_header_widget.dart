import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

/// Maps a WMO weather_code to an emoji icon string.
String weatherCodeToEmoji(int code) {
  if (code == 0) return '☀️';
  if (code <= 3) return '⛅';
  if (code <= 49) return '🌫️';
  if (code <= 59) return '🌧️';
  if (code <= 69) return '🌨️';
  if (code <= 79) return '❄️';
  if (code <= 84) return '🌧️';
  if (code <= 94) return '❄️';
  return '⛈️';
}

/// Large centered header showing the temperature, emoji, and status text.
class WeatherHeaderWidget extends StatelessWidget {
  const WeatherHeaderWidget({
    super.key,
    required this.temperature,
    required this.temperatureUnit,
    required this.weatherCode,
    required this.status,
    required this.locationName,
  });

  final double temperature;
  final String temperatureUnit;
  final int weatherCode;
  final String status;
  final String locationName;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Semantics(
      label: 'Weather header: $status, ${temperature.toStringAsFixed(0)} $temperatureUnit',
      child: Column(
        children: [
          // Location pin
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: AppSizes.s16,
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              ),
              4.horizontalSpace,
              Flexible(
                child: Text(
                  locationName,
                  style: AppTextStyles.font14Regular.copyWith(
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          12.verticalSpace,

          // Weather emoji
          Text(
            weatherCodeToEmoji(weatherCode),
            style: const TextStyle(fontSize: 64),
          ),
          8.verticalSpace,

          // Temperature
          Text(
            '${temperature.toStringAsFixed(0)}°',
            style: AppTextStyles.font24Bold.copyWith(
              fontSize: 56,
              fontWeight: FontWeight.w700,
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),

          // Status text
          Text(
            status,
            style: AppTextStyles.font18SemiBold.copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.contractorGreyText,
            ),
          ),
        ],
      ),
    );
  }
}
