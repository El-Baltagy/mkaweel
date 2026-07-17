import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

class TaskCarddItem extends StatelessWidget {
  const TaskCarddItem({
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
                  color: isCompleted ? AppColors.green : AppColors.gold,
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                ),
                child: Text(
                  status,
                  style: AppTextStyles.font12Regular.copyWith(
                    color: AppColors.lightBackground,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onEdit,
                    child: const Icon(
                      Icons.edit,
                      color: AppColors.primaryLightColor,
                      size: AppSizes.s20,
                    ),
                  ),
                  AppPadding.p16.horizontalSpace,
                  GestureDetector(
                    onTap: onDelete,
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
            taskName,
            style: AppTextStyles.font16SemiBold.copyWith(
              color: AppColors.lightTextPrimary,
            ),
          ),
          AppPadding.p4.verticalSpace,
          Text(
            taskSubtitle,
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
                child: _buildDetailItem(
                  icon: Icons.business,
                  title: 'project'.tr(),
                  value: projectName,
                ),
              ),
              Expanded(
                child: _buildDetailItem(
                  icon: Icons.calendar_today,
                  title: 'due_date'.tr(),
                  value: dueDate,
                ),
              ),
            ],
          ),
          AppPadding.p12.verticalSpace,

          // Details row 2: Worker
          _buildWorkerItem(),
        ],
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: AppSizes.s16,
          color: AppColors.primaryLightColor,
        ),
        AppPadding.p8.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.font12Regular.copyWith(
                  color: AppColors.lightTextSecondary,
                ),
              ),
              AppPadding.p4.verticalSpace,
              Text(
                value,
                style: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWorkerItem() {
    return Row(
      children: [
        const Icon(
          Icons.person,
          size: AppSizes.s16,
          color: AppColors.primaryLightColor,
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
            Row(
              children: [
                CircleAvatar(
                  radius: AppSizes.s10,
                  backgroundImage: NetworkImage(assignedWorkerAvatarUrl),
                  onBackgroundImageError: (_, __) {},
                  child: const Icon(
                    Icons.person,
                    size: AppSizes.s10,
                  ),
                ),
                AppPadding.p8.horizontalSpace,
                Text(
                  assignedWorkerName,
                  style: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.lightTextPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
