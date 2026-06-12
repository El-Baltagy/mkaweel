import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';

class EmptyProjectsWidget extends StatelessWidget {
  const EmptyProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home_outlined, // Placeholder for the actual house outline icon
            size: AppSizes.s100,
            color: AppColors.contractorGreyText.withOpacity(0.5),
          ),
          20.verticalSpace,
            Text(
            'no_projects'.tr(),
            style: AppTextStyles.font18SemiBold,
          ),
          10.verticalSpace,
          Text(
            'press_to_create_project'.tr(),
            style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorGreyText),
          ),
        ],
      ),
    );
  }
}
