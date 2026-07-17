part of '../tasks_screen.dart';

class WorkerItemWidget extends StatelessWidget {
  const WorkerItemWidget({
    super.key, required this.worker,
  });
  final Worker worker;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: AppSizes.s10,
          backgroundImage: NetworkImage(worker.avatar),
          onBackgroundImageError: (_, __) {},
          child: const Icon(
            Icons.person,
            size: AppSizes.s10,
          ),
        ),
        AppPadding.p8.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'assigned_worker'.tr(),
              style: AppTextStyles.font12Regular.copyWith(
                color: AppColors.lightTextSecondary,
              ),
            ),
            AppPadding.p4.verticalSpace,
            Text(
              worker.name,
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.lightTextPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}