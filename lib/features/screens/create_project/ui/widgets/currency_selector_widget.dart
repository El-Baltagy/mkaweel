import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';

class CurrencySelectorWidget extends StatelessWidget {
  const CurrencySelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('currency'.tr(), style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorDarkText)),
        10.verticalSpace,
        Row(
          children: [
            Expanded(child: _buildCurrencyBox('₺', 'turkish_lira'.tr(), false)),
            10.horizontalSpace,
            Expanded(child: _buildCurrencyBox('ل.س', 'syrian_lira'.tr(), false)),
            10.horizontalSpace,
            Expanded(child: _buildCurrencyBox('\$', 'us_dollar'.tr(), true)),
          ],
        ),
      ],
    );
  }

  Widget _buildCurrencyBox(String symbol, String name, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.contractorTeal.withOpacity(0.1) : AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.s8),
        /// to do: add border
        // border: .new(
        //   color: isSelected ? AppColors.contractorTeal : AppColors.contractorLightGrey,
        //   width: isSelected ? 2 : 1,
        // ),
      ),
      child: Column(
        children: [
          Text(
            symbol,
            style: AppTextStyles.font18SemiBold.copyWith(
              color: isSelected ? AppColors.contractorTeal : AppColors.contractorDarkText,
            ),
          ),
          5.verticalSpace,
          Text(
            name,
            style: AppTextStyles.font12Regular.copyWith(
              color: isSelected ? AppColors.contractorTeal : AppColors.contractorGreyText,
            ),
          ),
        ],
      ),
    );
  }
}
