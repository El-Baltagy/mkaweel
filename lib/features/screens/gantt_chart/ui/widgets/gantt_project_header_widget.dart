import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/extension/context.dart';

class GanttProjectHeaderWidget extends StatelessWidget {
  const GanttProjectHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'invoice_project_name_example'.tr(),
                style: AppTextStyles.font16SemiBold.copyWith(color: context.theme.colorScheme.tertiaryFixed),
              ),
              8.verticalSpace,
              Text(
                'gantt_date_example'.tr(),
                style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildLegendItem(context,'today_task'.tr(), Colors.transparent, hasBorder: true),
            12.horizontalSpace,
            _buildLegendItem(context,'pending_task'.tr(), AppColors.contractorGreyText),
            12.horizontalSpace,
            _buildLegendItem(context,'in_progress_task'.tr(), AppColors.gold),
            12.horizontalSpace,
            _buildLegendItem(context,'completed_task'.tr(), AppColors.contractorGreen),
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem(BuildContext context,String title, Color color, {bool hasBorder = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText),
        ),
        8.horizontalSpace,
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
            border: hasBorder ? Border.all(color: context.theme.colorScheme.secondary, width: 2) : null,
          ),
        ),
      ],
    );
  }
}
