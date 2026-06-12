import 'package:easy_localization/easy_localization.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'widgets/empty_projects_widget.dart';

@RoutePage()
class ProjectsPage extends StatefulWidget implements AutoRouteWrapper{
  const ProjectsPage({super.key});
  
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProjectsCubit>(
      create: (context) =>ProjectsCubit(AppLocator()()()),
      child: this,
    );
  }
  
  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends ProjectsPageBaseState {
  @override
  Widget build(BuildContext context) {
     return BlocListener<ProjectsCubit, ProjectsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Semantics(
        label: 'Projects Screen',
        child: Scaffold(
          backgroundColor: AppColors.contractorBackground,
          appBar: AppBar(
            backgroundColor: AppColors.contractorTeal,
            title: Text('projects'.tr(), style: AppTextStyles.font18SemiBold.copyWith(color: AppColors.white)),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.sync, color: AppColors.white),
              onPressed: () {},
            ),
          ),
          body: const EmptyProjectsWidget(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.contractorRed,
            onPressed: () {
              // Navigate to create project
            },
            child: const Icon(Icons.add, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

abstract class  ProjectsPageBaseState extends State<ProjectsPage> {
  late final ProjectsCubit argData;
  
  @override
  void initState() {
    argData = ProjectsCubit.get(context: context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
