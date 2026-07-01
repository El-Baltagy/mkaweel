import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/main_home/controller/main_home_state.dart';
import 'package:mkaweel/features/screens/main_home/service/main_home_service.dart';


class MainHomeCubit extends BaseCubit<MainHomeState> {
   MainHomeCubit(this._service) : super(MainHomeInitial()) ;
  final MainHomeService _service;
  
     static MainHomeCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);

   @override
   Future<void> init() async {
     // TODO: implement init

   }
  
}
