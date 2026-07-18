import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

/// A horizontal row containing two detail cards (wind speed + condition).
class WeatherDetailsRowWidget extends StatelessWidget {
  const WeatherDetailsRowWidget({
    super.key,
    required this.windSpeed,
    required this.windSpeedUnit,
    required this.status,
    required this.description,
  });

  final double windSpeed;
  final String windSpeedUnit;
  final String status;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Weather details row',
      child: Row(
        children: [
          Expanded(
            child: _DetailCard(
              icon: Icons.air_outlined,
              label: 'wind_speed_label'.tr(),
              value: '${windSpeed.toStringAsFixed(1)} $windSpeedUnit',
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: _DetailCard(
              icon: Icons.cloud_outlined,
              label: 'weather_condition'.tr(),
              value: status,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(AppSizes.s16),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: AppSizes.s24,
            color: AppColors.primaryLightColor,
          ),
          8.verticalSpace,
          Text(
            label,
            style: AppTextStyles.font12Regular.copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.contractorGreyText,
            ),
          ),
          4.verticalSpace,
          Text(
            value,
            style: AppTextStyles.font16SemiBold.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
