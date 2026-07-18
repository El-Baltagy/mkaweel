import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

/// Full-screen error widget with retry button.
class WeatherErrorWidget extends StatelessWidget {
  const WeatherErrorWidget({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Semantics(
      label: 'Weather error state',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_off_outlined,
                size: AppSizes.s80,
                color: AppColors.contractorGreyText.withOpacity(0.5),
              ),
              20.verticalSpace,
              Text(
                'weather_error'.tr(),
                style: AppTextStyles.font18SemiBold.copyWith(
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              24.verticalSpace,
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh, size: AppSizes.s20),
                label: Text('retry'.tr()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryLightColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p24,
                    vertical: AppPadding.p12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.s12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
