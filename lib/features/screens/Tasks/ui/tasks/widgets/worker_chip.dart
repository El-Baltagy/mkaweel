part of '../tasks_screen.dart';

class _WorkerChip extends StatelessWidget {
  const _WorkerChip({required this.worker});

  final Worker worker;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: AppSizes.s16,
          backgroundColor: AppColors.primaryLightColor.withOpacity(0.1),
          backgroundImage: worker.avatar.isNotEmpty
              ? NetworkImage(worker.avatar)
              : null,
          child: worker.avatar.isEmpty
              ? const Icon(Icons.person,
              size: AppSizes.s16, color: AppColors.primaryLightColor)
              : null,
        ),
        8.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'assigned_worker'.tr(),
              style: AppTextStyles.font12Regular
                  .copyWith(color: AppColors.lightTextSecondary),
            ),
            2.verticalSpace,
            Text(
              worker.name,
              style: AppTextStyles.font12Regular.copyWith(
                color: AppColors.lightTextPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}