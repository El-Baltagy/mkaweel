import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/waste_calculator/data/model/waste_calc_res/waste_calc_res.dart';

class WasteResultWidget extends StatelessWidget {

  const WasteResultWidget({
    super.key,
    required this.emit,
    required this.onCalculate,
  });

  final BaseEmit? emit;
  final VoidCallback onCalculate;


  @override
  Widget build(BuildContext context) {
    bool isLoading= emit is Loading;
    final List<WasteCalcItem>  responseInCaseSuccess=(emit is !Success<WasteCalcRes>?null:(emit as Success<WasteCalcRes>).data?.data)??[];

    return Column(
      children: [

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed:isLoading?null:onCalculate,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: isLoading?CircularProgressIndicator(
              color: context.theme.scaffoldBackgroundColor,
            ) : Text(
              'calculate_quantities'.tr(),
              style: AppTextStyles.font16SemiBold.copyWith(color: Colors.white),
            ),

        )),
        16.verticalSpace,

        responseInCaseSuccess.isEmpty?
        const SizedBox.shrink():
        Container(
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
              // Text(
              //   '${'calculation_result_tiles'.tr().split('-')[0]} - $materialName',
              //   style: AppTextStyles.font18SemiBold.copyWith(color: Theme.of(context).primaryColor,
              //       fontSize: 14),
              // ),
              // 16.verticalSpace,
              ...responseInCaseSuccess.map((e) => _buildResultRow(
    e,
                // e.waste_percentage.toString(),
                //  e.waste_quantity,
                AppColors.gold.withOpacity(0.1),
                AppColors.gold,
               )),


            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResultRow(WasteCalcItem e, Color bgColor, Color textColor ) {
    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
         children: [

          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                   '${e.material_name}',
                  style:   AppTextStyles.font16SemiBold.copyWith(color: textColor)

              ),
              10.verticalSpace,
              Text(
                  "waste_quantity".tr() +" : "+'${e.waste_quantity}',
                  style:   AppTextStyles.font16SemiBold.copyWith(color: textColor)

              ),
              Text(
                "waste_percentage".tr()+" : "+ '${e.waste_percentage} %',
                 style:   AppTextStyles.font14Regular.copyWith(color: AppColors.contractorGreyText),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
