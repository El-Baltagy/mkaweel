import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/entrance_fader.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/tasks_res/tasks_res.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({
    super.key,
    required this.state,
    required this.tasksCubit,
  });

  final BaseEmit? state;
  final TasksCubit tasksCubit;

  @override
  Widget build(BuildContext context) {
    bool isLoading = state is! Success<TasksRes>;

    if (!isLoading) {
      final list = (state as Success<TasksRes>).data?.data ?? [];
      if (list.isEmpty) {
        return _EmptyTasksWidget();
      }
    }

    final List<TaskItem> listTasks = isLoading
        ? List.generate(4, (index) => TaskItem.getEmptyItem)
        : (state as Success<TasksRes>).data!.data;

    return EntranceFader(
      dx: context.isLTR ? -32 : 32,
      enableAnimation: !isLoading,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        itemCount: listTasks.length,
        itemBuilder: (context, index) {
          return Skeletonizer(
            enabled: isLoading,
            child: _TaskListItem(
              taskItem: listTasks[index],
              tasksCubit: tasksCubit,
            ),
          );
        },
      ),
    );
  }
}

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

class _TaskListItem extends StatelessWidget {
  const _TaskListItem({
    required this.taskItem,
    required this.tasksCubit,
  });

  final TaskItem taskItem;
  final TasksCubit tasksCubit;

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return AppColors.green;
      case 'in_progress':
      case 'processing':
        return AppColors.primaryLightColor;
      default:
        return AppColors.gold;
    }
  }

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
                    taskItem.status,
                    style: AppTextStyles.font12Regular.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit_outlined,
                      color: AppColors.primaryLightColor, size: AppSizes.s20),
                  onPressed: () {
                    // TODO: navigate to edit
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline,
                      color: AppColors.secondryLightColor, size: AppSizes.s20),
                  onPressed: () {
                    // TODO: delete task
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
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: AppSizes.s16, color: AppColors.primaryLightColor),
        8.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: AppTextStyles.font12Regular
                      .copyWith(color: AppColors.lightTextSecondary)),
              2.verticalSpace,
              Text(
                value,
                style: AppTextStyles.font12Regular.copyWith(
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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
