import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';

class GanttEmptyStateWidget extends StatelessWidget {
  const GanttEmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
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
      child: Column(
        children: [
          Icon(Icons.calendar_today_outlined, size: 64, color: AppColors.contractorGreyText.withOpacity(0.5)),
          24.verticalSpace,
          Text(
            'no_tasks_in_project'.tr(),
            style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorGreyText),
            textAlign: TextAlign.center,
          ),
          32.verticalSpace,
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.contractorTeal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                'add_tasks'.tr(),
                style: AppTextStyles.font18SemiBold.copyWith(color: Colors.white,
                fontSize: 14
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
