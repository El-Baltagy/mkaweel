import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';

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
            fillColor: AppColors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.s8),
              borderSide: const BorderSide(color: AppColors.contractorLightGrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.s8),
              borderSide: const BorderSide(color: AppColors.contractorLightGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.s8),
              borderSide: const BorderSide(color: AppColors.contractorTeal),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p12),
          ),
        ),
        16.verticalSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterChip('all'.tr(), true),
              _buildFilterChip('cement'.tr(), false),
              _buildFilterChip('steel'.tr(), false),
              _buildFilterChip('aggregate'.tr(), false),
              _buildFilterChip('building'.tr(), false),
              _buildFilterChip('finishing'.tr(), false),
              _buildFilterChip('wood'.tr(), false),
              _buildFilterChip('sanitary'.tr(), false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(left: AppPadding.p8),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.contractorTeal : AppColors.contractorTeal.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppSizes.s20),
      ),
      child: Text(
        label,
        style: AppTextStyles.font14Regular.copyWith(
          color: isSelected ? AppColors.white : AppColors.contractorDarkText,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
