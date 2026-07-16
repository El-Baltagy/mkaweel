import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/date_helper.dart';
import 'package:mkaweel/core/storage/hive_storage.dart';
import 'package:mkaweel/core/storage/storage_helper.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/statistics_res/statistics_res.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({super.key, required this.state});
  final BaseEmit? state;
  @override
  Widget build(BuildContext context) {
    bool isLoading= state is !Success<StatisticsRes>;
    StatisticData    statistics =isLoading?StatisticData.empty:(state as Success<StatisticsRes>).data!.data;

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
            "${'hello'.tr()} ${StorageHelper.userData.name}",
            style: AppTextStyles.font24Bold.copyWith(color: context.theme.scaffoldBackgroundColor),
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:List.generate(list(statistics).length, (index) => Row(
              spacing: 10,
              children: [
                if(index!=0)
                _buildDivider(context),
                 Column(
                  children: [
                    Skeletonizer(
                      enabled: isLoading,
                      child: Text(
                        list(statistics)[index].$1,
                        style: AppTextStyles.font24Bold.copyWith(color: context.theme.scaffoldBackgroundColor),
                      ),
                    ),
                    Text(
                      list(statistics)[index].$2,
                      style: AppTextStyles.font14Regular.copyWith(color: context.theme.scaffoldBackgroundColor.withOpacity(0.8)),
                    ),

                  ],
                                 ),
              ],
            ))
          ),
        ],
      ),
    );
  }

  List<(String, String)> list(StatisticData statistics) {
    return [
            (statistics.total_projects.toString(),'total_projects'.tr()),
            (statistics.completed_projects.toString(),'completed_projects'.tr()),
            (statistics.total_tasks.toString(),'total_tasks'.tr()),
           ];
  }


  Widget _buildDivider(BuildContext context,) {
    return Container(
      height: AppSizes.s40,
      width: AppSizes.s1,
      color: context.theme.scaffoldBackgroundColor.withOpacity(0.3),
    );
  }
}
