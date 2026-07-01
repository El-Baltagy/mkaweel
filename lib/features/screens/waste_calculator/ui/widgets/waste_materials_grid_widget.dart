
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_catogeries_data/sub_catogeries_data.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WasteMaterialsGridWidget extends StatelessWidget {

  const WasteMaterialsGridWidget({
    super.key,
     required this.selectedSubCatNotifier,
    required this.emit,
    required this.onShowMore,
  });
   final ValueNotifier<int> selectedSubCatNotifier ;
  final BaseEmit? emit;
  final void Function(int?,int? )? onShowMore;

  @override
  Widget build(BuildContext context) {
    bool isLoading= emit is !Success<SubCatogeriesData>;
    final SubCatogeriesData? subCatogeriesInSuccess= isLoading?null:  ( emit as Success<SubCatogeriesData>).data;

    bool hasMorePagination=
        subCatogeriesInSuccess?.pagination==null?false:
        (subCatogeriesInSuccess?.pagination.current_page??0)<(subCatogeriesInSuccess?.pagination.last_page??0);
    final List<SubCatogeryItem> finalList =isLoading?List.generate(8, (index) =>SubCatogeryItem.toGetEmptyForLoading() ):

    [
      ...subCatogeriesInSuccess?.data??[],
      if(hasMorePagination)
        SubCatogeryItem.toGetEmptyForLoading().copyWith(name: 'show more' ,id: -1),
    ];
     return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'select_material'.tr(),
          style: AppTextStyles.font18SemiBold.copyWith(color: AppColors.contractorGreyText,
          fontSize: 14
          ),
        ),
        16.verticalSpace,
        Skeletonizer(
          enabled: isLoading,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: finalList.length,
            itemBuilder: (context, index) {


              return ValueListenableBuilder(valueListenable:selectedSubCatNotifier , builder: (context, value, child) {
                final isSelected = value == finalList[index].id;
                return GestureDetector(
                  onTap: (){
                    if(finalList[index].id==-1){
                      onShowMore?.call( subCatogeriesInSuccess?.pagination.current_page,subCatogeriesInSuccess?.pagination.last_page);
                    }else
                    if(!isSelected){
                      selectedSubCatNotifier.value = finalList[index].id;
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.1) : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? Theme.of(context).primaryColor : context.theme.canvasColor,
                        width: isSelected ? 1.5 : 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                finalList[index].name,
                                style: AppTextStyles.font18SemiBold.copyWith(
                                    color: isSelected ? Theme.of(context).primaryColor : context.theme.colorScheme.tertiaryFixed,
                                    fontSize: 14
                                ),
                                textAlign: TextAlign.right,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              4.verticalSpace,
                              Text(
                                finalList[index].origin_country,
                                style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorGreyText,
                                    fontSize: 10),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },);
            },
          ),
        ),
      ],
    );
  }
}
