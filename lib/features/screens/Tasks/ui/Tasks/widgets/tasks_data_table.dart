import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/Tasks/ui/Tasks/widgets/task_table_row.dart';

class TasksDataTable extends StatelessWidget {
  const TasksDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Table Header
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p16,
            horizontal: AppPadding.p20,
          ),
          color: AppColors.lightSurface,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  '#',
                  style: AppTextStyles.font14Regular.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'task_name'.tr(),
                  style: AppTextStyles.font14Regular.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'project'.tr(),
                  style: AppTextStyles.font14Regular.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'assigned_worker'.tr(),
                  style: AppTextStyles.font14Regular.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'due_date'.tr(),
                  style: AppTextStyles.font14Regular.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'status'.tr(),
                  style: AppTextStyles.font14Regular.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'actions'.tr(),
                  style: AppTextStyles.font14Regular.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        // Example Table Data
        // TODO: Replace with ListView.builder using Cubit data
        TaskTableRow(
          index: '1',
          taskName: 'حفر الأساسات',
          taskSubtitle: 'حفر الأساسات للمبنى الأول',
          projectName: 'مشروع بناء مجمع سكني',
          assignedWorkerName: 'أحمد خالد',
          assignedWorkerAvatarUrl: 'https://via.placeholder.com/150',
          dueDate: '2026-07-01',
          status: 'Completed', // This should be localized
          isCompleted: true,
          onEdit: () {},
          onDelete: () {},
        ),
      ],
    );
  }
}
