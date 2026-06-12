import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/extension/context.dart';

class PerformanceMetricsWidget extends StatelessWidget {
  const PerformanceMetricsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                title: 'average_profit_margin'.tr(),
                value: '100.0%',
                valueColor: AppColors.contractorGreen,
              ),
            ),
            16.horizontalSpace,
             Expanded(
              child: _buildMetricCard(
                title: 'total_projects'.tr(),
                value: '1',
                valueColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        16.verticalSpace,
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                title: 'total_profits'.tr(),
                value: '٨٠,٠٠٠',
                valueColor: context.theme.colorScheme.secondary,
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: _buildMetricCard(
                title: 'total_contract_value'.tr(),
                value: '٨٠,٠٠٠',
                valueColor: AppColors.contractorDarkText,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricCard({required String title, required String value, required Color valueColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
            value,
            style: AppTextStyles.font24Bold.copyWith(color: valueColor),
          ),
          8.verticalSpace,
          Text(
            title,
            style: AppTextStyles.font12Regular.copyWith(color: AppColors.contractorGreyText),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
