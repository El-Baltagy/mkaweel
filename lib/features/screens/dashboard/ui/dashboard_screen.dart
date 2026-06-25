import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/storage/storage_helper.dart';
 import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
 import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/features/screens/dashboard/ui/widgets/dashboard_header_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/widgets/stats_cards_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/widgets/today_tasks_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/widgets/quick_tools_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/widgets/quick_links_widget.dart';
import 'package:token_saver/secure_token_manager.dart';

@RoutePage()
class DashboardPage extends StatefulWidget implements AutoRouteWrapper{
  const DashboardPage({super.key});
  
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) =>DashboardCubit(AppLocator()()()),
      child: this,
    );
  }
  
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends DashboardPageBaseState {
  @override
  Widget build(BuildContext context) {
     return BlocListener<DashboardCubit, DashboardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Semantics(
        label: 'Dashboard Screen',
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
           floatingActionButton: InkWell(
             onTap: () async {
               // context.showToast(
               //    " data.message"
               // );
               // return ;
               // await HWSecureSaver.save(AppConstant.tokenKeyCash,  "144");
               var token=await HWSecureSaver.get(AppConstant.tokenKeyCash );
              debugPrint(token);
             },
             child: Text("test token"),
           ),
           body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  const DashboardHeaderWidget(),
                  20.verticalSpace,
                  const StatsCardsWidget(),
                  20.verticalSpace,
                  const TodayTasksWidget(),
                  20.verticalSpace,
                  const QuickToolsWidget(),
                  20.verticalSpace,
                  const QuickLinksWidget(),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

abstract class  DashboardPageBaseState extends State<DashboardPage> {
  late final DashboardCubit argData;
  
  @override
  void initState() {
    argData = DashboardCubit.get(context: context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
