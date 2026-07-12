import 'package:easy_localization/easy_localization.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/add_edit_task_project/controller/create_project_cubit.dart';
import 'package:mkaweel/features/screens/add_edit_task_project/controller/create_project_state.dart';
import 'package:mkaweel/features/screens/add_edit_task_project/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
 import 'package:mkaweel/core/theming/app_text_styles.dart';
 import 'package:mkaweel/features/screens/projects/ui/widgets/projects_list.dart';

@RoutePage()
class ProjectsPage extends StatefulWidget implements AutoRouteWrapper{
  const ProjectsPage({super.key});
  
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProjectsCubit>(
          create: (context) => ProjectsCubit(AppLocator()()()),
        ),
        BlocProvider<AddEditProjectTaskCubit>(
          create: (context) => AddEditProjectTaskCubit(AppLocator()()()),
        ),
      ], child: this,);

  }
  
  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends ProjectsPageBaseState {
  @override
  Widget build(BuildContext context) {
     return Semantics(
       label: 'Projects Screen',
       child: Scaffold(
         backgroundColor: context.theme.scaffoldBackgroundColor,
         appBar: AppBar(
           backgroundColor: Theme.of(context).primaryColor,
           title: Text('projects'.tr(), style: AppTextStyles.font18SemiBold.copyWith(color: context.theme.scaffoldBackgroundColor)),
           centerTitle: true,
           leading: IconButton(
             icon:   Icon(Icons.sync, color: context.theme.scaffoldBackgroundColor),
             onPressed: () =>projectsCubit.getAllProjectsFunc(),
           ),
         ),

         body: BlocSelector<ProjectsCubit, ProjectsState, BaseEmit?>(
       selector: (state) =>state is ProjectsLoaded ? state.allProjectsResState : null,
       builder: (context, state) {
         return ProjectsListWidget(
     projectsCubit: projectsCubit,
           state: state,
         );
       },
     ),
         floatingActionButtonLocation: .centerFloat,
         floatingActionButton: FloatingActionButton(
           backgroundColor: context.theme.colorScheme.secondary,

           onPressed: () async {
             final result = await context.push(CreateProjectRoute(args: const CreateProjectRouteArgs(null)));
             if (result == true) {
               await projectsCubit.getAllProjectsFunc();
             }
           },
           child:   Icon(Icons.add, color: context.theme.scaffoldBackgroundColor),
         ),
       ),
     );
  }


}

abstract class  ProjectsPageBaseState extends State<ProjectsPage> {
  late final ProjectsCubit projectsCubit;
  
  @override
  void initState() {
    super.initState();
    projectsCubit = ProjectsCubit.get(context: context);
    projectsCubit.getAllProjectsFunc();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
