import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/shared/widgets/ticker_text.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';

class QuickLinksWidget extends StatelessWidget {
  const QuickLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text('quick_links'.tr(), style: AppTextStyles.font16SemiBold),
          10.verticalSpace,
          Column(
            children: [
              _buildLinkItem(context,'performance_comparison'.tr(), Icons.bar_chart, Colors.deepOrange.shade100, Colors.deepOrange),
              10.verticalSpace,
              _buildLinkItem(context,'new_invoice'.tr(), Icons.receipt_long, Colors.green.shade100, Theme.of(context).primaryColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLinkItem(BuildContext context,String label, IconData icon, Color bgColor, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.contractorSurface,
        borderRadius: BorderRadius.circular(AppSizes.s12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
         children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
              color: bgColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(AppSizes.s8),
            ),
            child: Icon(icon, color: iconColor),
          ),
          10.horizontalSpace,
          Container(
            constraints: BoxConstraints(
              maxWidth: context.width * 0.6,
            ),
            child: TickerText(
              child: Text(
                 label,
                style: AppTextStyles.font14Regular.copyWith(fontWeight: FontWeight.bold, color: AppColors.contractorDarkText),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
