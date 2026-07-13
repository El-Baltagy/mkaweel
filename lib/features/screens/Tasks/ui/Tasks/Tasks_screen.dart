import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
 
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
    return BlocListener<TasksCubit, TasksState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(

      ),
    );
  }
}
