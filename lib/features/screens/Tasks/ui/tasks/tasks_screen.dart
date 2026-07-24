import 'package:easy_localization/easy_localization.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/extension/double.dart';
 import 'package:mkaweel/core/shared/widgets/entrance_fader.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/dummy.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
 import 'package:mkaweel/features/screens/Tasks/data/model/tasks_res/tasks_res.dart';
import 'package:mkaweel/features/screens/Tasks/ui/tasks/base_tasks_data.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/features/screens/projects/ui/all_projects/widgets/delete_pj_dialouge.dart';
import 'package:skeletonizer/skeletonizer.dart';
 part 'tasks_screen_mixin.dart';
 part 'widgets/task_item.dart';
part 'widgets/worker_item.dart';
part 'widgets/info_chip.dart';
part 'widgets/worker_chip.dart';
part 'widgets/tasks_list.dart';
part 'widgets/empty_item.dart';

@RoutePage()
class TasksPage extends StatefulWidget implements AutoRouteWrapper {
  const TasksPage({super.key, required this.args});

  final TasksRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TasksCubit>(
      create: (context) => TasksCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends TasksPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TasksCubit, TasksState>(
      listener: tasksListener,
      child: Scaffold(
         appBar: CustomAppBar(
           title: 'all_construction_tasks'.tr(),
        ),
        body: BlocSelector<TasksCubit, TasksState, BaseEmit?>(
          selector: (state) =>
              state is TasksLoaded ? state.getTasksState : null,
          builder: (context, state) {
            return TasksListWidget(
              parameter:widget. args.baseTasksData,
              state: state,
              tasksCubit: tasksCubit,
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.theme.colorScheme.secondary,
          onPressed: () async {
            final result = await context.push(AddEditTasksRoute(args:   AddEditTasksRouteArgs(null,tasksCubit)));
            if (result == true) {
              await tasksCubit.getTasksFunc(  parameter: widget.args.baseTasksData);
            }
          },
          child: Icon(Icons.add, color: context.theme.scaffoldBackgroundColor),
        ),
      ),
    );
  }
}
