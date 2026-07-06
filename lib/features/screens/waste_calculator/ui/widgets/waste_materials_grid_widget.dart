import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/methods/auto_height_grid_view.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_catogeries_data/sub_catogeries_data.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WasteMaterialsGridWidget extends StatefulWidget {
  const WasteMaterialsGridWidget({
    super.key,
    required this.selectedSubCatNotifier,
    required this.emit,
    required this.onShowMore,
  });

  final ValueNotifier<SubCatogeryItem?> selectedSubCatNotifier;
  final BaseEmit? emit;
  final void Function(PaginationInfo<SubCatogeriesData>)? onShowMore;

  @override
  State<WasteMaterialsGridWidget> createState() =>
      _WasteMaterialsGridWidgetState();
}

class _WasteMaterialsGridWidgetState extends State<WasteMaterialsGridWidget> {
  SubCatogeriesData? _cachedData;

  @override
  Widget build(BuildContext context) {
    // 1. Cache the data whenever we get a Success state!
    if (widget.emit is Success<SubCatogeriesData>) {
      _cachedData = (widget.emit as Success<SubCatogeriesData>).data;
    }

    final bool isCurrentlyLoading = widget.emit is! Success<SubCatogeriesData>;

    final bool hasMorePagination = _cachedData?.pagination == null
        ? false
        : (_cachedData?.pagination?.current_page ?? 0) <
              (_cachedData?.pagination?.last_page ?? 0);

    // 2. Use _cachedData instead of reading directly from state
    final List<SubCatogeryItem> finalList = [
      ...?_cachedData?.data,
      if(isCurrentlyLoading)
      ...List.generate(8, (index) => SubCatogeryItem.toGetEmptyForLoading()),
      if (hasMorePagination)
        SubCatogeryItem.toGetEmptyForLoading().copyWith(
          name: 'show_more'.tr(),
          id: -1,
        ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'select_material'.tr(),
          style: AppTextStyles.font18SemiBold.copyWith(
            color: AppColors.contractorGreyText,
            fontSize: 14,
          ),
        ),
        16.verticalSpace,
        AutoHeightGridView(
          mainAxisSpacing: 12,
          enableScrool: false,
          itemCount: finalList.length,
          builder: (context, index) {
            return ValueListenableBuilder(
              valueListenable: widget.selectedSubCatNotifier,
              builder: (context, value, child) {
                final isSelected = value?.id == finalList[index].id;

                final bool isThisItemTheShowMoreBtn = finalList[index].id == -1;

                return Skeletonizer(
                  // enabled:true,
                  enabled: finalList[index].id<0&&isCurrentlyLoading,
                  child: GestureDetector(
                    onTap: () {
                      if (isThisItemTheShowMoreBtn) {
                        // Don't trigger again if we are already loading!
                        if (!isCurrentlyLoading) {
                          widget.onShowMore?.call(
                            PaginationInfo<SubCatogeriesData>(
                              currentPage: _cachedData?.pagination?.current_page,
                              lastPage: _cachedData?.pagination?.last_page,
                              oldDataToCombine: _cachedData,
                            ),
                          );
                        }
                      } else if (!isSelected) {
                        widget.selectedSubCatNotifier.value =
                            finalList[index] ;
                      }
                    },
                    child: buildContainer(isSelected, context, finalList[index],isThisItemTheShowMoreBtn),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Container buildContainer(bool isSelected, BuildContext context, SubCatogeryItem item,bool isThisItemTheShowMoreBtn) {
    return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).primaryColor.withOpacity(0.1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : context.theme.canvasColor,
                        width: isSelected ? 1.5 : 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:  .start,
                             children:  [
                                Container(
                                  constraints: const BoxConstraints(),
                                  child: Text(
                                    item.name+(isThisItemTheShowMoreBtn?"":"\n\n"),
                                    style: AppTextStyles.font18SemiBold
                                        .copyWith(
                                          color: isSelected
                                              ? Theme.of(context).primaryColor
                                              : context
                                                    .theme
                                                    .colorScheme
                                                    .tertiaryFixed,
                                          fontSize: 14,
                                        ),
                                     maxLines: 2,
                                    overflow:  .ellipsis,
                                  ),
                                ),
                                if(!isThisItemTheShowMoreBtn)
                                ...[
                                  4.verticalSpace,
                                  Text(
                                   '${item.waste_percentage!} ${item.unit}' ,
                                    style: AppTextStyles.font14Regular.copyWith(
                                      color: AppColors.contractorGreyText,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ]
                              ],

                          ),
                        ),
                      ],
                    ),
                  );
  }
}
