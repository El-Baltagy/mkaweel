import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';

import 'package:mkaweel/core/app/route.dart';

class QuickToolsWidget extends StatelessWidget {
  const QuickToolsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('quick_tools'.tr(), style: AppTextStyles.font16SemiBold),
          10.verticalSpace,
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.1,
            children: [
              _buildToolItem(
                context,
                'gantt_chart'.tr(),
                Icons.format_list_bulleted,
                Colors.indigo.shade100,
                Colors.indigo,
                onTap: () => context.router.push(const GanttChartRoute()),
              ),
              _buildToolItem(
                context,
                'waste_calculator'.tr(),
                Icons.calculate_outlined,
                Colors.orange.shade100,
                Colors.orange,
                onTap: () => context.router.push(const WasteCalculatorRoute()),
              ),
              _buildToolItem(context, 'weather'.tr(), Icons.cloud_outlined, Colors.blue.shade100, Colors.blue),
              _buildToolItem(context, 'attendance_registration'.tr(), Icons.how_to_reg, Colors.teal.shade100, Colors.teal),
              _buildToolItem(context, 'suppliers'.tr(), Icons.inventory_2_outlined, Colors.green.shade100, Colors.green),
              _buildToolItem(context, 'templates'.tr(), Icons.note_add_outlined, Colors.purple.shade100, Colors.purple),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToolItem(
    BuildContext context,
    String label,
    IconData icon,
    Color bgColor,
    Color iconColor, {
    VoidCallback? onTap,
  }) {
    return Container(
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
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                color: bgColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(AppSizes.s8),
              ),
              child: Icon(icon, color: iconColor),
            ),
            10.verticalSpace,
            Text(
              label,
              style: AppTextStyles.font12Regular.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.contractorDarkText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
