import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
import 'package:mkaweel/features/screens/Tasks/ui/add_edit_tasks/widgets/action_buttons.dart';
import 'package:mkaweel/features/screens/Tasks/ui/add_edit_tasks/widgets/task_form.dart';

part 'add_edit_tasks_mixin.dart';

@RoutePage()
class AddEditTasksPage extends StatefulWidget implements AutoRouteWrapper {
  const AddEditTasksPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TasksCubit>(
      create: (context) => TasksCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<AddEditTasksPage> createState() => _AddEditTasksPageState();
}

class _AddEditTasksPageState extends AddEditTasksBaseState {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'create_task_title'.tr(),
      child: BlocListener<TasksCubit, TasksState>(
        listener: (context, state) {
          // Handle states here (loading, success, error)
        },
        child: Scaffold(
          backgroundColor: AppColors.lightSurface,
          appBar: CustomAppBar(
            title: 'create_task_title'.tr(),
           ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Page Header
                      Text(
                        'create_task_title'.tr(),
                        style: AppTextStyles.font18SemiBold.copyWith(
                          color: AppColors.lightTextPrimary,
                        ),
                      ),
                      AppPadding.p16.verticalSpace,

                      // Form Container
                      TaskForm(
                        nameController: nameController,
                        projectController: projectController,
                        phaseController: phaseController,
                        workerController: workerController,
                        dueDateController: dueDateController,
                        statusController: statusController,
                        descriptionController: descriptionController,
                      ),
                    ],
                  ),
                ),
              ),
              
              // Bottom Action Buttons
              ActionButtons(
                onCancel: () {
                  context.router.maybePop();
                },
                onCreateTask: () {
                  // TODO: Dispatch cubit action to create task
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
