import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
 
part 'suppliers_info_screen_mixin.dart';

@RoutePage()
class SuppliersInfoPage extends StatefulWidget implements AutoRouteWrapper {
  const SuppliersInfoPage({super.key, required this.args});
  final SuppliersInfoRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => DashboardCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<SuppliersInfoPage> createState() => _SuppliersInfoPageState();
}

class _SuppliersInfoPageState extends SuppliersInfoPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardCubit, DashboardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(

      ),
    );
  }
}
