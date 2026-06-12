import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/extension/context.dart';

class MaterialItem {

  MaterialItem(this.title, this.wasteLabel, this.wastePercentage);
  final String title;
  final String wasteLabel;
  final double wastePercentage;
}

class WasteMaterialsGridWidget extends StatelessWidget {

  const WasteMaterialsGridWidget({
    super.key,
    required this.selectedIndex,
    required this.onMaterialSelected,
  });
  final int selectedIndex;
  final ValueChanged<int> onMaterialSelected;

  List<MaterialItem> _getMaterials() {
    return [
      MaterialItem('tiles_ceramics'.tr(), 'waste_10'.tr(), 10.0),
      MaterialItem('cement_concrete'.tr(), 'waste_5'.tr(), 5.0),
      MaterialItem('paints'.tr(), 'waste_8'.tr(), 8.0),
      MaterialItem('rebar'.tr(), 'waste_3'.tr(), 3.0),
      MaterialItem('sand_material'.tr(), 'waste_8'.tr(), 8.0),
      MaterialItem('bricks_blocks'.tr(), 'waste_7'.tr(), 7.0),
      MaterialItem('curbs_cladding'.tr(), 'waste_12'.tr(), 12.0),
      MaterialItem('wood_carpentry'.tr(), 'waste_15'.tr(), 15.0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final materials = _getMaterials();
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
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: materials.length,
          itemBuilder: (context, index) {
            final isSelected = selectedIndex == index;
            final material = materials[index];
            return GestureDetector(
              onTap: () => onMaterialSelected(index),
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
                            material.title,
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
                            material.wasteLabel,
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
          },
        ),
      ],
    );
  }
}
