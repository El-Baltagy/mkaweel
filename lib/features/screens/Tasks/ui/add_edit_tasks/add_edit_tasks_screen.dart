import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/dob_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_phases_res/project_phases_res.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/title_with_input.dart';
import 'package:mkaweel/features/screens/workers/controller/workers_cubit.dart';
import 'package:mkaweel/features/screens/workers/data/model/add_worker_data_request.dart';
import 'package:mkaweel/features/screens/workers/ui/add_workers/widgets/drop_down_role_selector.dart';

part 'add_edit_tasks_mixin.dart';

@RoutePage()
class AddEditTasksPage extends StatefulWidget implements AutoRouteWrapper {
  const AddEditTasksPage({super.key, required this.args});

  final AddEditTasksRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider.value(value:args.tasksCubit,
          child: this
      ),
      BlocProvider<WorkersCubit>(create: (context) => AppLocator()()()),
      BlocProvider<ProjectsCubit>(create: (context) => AppLocator()()()),

    ], child: this);

  }

  @override
  State<AddEditTasksPage> createState() => _AddEditTasksPageState();
}

class _AddEditTasksPageState extends AddEditTasksBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TasksCubit, TasksState>(
      listener: (context, state) {
        // Handle states here (loading, success, error)
      },
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: context.theme.primaryColor,
          title: Text(
            widget.args.taskItem == null ? 'create_task_title'.tr() : 'edit_task'.tr() ,
            style: AppTextStyles.font18SemiBold.copyWith(
              color: context.theme.scaffoldBackgroundColor,
            ),
          ),
          centerTitle: true,
          leading: const SizedBox.shrink(),
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: context.theme.scaffoldBackgroundColor,
              ),
              onPressed: () => context.pop(),
            ),
          ],
        ),
        body: Form(
          key: _key,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSizes.s20,
              children: [
                buildName(),

                buildProjectSelector(),

                // buildPhaseSelector(),
                //
                // buildWorkerSelector(),

                buildDOB(context),

                buildStatusSelector(),

                buildDescription(),
                30.verticalSpace,

                SizedBox(
                  width: double.infinity,
                  height: AppSizes.s48,
                  child: BlocBuilder<TasksCubit, TasksState>(
                    builder: (context, state) {
                      bool isLoading = false; // Add your loading condition here
                      return ElevatedButton(
                        onPressed: () => saveTask(isLoading),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.theme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.s8),
                          ),
                        ),
                        child: isLoading
                            ? CircularProgressIndicator(
                          color: context.theme.scaffoldBackgroundColor,
                        )
                            : Text(
                          'save'.tr(),
                          style: AppTextStyles.font16SemiBold.copyWith(
                            color: context.theme.scaffoldBackgroundColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  TitleWithInputField buildName() {
    return TitleWithInputField(
      'task_name'.tr(),
      NameInputData(
        isLabel: false,
        widgetPrefix: const SizedBox.shrink(),
        field: listFields[0],
        labelText: 'e_g_concrete_pouring'.tr(),
        controller: _nameController,
      ),
    );
  }

  Widget buildProjectSelector() {
    return ValueListenableBuilder(valueListenable: projectsList, builder: (context, value, child) {
      return BottomSheetSelector(
        field: listFields[1],
        isMultiSelect: false,
        title: 'project'.tr(),
        listChoices: value,
        selectedNotifier: selectedProjectNotifier,
      );
    },);
  }

  Widget buildPhaseSelector() {
    return ValueListenableBuilder(valueListenable:phaseList , builder: (context, value, child) {
      return BottomSheetSelector(
        field: listFields[2],
        isMultiSelect: false,
        title: 'construction_phase'.tr(),
        listChoices: value,
        selectedNotifier: selectedPhaseNotifier,
      );
    },);
  }


  Widget buildWorkerSelector() {
    //workersList
    return ValueListenableBuilder(valueListenable: workersList, builder: (context, value, child) {
      return BottomSheetSelector(
        field: listFields[3],
        isMultiSelect: false,
        title: 'assign_worker'.tr(),
        listChoices: value,
        selectedNotifier: selectedWorkerNotifier,
      );
    },);
  }

  TitleWithInputField buildDOB(BuildContext context) {
    return TitleWithInputField(
      'due_date'.tr(),
      DOPInputData(
        fontSize: 13,
        field: listFields[4],
        labelText: 'mm/dd/yyyy',
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2050),
          );
          if (date != null) {
            _dueDateController.text =
            "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day
                .toString().padLeft(2, '0')}";
          }
        },
        controller: _dueDateController,
      ),
    );
  }

  BottomSheetSelector buildStatusSelector() {
    return BottomSheetSelector(
      field: listFields[5],
      isMultiSelect: false,
      title: 'status'.tr(),
      listChoices: statusChoices,
      selectedNotifier: statusNotifier,
    );
  }

  TitleWithInputField buildDescription() {
    return TitleWithInputField(
      'task_description'.tr(),
      NameInputData(
        isLabel: false,
        widgetPrefix: const SizedBox.shrink(),
        field: listFields[6],
        maxLines: 4,
        validator: (v) => null,
        labelText: 'detail_the_steps'.tr(),
        controller: _descriptionController,
      ),
    );
  }
}
