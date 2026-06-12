import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppSizes.s20),
          bottomRight: Radius.circular(AppSizes.s20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'sunday_may_31'.tr(),
                style: AppTextStyles.font14Regular.copyWith(color: AppColors.white.withOpacity(0.8)),
              ),
              const Icon(Icons.notifications_none, color: AppColors.white),
            ],
          ),
          5.verticalSpace,
          Text(
            'hello'.tr(),
            style: AppTextStyles.font24Bold.copyWith(color: AppColors.white),
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('0', 'active_project'.tr()),
              _buildDivider(),
              _buildStatItem('0', 'completed'.tr()),
              _buildDivider(),
              _buildStatItem('0', 'todays_tasks'.tr()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: AppTextStyles.font24Bold.copyWith(color: AppColors.white),
        ),
        Text(
          label,
          style: AppTextStyles.font14Regular.copyWith(color: AppColors.white.withOpacity(0.8)),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: AppSizes.s40,
      width: AppSizes.s1,
      color: AppColors.white.withOpacity(0.3),
    );
  }
}
