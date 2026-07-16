import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/date_helper.dart';
import 'package:mkaweel/core/storage/hive_storage.dart';
import 'package:mkaweel/core/storage/storage_helper.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/context.dart';

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
                DateTimeHelper.formatDateTimeFromString(DateTime.now().toString(),DateFormat('dd MMM , EEE ',HiveStorage().readData(AppConstant.langCode)??'en')),
                style: AppTextStyles.font14Regular.copyWith(color: context.theme.scaffoldBackgroundColor.withOpacity(0.8)),
              ),

            ],
          ),
          5.verticalSpace,
          Text(
            'hello'.tr()+" ${StorageHelper.userData.name}",
            style: AppTextStyles.font24Bold.copyWith(color: context.theme.scaffoldBackgroundColor),
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem(context,'0', 'active_project'.tr()),
              _buildDivider(context),
              _buildStatItem(context,'0', 'completed'.tr()),
              _buildDivider(context),
              _buildStatItem(context,'0', 'todays_tasks'.tr()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context,String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: AppTextStyles.font24Bold.copyWith(color: context.theme.scaffoldBackgroundColor),
        ),
        Text(
          label,
          style: AppTextStyles.font14Regular.copyWith(color: context.theme.scaffoldBackgroundColor.withOpacity(0.8)),
        ),
      ],
    );
  }

  Widget _buildDivider(BuildContext context,) {
    return Container(
      height: AppSizes.s40,
      width: AppSizes.s1,
      color: context.theme.scaffoldBackgroundColor.withOpacity(0.3),
    );
  }
}
