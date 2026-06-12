import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';

class WasteHeaderWidget extends StatelessWidget {
  const WasteHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'waste_calculator_subtitle'.tr(),
                  style: AppTextStyles.font16SemiBold.copyWith(color: AppColors.contractorDarkText),
                  textAlign: TextAlign.right,
                ),
                4.verticalSpace,
                Text(
                  'waste_calculator_desc'.tr(),
                  style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          16.horizontalSpace,
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.gold.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.architecture, color: AppColors.gold, size: 28),
          ),
        ],
      ),
    );
  }
}
