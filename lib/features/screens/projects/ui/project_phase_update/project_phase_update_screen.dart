import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
 
part 'project_phase_update_screen_mixin.dart';

@RoutePage()
class ProjectPhaseUpdatePage extends StatefulWidget implements AutoRouteWrapper {
  const ProjectPhaseUpdatePage({super.key, required this.args});
  final ProjectPhaseUpdateRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProjectsCubit>(
      create: (context) => ProjectsCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<ProjectPhaseUpdatePage> createState() => _ProjectPhaseUpdatePageState();
}

class _ProjectPhaseUpdatePageState extends ProjectPhaseUpdatePageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectsCubit, ProjectsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(

      ),
    );
  }
}
