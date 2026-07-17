import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/dob_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/drop_down_select.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/text_input_widget.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

class TaskForm extends StatelessWidget {
  const TaskForm({
    super.key,
    required this.nameController,
    required this.projectController,
    required this.phaseController,
    required this.workerController,
    required this.dueDateController,
    required this.statusController,
    required this.descriptionController,
  });

  final TextEditingController nameController;
  final TextEditingController projectController;
  final TextEditingController phaseController;
  final TextEditingController workerController;
  final TextEditingController dueDateController;
  final TextEditingController statusController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p20),
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(AppSizes.s8),
        border: Border.all(color: AppColors.lightBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            'task_information'.tr(),
            style: AppTextStyles.font16SemiBold.copyWith(
              color: AppColors.lightTextPrimary,
            ),
          ),
          AppPadding.p16.verticalSpace,

          // Task Name
          _buildLabel('task_name'.tr(), isRequired: true),
          AppPadding.p8.verticalSpace,
          TextInputWidget(
            data: NameInputData(
              controller: nameController,
              labelText: 'e_g_concrete_pouring'.tr(),
              icon: Icons.title, // or any appropriate icon, or null if the widget allows it to be overridden nicely
            ),
          ),
          AppPadding.p16.verticalSpace,

          // Project
          _buildLabel('project'.tr(), isRequired: true),
          AppPadding.p8.verticalSpace,
          TextInputWidget(
            data: DropDownSingleSelectData(
              controller: projectController,
              labelText: 'select_project'.tr(),
            ),
          ),
          AppPadding.p16.verticalSpace,

          // Construction Phase
          _buildLabel('construction_phase'.tr()),
          AppPadding.p8.verticalSpace,
          TextInputWidget(
            data: DropDownSingleSelectData(
              controller: phaseController,
              labelText: 'select_phase'.tr(),
            ),
          ),
          AppPadding.p16.verticalSpace,

          // Assign Worker
          _buildLabel('assign_worker'.tr()),
          AppPadding.p8.verticalSpace,
          TextInputWidget(
            data: DropDownSingleSelectData(
              controller: workerController,
              labelText: 'unassigned'.tr(),
            ),
          ),
          AppPadding.p16.verticalSpace,

          // Due Date
          _buildLabel('due_date'.tr()),
          AppPadding.p8.verticalSpace,
          TextInputWidget(
            data: DOPInputData(
              controller: dueDateController,
              labelText: 'mm/dd/yyyy',
            ),
          ),
          AppPadding.p16.verticalSpace,

          // Status
          _buildLabel('status'.tr(), isRequired: true),
          AppPadding.p8.verticalSpace,
          TextInputWidget(
            data: DropDownSingleSelectData(
              controller: statusController,
              labelText: 'status'.tr(),
            ),
          ),
          AppPadding.p16.verticalSpace,

          // Task Description
          _buildLabel('task_description'.tr()),
          AppPadding.p8.verticalSpace,
          TextInputWidget(
            data: NameInputData(
              controller: descriptionController,
              labelText: 'detail_the_steps'.tr(),
              icon: Icons.description,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text, {bool isRequired = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: AppTextStyles.font14Regular.copyWith(
            color: AppColors.lightTextPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (isRequired)
          Text(
            ' *',
            style: AppTextStyles.font14Regular.copyWith(
              color: AppColors.secondryLightColor,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
