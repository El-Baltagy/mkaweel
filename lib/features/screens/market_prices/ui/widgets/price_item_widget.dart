import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/shared/methods/date_helper.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/catogeries_res/catogeries_res.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_catogeries_data/sub_catogeries_data.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubCatogeries extends StatelessWidget {

  const SubCatogeries({
    super.key,
    required this.emit
  });
  final BaseEmit? emit;

  @override
  Widget build(BuildContext context) {
    SubCatogeriesData? data;
    if (emit is Success<SubCatogeriesData>) {
      data = (emit! as Success<SubCatogeriesData>).data;
    } else if (emit is Loading<SubCatogeriesData>) data = (emit! as Loading<SubCatogeriesData>).item;

    bool isInitialLoading = data == null;

    final List<SubCatogeryItem> finalList = isInitialLoading 
        ? List.generate(4, (index) => SubCatogeryItem.toGetEmptyForLoading())
        : data.data;

     return Skeletonizer(
       enabled: isInitialLoading,
       child: Column(
        children: finalList
            .map(
              (item) => buildContainer(
                context,
                  item
          ),
        )
            .toList(),
           ),
     );
   }

  Container buildContainer(BuildContext context,SubCatogeryItem subCatogeryItem) {
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
            Text(DateTimeHelper.formatDateTimeFromString(

                subCatogeryItem.created_at ,
                DateFormat(DateTimeHelper.formatDateFullMonth)
            ), style: AppTextStyles.font12Regular),
          ],
        ),
        Column(
          crossAxisAlignment:  .end,
          children: [
            Row(
              children: [
                Text(subCatogeryItem.origin_country , style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText)),
                5.horizontalSpace,
                Container(

                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSizes.s4),
                  ),
                   child: Text(subCatogeryItem.category?.name.toString()??"testssssss",

                      overflow: .ellipsis,
                      style: AppTextStyles.font12Regular.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            5.verticalSpace,
            Container(
                constraints: BoxConstraints(
                    maxWidth: context.width*0.55
                ),
                 child: Text(subCatogeryItem.name,
                     textAlign: .end,
                     style: AppTextStyles.font16SemiBold)),
            Text(subCatogeryItem.unit.toString(), style: AppTextStyles.font12Regular),
          ],
        ),
      ],
    ),
  );
  }
}
