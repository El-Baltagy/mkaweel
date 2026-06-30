import 'package:flutter/material.dart';
import 'package:mkaweel/core/shared/methods/date_helper.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_catogeries_data/sub_catogeries_data.dart';

class PriceItemWidget extends StatelessWidget {

  const PriceItemWidget({
    super.key,
    required this.subCatogeryItem
  });
  // final String title;
  // final String subtitle;
  // final String category;
  // final String price;
  // final String date;
  final SubCatogeryItem subCatogeryItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppPadding.p12),
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
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
              Text(subCatogeryItem.unit_price.toString(), style: AppTextStyles.font18SemiBold.copyWith(color: Theme.of(context).primaryColor)),
              5.verticalSpace,
              Text(DateTimeHelper.formatDateAsStringIntoStringDayMonth(subCatogeryItem.created_at), style: AppTextStyles.font12Regular),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(subCatogeryItem.origin_country, style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText)),
                  5.horizontalSpace,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSizes.s4),
                    ),
                    child: Text(subCatogeryItem.category.name, style: AppTextStyles.font12Regular.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              5.verticalSpace,
              Text(subCatogeryItem.name, style: AppTextStyles.font16SemiBold),
              Text(subCatogeryItem.unit, style: AppTextStyles.font12Regular),
            ],
          ),
        ],
      ),
    );
  }
}
