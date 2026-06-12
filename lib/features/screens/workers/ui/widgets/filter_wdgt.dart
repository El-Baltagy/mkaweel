import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/context.dart';

class WorkersFilterWidget extends StatelessWidget {
  const WorkersFilterWidget({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    final filters = ['all_workers', 'active', 'inactive'];
    final labels = ['all_workers'.tr(), 'active'.tr(), 'inactive'.tr()];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(filters.length, (i) {
          final isSelected = selectedFilter == filters[i];
          return Padding(
            padding: const EdgeInsets.only(left: AppPadding.p8),
            child: GestureDetector(
              onTap: () => onFilterChanged(filters[i]),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
                decoration: BoxDecoration(
                  color: isSelected ? Theme.of(context).primaryColor : context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(AppSizes.s20),
                  border: Border.all(color: isSelected ? Theme.of(context).primaryColor : context.theme.canvasColor),
                ),
                child: Text(
                  labels[i],
                  style: AppTextStyles.font14Regular.copyWith(
                    color: isSelected ? context.theme.scaffoldBackgroundColor : AppColors.contractorGreyText,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}