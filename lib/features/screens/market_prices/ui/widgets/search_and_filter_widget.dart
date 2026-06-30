import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/shared/methods/list_view_row.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/catogeries_res/catogeries_res.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RowCatogeries extends StatelessWidget {
  const RowCatogeries({super.key, required this.emit, required this.selectedCat});
  final BaseEmit? emit;
  final ValueNotifier<int?>selectedCat;

  @override
  Widget build(BuildContext context) {
    bool isLoading= emit is !Success<CatogeriesRes>;
    final List<CatogeryItem> catsInCaseSuccess=( isLoading?null: (emit as Success<CatogeriesRes>).data?.data )?? [];

    final List<CatogeryItem> catsList =isLoading?List.generate(4, (index) =>CatogeryItem.toGetEmptyForLoading() ):
    [
      if(catsInCaseSuccess.isNotEmpty)
        CatogeryItem.toGetEmptyForLoading().copyWith(name: 'all'.tr(),id: -1),
      ...catsInCaseSuccess
    ];
    return Skeletonizer(
      enabled:isLoading,
      child:ValueListenableBuilder(valueListenable: selectedCat, builder: (context, value, child) {
        return  CreateListViewFromRow(
          lengthList: catsList.length, itemBuilder: (int p1)=>_buildFilterChip(context, catsList[p1] ,  value),
        );
      },)
    );
  }



  Widget _buildFilterChip(BuildContext context, CatogeryItem catogeryItem, int? selectedId) {
    bool   isSelected= catogeryItem.id==selectedId;
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p8),
      child: GestureDetector(
        onTap: () {
          if(selectedId!=catogeryItem.id){
            selectedCat.value=catogeryItem.id;
          }
        },
        child: Container(
           padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(AppSizes.s20),
          ),
          child: Text(
            catogeryItem.name,
            style: AppTextStyles.font14Regular.copyWith(
              color: isSelected ? context.theme.scaffoldBackgroundColor : context.theme.colorScheme.tertiaryFixed,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}