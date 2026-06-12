import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';

class InvoiceItemsWidget extends StatelessWidget {
  const InvoiceItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.contractorBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.contractorLightGrey),
            ),
            child: Text(
              'item_description'.tr(),
              style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText),
            ),
          ),
          12.verticalSpace,
          Row(
            children: [
               Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('item_total'.tr(), style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorGreyText,
                        fontSize: 10)),
                    4.verticalSpace,
                    Text('0 ر.س', style: AppTextStyles.font18SemiBold.copyWith(color: AppColors.contractorTeal,
                        fontSize: 12)),
                  ],
                ),
              ),
              12.horizontalSpace,
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('item_price'.tr(), style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorGreyText,
                         fontSize: 10)),
                     4.verticalSpace,
                    _buildBox('0'),
                  ],
                ),
              ),
              12.horizontalSpace,
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('item_quantity'.tr(), style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorGreyText,
                         fontSize: 10)),
                     4.verticalSpace,
                    _buildBox('1'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBox(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.contractorLightGrey),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorDarkText),
      ),
    );
  }
}
