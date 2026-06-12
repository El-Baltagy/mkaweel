import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/context.dart';

class StatsCardsWidget extends StatelessWidget {
  const StatsCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        children: [
          Expanded(
            child: _buildCard(
              context,
              icon: Icons.show_chart, // Or a custom heartbeat icon
              iconColor: Theme.of(context).primaryColor,
              value: '0%',
              label: 'spending_rate'.tr(),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: _buildCard(
              context,
              icon: Icons.attach_money,
              iconColor: AppColors.contractorGreen,
              value: '+٠ ر.س',
              label: 'expected_profit'.tr(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context,{required IconData icon, required Color iconColor, required String value, required String label}) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.s12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor),
          10.verticalSpace,
          Text(value, style: AppTextStyles.font18SemiBold),
          Text(label, style: AppTextStyles.font12Regular),
        ],
      ),
    );
  }
}
