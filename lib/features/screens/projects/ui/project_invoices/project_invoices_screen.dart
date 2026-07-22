import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
 
part 'project_invoices_screen_mixin.dart';

@RoutePage()
class ProjectInvoicesPage extends StatefulWidget implements AutoRouteWrapper {
  const ProjectInvoicesPage({super.key, required this.args});
  final ProjectInvoicesRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.projectsCubit, child: this);

  }

  @override
  State<ProjectInvoicesPage> createState() => _ProjectInvoicesPageState();
}

class _ProjectInvoicesPageState extends ProjectInvoicesPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectsCubit, ProjectsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'project_invoices'.tr(),
        ),
      ),
    );
  }
}
