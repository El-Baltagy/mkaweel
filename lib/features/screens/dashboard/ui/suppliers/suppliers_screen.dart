import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
 
part 'suppliers_screen_mixin.dart';

@RoutePage()
class SuppliersPage extends StatefulWidget implements AutoRouteWrapper {
  const SuppliersPage({super.key, required this.args});
  final SuppliersRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => DashboardCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<SuppliersPage> createState() => _SuppliersPageState();
}

class _SuppliersPageState extends SuppliersPageBaseState {
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
