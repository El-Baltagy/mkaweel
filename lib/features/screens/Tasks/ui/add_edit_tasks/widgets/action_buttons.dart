import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.onCancel,
    required this.onCreateTask,
  });

  final VoidCallback onCancel;
  final VoidCallback onCreateTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p16,
        horizontal: AppPadding.p20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.lightBackground,
        border: Border(
          top: BorderSide(color: AppColors.lightBorder),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Cancel Button
          TextButton(
            onPressed: onCancel,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p24,
                vertical: AppPadding.p12,
              ),
              backgroundColor: AppColors.lightTextSecondary.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.s8),
              ),
            ),
            child: Text(
              'cancel'.tr(),
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.lightTextSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          AppPadding.p12.horizontalSpace,
          
          // Create Task Button
          ElevatedButton(
            onPressed: onCreateTask,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p24,
                vertical: AppPadding.p12,
              ),
              backgroundColor: AppColors.primaryLightColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.s8),
              ),
              elevation: 0,
            ),
            child: Text(
              'create_task_btn'.tr(),
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.lightBackground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
