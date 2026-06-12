import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/extension/context.dart';

class PerformanceTabsWidget extends StatelessWidget {
  const PerformanceTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildTab(context: context, title: 'daily_cost_tab'.tr(), isActive: false),
        _buildTab(context: context, title: 'profitability_tab'.tr(), isActive: false),
        _buildTab(context: context, title: 'efficiency_tab'.tr(), isActive: true),
      ],
    );
  }

  Widget _buildTab({required BuildContext context, required String title, required bool isActive}) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : context.theme.canvasColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: AppTextStyles.font18SemiBold.copyWith(
          color: isActive ? Colors.white : AppColors.contractorGreyText,
            fontSize: 14
        ),
      ),
    );
  }
}
