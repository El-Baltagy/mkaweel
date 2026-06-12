import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/workers/controller/workers_state.dart';
import 'package:mkaweel/features/screens/workers/service/workers_service.dart';


class WorkersCubit extends BaseCubit<WorkersState> {
   WorkersCubit(this._service) : super(WorkersInitial()) ;
  final WorkersService _service;
  
     static WorkersCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
  @override
  void init() {
    // TODO: implement init
   
  }
  
}
