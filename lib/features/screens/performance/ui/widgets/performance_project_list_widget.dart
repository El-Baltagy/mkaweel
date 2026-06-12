import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/extension/context.dart';

class PerformanceProjectListWidget extends StatelessWidget {
  const PerformanceProjectListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('weak'.tr(), style: AppTextStyles.font16SemiBold.copyWith(color: context.theme.colorScheme.secondary)),
                4.verticalSpace,
                Text('rate_0_0'.tr(), style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('invoice_project_name_example'.tr(), style: AppTextStyles.font16SemiBold.copyWith(color: context.theme.colorScheme.tertiaryFixed)),
                    8.horizontalSpace,
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.gold,
                      child: Text('1', style: AppTextStyles.font18SemiBold.copyWith(color: Colors.white,
                          fontSize: 12)),
                    ),
                  ],
                ),
                4.verticalSpace,
                Text('aleppo_new_aleppo'.tr(), style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText)),
                12.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildBadge('active'.tr(), AppColors.contractorGreen, AppColors.contractorGreen.withOpacity(0.1)),
                    8.horizontalSpace,
                    _buildBadge('tasks_0_0'.tr(), AppColors.contractorGreyText, context.theme.canvasColor),
                    8.horizontalSpace,
                    _buildBadge('spend_0'.tr(), AppColors.contractorGreyText, context.theme.canvasColor),
                    8.horizontalSpace,
                    _buildBadge('completion_0'.tr(), AppColors.contractorGreyText, context.theme.canvasColor),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color textColor, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: AppTextStyles.font14Regular.copyWith(color: textColor,
            fontSize: 12),
      ),
    );
  }
}
