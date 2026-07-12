import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
 import 'package:mkaweel/features/screens/add_edit_task_project/controller/create_project_cubit.dart';
import 'package:mkaweel/features/screens/add_edit_task_project/controller/create_project_state.dart';
 
part 'create_task_screen_mixin.dart';

@RoutePage()
class CreateTaskPage extends StatefulWidget implements AutoRouteWrapper {
  const CreateTaskPage({super.key, required this.args});
  final CreateTaskRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AddEditProjectTaskCubit>(
      create: (context) => AddEditProjectTaskCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends CreateTaskPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddEditProjectTaskCubit, AddEditProjectTaskState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(

      ),
    );
  }
}
