import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
 import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/features/screens/workers/controller/workers_cubit.dart';
 import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/workers/ui/workers_sc/widgets/workers_widgets.dart';

part   'workers_sc_mixin.dart';
@RoutePage()
class WorkersPage extends StatefulWidget implements AutoRouteWrapper {
  const WorkersPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<WorkersCubit>(
      create: (context) => WorkersCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<WorkersPage> createState() => _WorkersPageState();
}

class _WorkersPageState extends WorkersPageBaseState {

  int get _activeCount => 1;
  int get _inactiveCount => 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkersCubit, WorkersState>(
      listener: listenerWorkersCubit,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          title: Text(
            'workers_management'.tr(),
            style: AppTextStyles.font18SemiBold.copyWith(color: context.theme.scaffoldBackgroundColor),
          ),
          centerTitle: true,
          leading: IconButton(
            icon:   Icon(Icons.add, color: context.theme.scaffoldBackgroundColor),
            onPressed:  () async {
              var result=await context.push(AddWorkerRoute(args: const AddWorkerRouteArgs(workerId: null)));
              if (result == true) {
                await workersCubit.getWorkersFunc();
              }
            } ,
          ),

        ),
        body: Column(
          children: [
            // WorkersSummaryWidget(
            //   activeCount: _activeCount,
            //   inactiveCount: _inactiveCount,
            // ),
            // if(false)
            // WorkersFilterWidget(
            //   selectedFilter: _selectedFilter,
            //   onFilterChanged: (f) => setState(() => _selectedFilter = f),
            // ),
            const SizedBox(height: AppSizes.s12),
            Expanded(child: BlocSelector<WorkersCubit, WorkersState, BaseEmit?>(
  selector: (state)=> state is AllWorkersLoaded? state.allWorkersEmit  :null,
  builder: (context, state) {
    return WorkersListWidget(emit:state,workersCubit:workersCubit);
  },
)),
          ],
        ),
      ),
    );
  }
}