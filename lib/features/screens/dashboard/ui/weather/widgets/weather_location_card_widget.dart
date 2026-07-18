import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

/// A card showing the full location info: formatted address, region, country.
class WeatherLocationCardWidget extends StatelessWidget {
  const WeatherLocationCardWidget({
    super.key,
    required this.formattedAddress,
    required this.region,
    required this.subdivision,
    required this.country,
  });

  final String formattedAddress;
  final String region;
  final String subdivision;
  final String country;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
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
          Row(
            children: [
              Icon(
                Icons.place_outlined,
                size: AppSizes.s20,
                color: AppColors.primaryLightColor,
              ),
              8.horizontalSpace,
              Text(
                'weather_location'.tr(),
                style: AppTextStyles.font14Regular.copyWith(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.contractorGreyText,
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Text(
            formattedAddress,
            style: AppTextStyles.font16SemiBold.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          4.verticalSpace,
          Text(
            '$region · $subdivision · $country',
            style: AppTextStyles.font12Regular.copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.contractorGreyText,
            ),
          ),
        ],
      ),
    );
  }
}
