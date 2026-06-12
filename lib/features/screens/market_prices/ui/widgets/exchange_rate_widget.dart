import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';

class ExchangeRateWidget extends StatelessWidget {
  const ExchangeRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppSizes.s8),
        /// to do: add border
        // border: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.sync, color: AppColors.contractorGreyText),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('live_exchange_rates'.tr(), style: AppTextStyles.font14Regular.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
              5.verticalSpace,
              Text('1 \$ = 45.89 ₺  |  1 \$ = 13,000 ل.س', style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorDarkText)),
              5.verticalSpace,
              const Text('الآن • open.er-api.com', style: AppTextStyles.font12Regular),
            ],
          ),
        ],
      ),
    );
  }
}
