import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
import 'package:mkaweel/features/screens/dashboard/service/dashboard_service.dart';


class DashboardCubit extends BaseCubit<DashboardState> {
   DashboardCubit(this._service) : super(DashboardInitial()) ;
  final DashboardService _service;
  
     static DashboardCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);

   @override
   Future<void> init() async {
     // TODO: implement init

   }
  
}
