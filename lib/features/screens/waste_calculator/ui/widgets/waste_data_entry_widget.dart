import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/extension/context.dart';

class WasteDataEntryWidget extends StatelessWidget {

  const WasteDataEntryWidget({
    super.key,
     required this.onCalculate,
    required this.controller,
  });
   // final ValueChanged<double> onAreaChanged;
  final VoidCallback onCalculate;
  final TextEditingController controller  ;

  @override
  Widget build(BuildContext context) {
    // final controller = TextEditingController(text: floorArea == 0 ? '' : floorArea.toString());
    
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'data_entry'.tr(),
            style: AppTextStyles.font16SemiBold.copyWith(color: context.theme.colorScheme.tertiaryFixed),
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
                        controller.text=(double.parse(controller.text.isEmpty?'0':controller.text) + 1).toString();
                      },
                      child: const Icon(Icons.arrow_drop_up, color: AppColors.contractorGreyText),
                    ),
                    InkWell(
                      onTap: () {
                        if (double.parse(controller.text.isEmpty?'0':controller.text) >  1) {
                          controller.text=(double.parse(controller.text) - 1).toString();
                        }


                      },
                      child: const Icon(Icons.arrow_drop_down, color: AppColors.contractorGreyText),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*$')),
                    ],
                    onChanged: (val) {
                        controller.text =val;
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

          24.verticalSpace,
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed:onCalculate,
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
