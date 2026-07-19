part of '../tasks_screen.dart';

class _EmptyTasksWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.task_outlined,
            size: AppSizes.s100,
            color: AppColors.contractorGreyText.withOpacity(0.5),
          ),
          20.verticalSpace,
          Text(
            'no_tasks'.tr(),
            style: AppTextStyles.font18SemiBold,
          ),
          10.verticalSpace,
          Text(
            'press_to_create_task'.tr(),
            style: AppTextStyles.font14Regular
                .copyWith(color: AppColors.contractorGreyText),
          ),
        ],
      ),
    );
  }
}