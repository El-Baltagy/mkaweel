import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/make_bus/controller/make_bus_cubit.dart';
 
part 'make_bus_screen_mixin.dart';

@RoutePage()
class MakeBusPage extends StatefulWidget implements AutoRouteWrapper {
  const MakeBusPage({super.key, required this.args});
  final MakeBusRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<MakeBusCubit>(
      create: (context) => MakeBusCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<MakeBusPage> createState() => _MakeBusPageState();
}

class _MakeBusPageState extends MakeBusPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<MakeBusCubit, MakeBusState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(

      ),
    );
  }
}
