import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

/// A card displaying the weather description text.
class WeatherDescriptionCardWidget extends StatelessWidget {
  const WeatherDescriptionCardWidget({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Semantics(
      label: 'Weather description: $description',
      child: Container(
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
                  Icons.description_outlined,
                  size: AppSizes.s20,
                  color: AppColors.primaryLightColor,
                ),
                8.horizontalSpace,
                Text(
                  'weather_description'.tr(),
                  style: AppTextStyles.font14Regular.copyWith(
                    color: isDark ? AppColors.darkTextSecondary : AppColors.contractorGreyText,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Text(
              description,
              style: AppTextStyles.font14Regular.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
