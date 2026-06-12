import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/context.dart';

class SearchAndFilterWidget extends StatelessWidget {
  const SearchAndFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'search_material_hint'.tr(),
            hintStyle: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorGreyText.withOpacity(0.6)),
            filled: true,
            fillColor: context.theme.scaffoldBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.s8),
              borderSide:   BorderSide(color: context.theme.canvasColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.s8),
              borderSide:   BorderSide(color: context.theme.canvasColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.s8),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p12),
          ),
        ),
        16.verticalSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterChip(context, 'all'.tr(), true),
              _buildFilterChip(context, 'cement'.tr(), false),
              _buildFilterChip(context, 'steel'.tr(), false),
              _buildFilterChip(context, 'aggregate'.tr(), false),
              _buildFilterChip(context, 'building'.tr(), false),
              _buildFilterChip(context, 'finishing'.tr(), false),
              _buildFilterChip(context, 'wood'.tr(), false),
              _buildFilterChip(context, 'sanitary'.tr(), false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(BuildContext context, String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(left: AppPadding.p8),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppSizes.s20),
      ),
      child: Text(
        label,
        style: AppTextStyles.font14Regular.copyWith(
          color: isSelected ? context.theme.scaffoldBackgroundColor : context.theme.colorScheme.tertiaryFixed,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
