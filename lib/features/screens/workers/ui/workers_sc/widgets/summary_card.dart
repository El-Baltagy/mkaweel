import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/context.dart';

class WorkersSummaryWidget extends StatelessWidget {
  const WorkersSummaryWidget({super.key, required this.activeCount, required this.inactiveCount});
  final int activeCount;
  final int inactiveCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Row(
        children: [
          Expanded(
            child: SummaryCard(
              count: inactiveCount,
              label: 'inactive'.tr(),
              countColor: context.theme.colorScheme.tertiaryFixed,
            ),
          ),
          const SizedBox(width: AppSizes.s12),
          Expanded(
            child: SummaryCard(
              count: activeCount,
              label: 'active_worker'.tr(),
              countColor: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}



class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key, required this.count, required this.label, required this.countColor});
  final int count;
  final String label;
  final Color countColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p20),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.s12),
        border: Border.all(color: context.theme.canvasColor),
      ),
      child: Column(
        children: [
          Text(
            '$count',
            style: AppTextStyles.font24Bold.copyWith(color: countColor, fontSize: 32),
          ),
          const SizedBox(height: AppSizes.s4),
          Text(label, style: AppTextStyles.font14Regular),
        ],
      ),
    );
  }
}