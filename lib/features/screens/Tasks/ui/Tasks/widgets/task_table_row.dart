import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

class TaskTableRow extends StatelessWidget {
  const TaskTableRow({
    super.key,
    required this.index,
    required this.taskName,
    required this.taskSubtitle,
    required this.projectName,
    required this.assignedWorkerName,
    required this.assignedWorkerAvatarUrl,
    required this.dueDate,
    required this.status,
    required this.onEdit,
    required this.onDelete,
    this.isCompleted = false,
  });

  final String index;
  final String taskName;
  final String taskSubtitle;
  final String projectName;
  final String assignedWorkerName;
  final String assignedWorkerAvatarUrl;
  final String dueDate;
  final String status;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p16,
        horizontal: AppPadding.p20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.lightBackground,
        border: Border(
          bottom: BorderSide(
            color: AppColors.lightBorder,
          ),
        ),
      ),
      child: Row(
        children: [
          // Index
          Expanded(
            flex: 1,
            child: Text(
              index,
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.primaryLightColor,
              ),
            ),
          ),
          
          // Task Name
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  taskName,
                  style: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.lightTextPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                AppPadding.p4.verticalSpace,
                Text(
                  taskSubtitle,
                  style: AppTextStyles.font12Regular.copyWith(
                    color: AppColors.lightTextSecondary,
                  ),
                ),
              ],
            ),
          ),
          
          // Project
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
                vertical: AppPadding.p6,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryLightColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.s12),
              ),
              child: Text(
                projectName,
                style: AppTextStyles.font12Regular.copyWith(
                  color: AppColors.primaryLightColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          
          // Assigned Worker
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CircleAvatar(
                  radius: AppSizes.s12,
                  backgroundImage: NetworkImage(assignedWorkerAvatarUrl),
                  onBackgroundImageError: (_, __) {},
                  child: const Icon(
                    Icons.person,
                    size: AppSizes.s12,
                  ),
                ),
                AppPadding.p8.horizontalSpace,
                Expanded(
                  child: Text(
                    assignedWorkerName,
                    style: AppTextStyles.font14Regular.copyWith(
                      color: AppColors.lightTextPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          
          // Due Date
          Expanded(
            flex: 2,
            child: Text(
              dueDate,
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.lightTextPrimary,
              ),
            ),
          ),
          
          // Status
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
                vertical: AppPadding.p4,
              ),
              decoration: BoxDecoration(
                color: isCompleted ? AppColors.green : AppColors.gold,
                borderRadius: BorderRadius.circular(AppSizes.s12),
              ),
              child: Text(
                status,
                style: AppTextStyles.font12Regular.copyWith(
                  color: AppColors.lightBackground,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          
          // Actions
          Expanded(
            flex: 2,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: AppColors.primaryLightColor,
                    size: AppSizes.s18,
                  ),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.secondryLightColor,
                    size: AppSizes.s18,
                  ),
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
