import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/features/screens/attendence/controller/attendence_cubit.dart';
 
part 'attendence_screen_mixin.dart';

@RoutePage()
class AttendencePage extends StatefulWidget implements AutoRouteWrapper {
  const AttendencePage({super.key, required this.args});
  final AttendenceRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AttendenceCubit>(
      create: (context) => AppLocator()()() ,
      child: this,
    );
  }

  @override
  State<AttendencePage> createState() => _AttendencePageState();
}

class _AttendencePageState extends AttendencePageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AttendenceCubit, AttendenceState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        // body: ,
      ),
    );
  }
}
