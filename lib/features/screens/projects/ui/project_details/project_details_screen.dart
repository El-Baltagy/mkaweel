import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_phases_res/project_phases_res.dart';
part 'widgets/phase_card.dart';
part 'pj_details_mixin.dart';
 @RoutePage()
class ProjectDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  const ProjectDetailsPage({super.key, required this.args});

  final ProjectDetailsRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.projectsCubit, child: this);

  }

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends ProjectDetailsPageBaseState {


  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectsCubit, ProjectsState>(
      listener: listener,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar:CustomAppBar(
          title:  'project_overview'.tr()+' '+widget.args.projectInfoData.name,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(AppPadding.p16).copyWith(bottom: AppPadding.p32 ) ,
            itemCount: phases.length,
          separatorBuilder: (_, __) => AppPadding.p12.verticalSpace,
          itemBuilder: (context, index) {
            final phase = phases[index];
            return _PhaseCard(
              projectPhaseItem: null,

            );
          },
        ),

      ),
    );
  }



}