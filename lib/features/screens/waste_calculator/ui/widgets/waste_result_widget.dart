import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/extension/context.dart';

class WasteResultWidget extends StatelessWidget {

  const WasteResultWidget({
    super.key,
    required this.floorArea,
    required this.materialIndex,
  });
  final double floorArea;
  final int materialIndex;

  double _getWastePercentage(int index) {
    switch (index) {
      case 0: return 10.0; // Tiles
      case 1: return 5.0;  // Cement
      case 2: return 8.0;  // Paints
      case 3: return 3.0;  // Rebar
      case 4: return 8.0;  // Sand
      case 5: return 7.0;  // Bricks
      case 6: return 12.0; // Curbs
      case 7: return 15.0; // Wood
      default: return 0.0;
    }
  }

  String _getMaterialName(int index) {
    switch (index) {
      case 0: return 'tiles_ceramics'.tr();
      case 1: return 'cement_concrete'.tr();
      case 2: return 'paints'.tr();
      case 3: return 'rebar'.tr();
      case 4: return 'sand_material'.tr();
      case 5: return 'bricks_blocks'.tr();
      case 6: return 'curbs_cladding'.tr();
      case 7: return 'wood_carpentry'.tr();
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _getWastePercentage(materialIndex);
    final materialName = _getMaterialName(materialIndex);
    final wasteAmount = floorArea * (percentage / 100);
    final totalAmount = floorArea + wasteAmount;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).primaryColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${'calculation_result_tiles'.tr().split('-')[0]} - $materialName',
            style: AppTextStyles.font18SemiBold.copyWith(color: Theme.of(context).primaryColor,
                fontSize: 14),
          ),
          16.verticalSpace,
          _buildResultRow('net_quantity'.tr(), floorArea, context.theme.scaffoldBackgroundColor, AppColors.contractorDarkText),
          12.verticalSpace,
          _buildResultRow(
            'waste_ratio_10'.tr().replaceAll('10', percentage.toInt().toString()),
            wasteAmount,
            AppColors.gold.withOpacity(0.1),
            AppColors.gold,
            isAddition: true,
          ),
          12.verticalSpace,
          _buildResultRow('total_order'.tr(), totalAmount, AppColors.contractorGreen.withOpacity(0.1), AppColors.contractorGreen, isBold: true),
          16.verticalSpace,
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.contractorLightGrey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'order_hint_tiles'.tr().replaceAll('55', totalAmount.toStringAsFixed(0)),
              style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultRow(String title, double value, Color bgColor, Color textColor, {bool isAddition = false, bool isBold = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${isAddition ? '+ ' : ''}${value.toStringAsFixed(1)} م²',
            style: isBold ? AppTextStyles.font16SemiBold.copyWith(color: textColor) :
            AppTextStyles.font18SemiBold.copyWith(color: textColor,
                fontSize: 14),
          ),
          Text(
            title,
            style: isBold ? AppTextStyles.font18SemiBold.copyWith(color: textColor,
                fontSize: 14) : AppTextStyles.font14Regular.copyWith(color: AppColors.contractorGreyText),
          ),
        ],
      ),
    );
  }
}
