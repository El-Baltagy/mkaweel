// import 'package:mkaweel/core/constants/app_api.dart';
//
// abstract class BaseTasksData {
//     String getApi();
//     Map<String,dynamic>? getQuery();
// }
//
// class AdminTodayTasksData extends BaseTasksData{
//   factory AdminTodayTasksData  ()=>  instance;
//   AdminTodayTasksData._();
//   static final AdminTodayTasksData instance = AdminTodayTasksData._();
//   @override
//   String getApi()=>EndPoints.getAdminTasks;
//
//   @override
//   Map<String, dynamic> getQuery() =>{
//     "type":"today"
//   };
// }
// class AdminAllTasksData extends BaseTasksData{
//   @override
//   String getApi()=>EndPoints.getAdminTasks;
//   @override
//   Map<String, dynamic> getQuery() =>{
//     "type":"all"
//   };
// }
//
// class AdminProjectTasksData extends BaseTasksData{
//   AdminProjectTasksData(this.projectID);
//   final String projectID;
//   @override
//   String getApi()=>EndPoints.getProjectTasks(projectID);
//   @override
//   Map<String, dynamic>? getQuery() =>null;
// }
// class WorkerTasksData extends BaseTasksData{
//   @override
//   String getApi()=>EndPoints.getWorkerTasks;
//   @override
//   Map<String, dynamic>? getQuery() =>null;
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/tasks_res/tasks_res.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/add_edit_update_task_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/features/screens/projects/ui/all_projects/widgets/delete_pj_dialouge.dart';
import 'package:mkaweel/features/screens/settings/data/base_type_worker.dart';

abstract class BaseTasksData {
  const BaseTasksData();

  String get api;

  String get title;

  bool get showAddingTaskBtn;

  Map<String, dynamic>? get query;

  List<Widget> listActions(
    BuildContext context,
    TaskItem taskItem,
    TasksCubit tasksCubit,
    BaseTasksData parameter,
  ) => [
    GestureDetector(
      child: const Icon(
        Icons.edit_outlined,
        color: AppColors.primaryLightColor,
        size: AppSizes.s20,
      ),
      onTap: () async {
        final result = await context.push(
          AddEditTasksRoute(
            args: AddEditTasksRouteArgs(taskItem, tasksCubit, parameter),
          ),
        );
        if (result == true) {
          await tasksCubit.getAllTasksFunc(parameter: parameter);
          if (parameter is! AdminTasksData || parameter.type != AdminTaskType.today) {
            await tasksCubit.getAllTasksFunc(parameter:   const AdminTasksData(AdminTaskType.today) );
          }
        }
      },
    ),
    10.horizontalSpace,
    BlocSelector<TasksCubit, TasksState, BaseEmit?>(
      selector: (state) => state is TasksLoaded ? state.deleteTaskState : null,
      builder: (context, deleteState) {
        final isThisDeleting =
            deleteState is Loading<String> &&
            deleteState.item == taskItem.id.toString();
        return GestureDetector(
          onTap: isThisDeleting
              ? null
              : DeletePjDialouge(
                  title: 'delete_task'.tr(),
                  subTitle: 'are_you_sure_you_want_to_delete_this_task'.tr(),
                  onPressedDelete: () => tasksCubit.deleteTaskFunc(
                    DeleteProjectParameter(taskItem.id.toString()),
                  ),
                ).toShowDialouge,
          child: isThisDeleting
              ? const SizedBox(
                  width: AppSizes.s20,
                  height: AppSizes.s20,
                  child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                )
              : const Icon(
                  Icons.delete_outline,
                  color: AppColors.secondryLightColor,
                  size: AppSizes.s20,
                ),
        );
      },
    ),
  ];
}

enum AdminTaskType { today, all  }

class AdminTasksData extends BaseTasksData {
  const AdminTasksData(this.type);

  final AdminTaskType type;

  @override
  String get api => EndPoints.getAdminTasks;

  @override
  String get title => 'all_construction_tasks';

  @override
  // TODO: implement showAddingTaskBtn
  bool get showAddingTaskBtn => true;

  @override
  Map<String, dynamic> get query => {'type': type.name};
  @override
  List<Widget> listActions(
      BuildContext context,
      TaskItem taskItem,
      TasksCubit tasksCubit,
      BaseTasksData parameter,
      ) {
    // if(type==.all){
      return super.listActions(context, taskItem, tasksCubit, parameter);
    // }
    return [];
  }
}

class AdminAllProjectTasksData extends BaseTasksData {
  const AdminAllProjectTasksData(this.projectId);

  final String projectId;

  @override
  String get title => 'all_construction_tasks';

  @override
  // TODO: implement showAddingTaskBtn
  bool get showAddingTaskBtn => true;

  @override
  String get api => EndPoints.getProjectTasks(projectId);

  @override
  Map<String, dynamic>? get query => null;



}

class WorkerTasksData extends BaseTasksData {
  const WorkerTasksData._();

  static const instance = WorkerTasksData._();

  @override
  String get title => 'your_tasks';

  @override
  String get api => EndPoints.getWorkerTasks;

  @override
  // TODO: implement showAddingTaskBtn
  bool get showAddingTaskBtn => false;

  @override
  Map<String, dynamic>? get query => null;

  @override
  List<Widget> listActions(
    BuildContext context,
    TaskItem taskItem,
    TasksCubit tasksCubit,
    BaseTasksData parameter,
  ) => [
    if (taskItem.status.toLowerCase() != 'completed') ...[
      BlocSelector<TasksCubit, TasksState, BaseEmit?>(
        selector: (state) => state is TasksLoaded ? state.workerMarkTaskCompleteState : null,
        builder: (context, markState) {
          final isMarking = markState is Loading<String> && markState.item == taskItem.id.toString();
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              isMarking
                  ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
                  : Checkbox(
                value: false,
                activeColor: context.theme.primaryColor,
                onChanged: (val) {
                  if (val == true) {
                    tasksCubit.workerMarkTaskCompleteFunc(
                      parameter: DeleteProjectParameter(taskItem.id.toString()),
                    );
                  }
                },
              ),
              Text(
                "mark_as_complete".tr(),
                style: const TextStyle(fontSize: 14),
              ),
            ],
          );
        },
      )
    ]
  ];
}
