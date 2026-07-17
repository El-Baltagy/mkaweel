part of '../tasks_screen.dart';

class TaskCardItem extends StatelessWidget {
  const TaskCardItem({
    super.key, required this.taskItem, required this.isLoading,
  });

  final TaskItem  taskItem;
  final  bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled:isLoading ,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        margin: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.p8,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightBackground,
          borderRadius: BorderRadius.circular(AppSizes.s12),
          border: Border.all(color: AppColors.lightBorder),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Status and Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p12,
                    vertical: AppPadding.p4,
                  ),
                  decoration: BoxDecoration(
                    color: taskItem.status == 'Completed' ? AppColors.green : AppColors.gold,
                    borderRadius: BorderRadius.circular(AppSizes.s12),
                  ),
                  child: Text(
                    taskItem.status,
                    style: AppTextStyles.font12Regular.copyWith(
                      color: AppColors.lightBackground,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.push(AddEditTasksRoute(args: .new())),
                      child: const Icon(
                        Icons.edit,
                        color: AppColors.primaryLightColor,
                        size: AppSizes.s20,
                      ),
                    ),
                    AppPadding.p16.horizontalSpace,
                    GestureDetector(
                      onTap: DeletePjDialouge (onPressedDelete: () {

                      }, title: 'delete_task'.tr(), subTitle: 'do_you_want_to_delete_this_task'.tr()).toShowDialouge,
                      child: const Icon(
                        Icons.delete,
                        color: AppColors.secondryLightColor,
                        size: AppSizes.s20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AppPadding.p12.verticalSpace,

            // Task Name & Subtitle
            Text(
              taskItem.name,
              style: AppTextStyles.font16SemiBold.copyWith(
                color: AppColors.lightTextPrimary,
              ),
            ),
            AppPadding.p4.verticalSpace,
            Text(
              taskItem.description,
              style: AppTextStyles.font12Regular.copyWith(
                color: AppColors.lightTextSecondary,
              ),
            ),
            AppPadding.p12.verticalSpace,

            const Divider(color: AppColors.lightBorder, height: 1),
            AppPadding.p12.verticalSpace,

            // Details row 1: Project & Due Date
            Row(
              children: [
                Expanded(
                  child: DetailedItem(
                    icon: Icons.business,
                    title: 'project'.tr(),
                    value: taskItem.project.name,
                  ),
                ),

                Expanded(
                  child:DetailedItem (
                      icon: Icons.calendar_today,
                      title: 'due_date'.tr(),
                      value: taskItem.due_date

                  ),
                ),
              ],
            ),
            AppPadding.p12.verticalSpace,

             WorkerItemWidget(
                worker:   taskItem.worker
             ),
          ],
        ),
      ),
    );
  }

}