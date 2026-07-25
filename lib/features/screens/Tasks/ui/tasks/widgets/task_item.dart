part of '../tasks_screen.dart';

class _TaskListItem extends StatelessWidget {
  const _TaskListItem({
    required this.taskItem,
    required this.tasksCubit,
    required this.parameter,
  });

  final TaskItem taskItem;
  final TasksCubit tasksCubit;
  final BaseTasksData parameter;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p8,
      ),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.s12),
        border: Border.all(color: AppColors.lightBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Top bar: status badge + actions ──────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppPadding.p16, AppPadding.p12, AppPadding.p12, 0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p10,
                    vertical: AppPadding.p4,
                  ),
                  decoration: BoxDecoration(
                    color: _statusColor(taskItem.status),
                    borderRadius: BorderRadius.circular(AppSizes.s20),
                  ),
                  child: Text(
                    taskItem.status.toLowerCase().tr(),
                    style: AppTextStyles.font12Regular.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  child: const Icon(Icons.edit_outlined,
                      color: AppColors.primaryLightColor, size: AppSizes.s20),
                  onTap: () async {
                    final result = await context.push(AddEditTasksRoute(args: AddEditTasksRouteArgs(
                        taskItem ,
                        tasksCubit, parameter
                    )));
                    if (result == true) {
                      await tasksCubit.getTasksFunc(
                        parameter: parameter
                      );
                    }
                  },
                ),
                10.horizontalSpace,
                BlocSelector<TasksCubit, TasksState, BaseEmit?>(
                  selector: (state) =>
                      state is TasksLoaded ? state.deleteTaskState : null,
                  builder: (context, deleteState) {
                    final isThisDeleting = deleteState is Loading<String> &&
                        deleteState.item == taskItem.id.toString();
                    return GestureDetector(
                      onTap: isThisDeleting
                          ? null
                          : DeletePjDialouge(
                              title: 'delete_task'.tr(),
                              subTitle:
                                  'are_you_sure_you_want_to_delete_this_task'
                                      .tr(),
                              onPressedDelete: () => tasksCubit.deleteTaskFunc(
                                DeleteProjectParameter(taskItem.id.toString()),
                              ),
                            ).toShowDialouge,
                      child: isThisDeleting
                          ? const SizedBox(
                              width: AppSizes.s20,
                              height: AppSizes.s20,
                              child: CircularProgressIndicator.adaptive(
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(
                              Icons.delete_outline,
                              color: AppColors.secondryLightColor,
                              size: AppSizes.s20,
                            ),
                    );
                  },
                ),
              ],
            ),
          ),

          // ── Task name & description ───────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16, vertical: AppPadding.p4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskItem.name,
                  style: AppTextStyles.font16SemiBold
                      .copyWith(color: AppColors.lightTextPrimary),
                ),
                if (taskItem.description.isNotEmpty) ...[
                  4.verticalSpace,
                  Text(
                    taskItem.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font12Regular
                        .copyWith(color: AppColors.lightTextSecondary),
                  ),
                ],
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Divider(height: AppPadding.p20),
          ),

          // ── Footer: project / due-date / worker ───────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppPadding.p16, 0, AppPadding.p16, AppPadding.p12),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _InfoChip(
                        icon: Icons.business_outlined,
                        label: 'project'.tr(),
                        value: taskItem.project.name,
                      ),
                    ),
                    Expanded(
                      child: _InfoChip(
                        icon: Icons.calendar_today_outlined,
                        label: 'due_date'.tr(),
                        value: taskItem.due_date,
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                _WorkerChip(worker: taskItem.worker),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Color _statusColor(String status) {
    final value = status.toLowerCase();

    if (value.contains('comp')) {
      return AppColors.green;
    }

    if (value.contains('progress') || value.contains('processing')|| value.contains('pend')) {
      return AppColors.primaryLightColor;
    }

    return AppColors.gold;
  }

}