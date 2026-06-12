import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';

class CurrencyTabsWidget extends StatelessWidget {
  const CurrencyTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildTab(context,'turkish_lira'.tr(), false)),
        10.horizontalSpace,
        Expanded(child: _buildTab(context,'syrian_lira'.tr(), false)),
        10.horizontalSpace,
        Expanded(child: _buildTab(context,'dollar'.tr(), true)),
      ],
    );
  }

  Widget _buildTab(BuildContext context,String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.1) : AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.s8),
        /// to do: add border
        // border: BorderSide(
        //   color: isSelected ? Theme.of(context).primaryColor : AppColors.contractorLightGrey,
        // ),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: AppTextStyles.font14Regular.copyWith(
          color: isSelected ? Theme.of(context).primaryColor : AppColors.contractorDarkText,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
