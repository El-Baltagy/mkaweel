part of '../tasks_screen.dart';

class _EmptyTasksWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p40),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_box_outlined,
            size: AppSizes.s48,
            color: AppColors.contractorGreyText.withOpacity(0.5),
          ),
          10.verticalSpace,
          Text(
            'no_tasks_scheduled'.tr(),
            style: AppTextStyles.font14Regular,
          ),
        ],
      ),
    );
  }
}