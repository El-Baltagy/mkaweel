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
import 'package:mkaweel/core/shared/widgets/classic_header_refresh.dart';
 import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
 import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/projects/ui/all_projects/widgets/projects_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class ProjectsPage extends StatefulWidget implements AutoRouteWrapper{
  const ProjectsPage({super.key});
  
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProjectsCubit>(
          create: (context) => ProjectsCubit(AppLocator()()()),
        )
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
         appBar: CustomAppBar(
           // leading: SizedBox.shrink(),
         //   leading: IconButton(
         //   icon:   Icon(Icons.sync, color: context.theme.scaffoldBackgroundColor),
         //   onPressed: () =>projectsCubit.getAllProjectsFunc(Reload()),
         // ),
         title:  'projects'.tr(),
         ),

         body: SmartRefresher(
           controller: refreshController,
           header: const ClassicHeaderRefresh(),
             onRefresh: () {
                projectsCubit.getAllProjectsFunc(Reload()).whenComplete(() {
                 refreshController.refreshCompleted();
               },);
             },
             child: BlocSelector<ProjectsCubit, ProjectsState, BaseEmit?>(
                  selector: (state) =>state is ProjectsLoaded ? state.allProjectsResState : null,
                  builder: (context, state) {
           return ProjectsListWidget(
                projectsCubit: projectsCubit,
             state: state,
           );
                  },
                ),
         ),
         floatingActionButtonLocation: .centerFloat,
         floatingActionButton: FloatingActionButton(
           backgroundColor: context.theme.colorScheme.secondary,

           onPressed: () async {
             final result = await context.push(CreateProjectRoute(args:   CreateProjectRouteArgs(null,projectsCubit)));
             if (result == true) {
               await projectsCubit.getAllProjectsFunc(Reload());
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
  RefreshController refreshController=.new();
  @override
  void initState() {
    super.initState();
    projectsCubit = ProjectsCubit.get(context: context);
    projectsCubit.getAllProjectsFunc(Init());
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
