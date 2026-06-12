import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';

class PriceItemWidget extends StatelessWidget {

  const PriceItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.price,
    required this.date,
  });
  final String title;
  final String subtitle;
  final String category;
  final String price;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppPadding.p12),
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.s8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(price, style: AppTextStyles.font18SemiBold.copyWith(color: AppColors.contractorTeal)),
              5.verticalSpace,
              Text(date, style: AppTextStyles.font12Regular),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('Syria', style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText)),
                  5.horizontalSpace,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p2),
                    decoration: BoxDecoration(
                      color: AppColors.contractorTeal.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSizes.s4),
                    ),
                    child: Text(category, style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorTeal, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              5.verticalSpace,
              Text(title, style: AppTextStyles.font16SemiBold),
              Text(subtitle, style: AppTextStyles.font12Regular),
            ],
          ),
        ],
      ),
    );
  }
}
