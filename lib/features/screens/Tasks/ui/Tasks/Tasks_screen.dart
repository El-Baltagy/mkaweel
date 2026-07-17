import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
 import 'package:mkaweel/features/screens/Tasks/ui/Tasks/widgets/tasks_header.dart';
import 'package:mkaweel/features/screens/Tasks/ui/Tasks/widgets/tasks_data_table.dart';
 
part 'Tasks_screen_mixin.dart';

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
    return Semantics(
      label: 'tasks_page_semantics'.tr(),
      child: BlocListener<TasksCubit, TasksState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Scaffold(
          backgroundColor: AppColors.lightBackground,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TasksHeader(
                  onAddTask: () {
                    // TODO: Implement add task logic
                  },
                ),
                const TasksDataTable(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
