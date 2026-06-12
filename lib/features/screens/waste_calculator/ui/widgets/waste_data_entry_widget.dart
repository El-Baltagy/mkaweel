import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/extension/context.dart';

class WasteDataEntryWidget extends StatelessWidget {

  const WasteDataEntryWidget({
    super.key,
    required this.floorArea,
    required this.onAreaChanged,
    required this.onCalculate,
  });
  final double floorArea;
  final ValueChanged<double> onAreaChanged;
  final VoidCallback onCalculate;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: floorArea == 0 ? '' : floorArea.toString());
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
            'data_entry'.tr(),
            style: AppTextStyles.font16SemiBold.copyWith(color: context.theme.colorScheme.tertiaryFixed),
          ),
          16.verticalSpace,
          Text(
            'floor_area_m2'.tr(),
            style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText),
          ),
          8.verticalSpace,
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: context.theme.canvasColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        onAreaChanged(floorArea + 1);
                      },
                      child: const Icon(Icons.arrow_drop_up, color: AppColors.contractorGreyText),
                    ),
                    InkWell(
                      onTap: () {
                        if (floorArea > 0) onAreaChanged(floorArea - 1);
                      },
                      child: const Icon(Icons.arrow_drop_down, color: AppColors.contractorGreyText),
                    ),
                  ],
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      final parsed = double.tryParse(val);
                      if (parsed != null) {
                        onAreaChanged(parsed);
                      }
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text('م²', style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorGreyText)),
                ),
              ],
            ),
          ),
          12.verticalSpace,
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.theme.canvasColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    'waste_reason_tiles'.tr(),
                    style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText),
                    textAlign: TextAlign.right,
                  ),
                ),
                8.horizontalSpace,
                Icon(Icons.info_outline, size: 16, color: Theme.of(context).primaryColor),
              ],
            ),
          ),
          24.verticalSpace,
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: floorArea > 0 ? onCalculate : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                'calculate_quantities'.tr(),
                style: AppTextStyles.font16SemiBold.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
