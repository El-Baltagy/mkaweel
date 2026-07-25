import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/dob_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/add_edit_update_task_parameter.dart';
import 'package:mkaweel/features/screens/Tasks/ui/tasks/base_tasks_data.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/get_project_data_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_phases_res/project_phases_res.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/title_with_input.dart';
import 'package:mkaweel/features/screens/workers/controller/workers_cubit.dart';
import 'package:mkaweel/features/screens/workers/data/model/add_worker_data_request.dart';
import 'package:mkaweel/features/screens/workers/data/model/all_workers/all_workers.dart';
import 'package:mkaweel/features/screens/workers/ui/add_workers/widgets/drop_down_role_selector.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
      listenWhen: (previous, current) {
        if (previous is TasksLoaded && current is TasksLoaded) {
          return previous.addUpdateTaskFuncState != current.addUpdateTaskFuncState;
        }
        return true;
      },
      listener: taskListener,
      child: Scaffold(
         appBar:CustomAppBar(
          title:   widget.args.taskItem == null ? 'create_task_title'.tr() : 'edit_task'.tr() ,
        ),
        bottomNavigationBar: buildBtn(),
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

                buildPhaseSelector(),

                buildWorkerSelector(),

                buildDOB(context),

                // buildStatusSelector(),

                buildDescription(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildBtn() {
    return Container(
        margin: const EdgeInsets.all(20).copyWith(top: 10),
        width: double.infinity,
        height: AppSizes.s48,
        child: BlocSelector<TasksCubit, TasksState,BaseEmit?>(
          selector: (state) => state is TasksLoaded?state.addUpdateTaskFuncState:null,
          builder: (context, state) {
            bool isLoading = state is Loading; // Add your loading condition here
            return isLoading
                ? const Row(
              mainAxisAlignment: .center,
              children: [
                CircularProgressIndicator(  ),
              ],
            )
                : ElevatedButton(
              onPressed: saveTask,
              style: ElevatedButton.styleFrom(
                backgroundColor: context.theme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.s8),
                ),
              ),
              child: Text(
                'save'.tr(),
                style: AppTextStyles.font16SemiBold.copyWith(
                  color: context.theme.scaffoldBackgroundColor,
                ),
              ),
            );
          },
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
    return BlocSelector<ProjectsCubit, ProjectsState, BaseEmit?>(
      selector: (state) => state is ProjectsLoaded?state.allProjectsResState:null,
      builder: (context, state) {
        bool isLoading=state is !Success<AllProjectsRes>;
        setDataIntoPJNotifier(state);
        return Skeletonizer(
          enabled: isLoading,
          child: ValueListenableBuilder(
            valueListenable: projectsList,
            builder: (context, value, child) {
              return BottomSheetSelector(
                field: listFields[1],
                isMultiSelect: false,
                title: 'project'.tr(),
                listChoices: value,
                selectedNotifier: selectedProjectNotifier,
              );
            },
          ),
        );
      },
    );
  }

  Widget buildPhaseSelector() {
    return BlocSelector<ProjectsCubit, ProjectsState, BaseEmit?>(
      selector: (state)=>state is ProjectsLoaded?state.getProjectPhasesState:null,
      builder: (context, state) {
        bool isLoading=
        state is !Success<ProjectPhasesRes>;
        setDataIntoPhaseNotifier(state);
        return Skeletonizer(
          enabled: isLoading,
          child: ValueListenableBuilder(valueListenable:phaseList , builder: (context, value, child) {
            return BottomSheetSelector(
              field: listFields[2],
              isMultiSelect: false,
              title: 'construction_phase'.tr(),
              listChoices: value,
              selectedNotifier: selectedPhaseNotifier,
            );
          },),
        );
      },
    );
  }


  Widget buildWorkerSelector() {
    //workersList
    return BlocSelector<WorkersCubit, WorkersState, BaseEmit?>(
      selector: (state)=>state is AllWorkersLoaded?state.allWorkersEmit:null,
      builder: (context, state) {
        bool isLoading=  state is !Success<AllWorkers>;
      setDataIntoWorkerNotifier(state);
      return ValueListenableBuilder(valueListenable: workersList, builder: (context, value, child) {
        return Skeletonizer(
          enabled: isLoading,
          child: BottomSheetSelector(
            field: listFields[3],
            isMultiSelect: false,
            title: 'assign_worker'.tr(),
            listChoices: value,
            selectedNotifier: selectedWorkerNotifier,
          ),
        );
      },);
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
