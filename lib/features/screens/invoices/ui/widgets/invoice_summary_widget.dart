import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';

class InvoiceSummaryWidget extends StatelessWidget {
  const InvoiceSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.contractorBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('subtotal'.tr(), style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText)),
              Text('0 ر.س', style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorDarkText)),
            ],
          ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('vat_tax'.tr(), style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText)),
              Text('0 ر.س', style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorDarkText)),
            ],
          ),
          12.verticalSpace,
          const Divider(color: AppColors.contractorLightGrey),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('item_total'.tr(), style: AppTextStyles.font18SemiBold.copyWith(color: AppColors.contractorDarkText,
                  fontSize: 14)),
              Text('0 ر.س', style: AppTextStyles.font16SemiBold.copyWith(color: Theme.of(context).primaryColor)),
            ],
          ),
        ],
      ),
    );
  }
}
