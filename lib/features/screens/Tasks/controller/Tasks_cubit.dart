    import 'package:mkaweel/core/shared/methods/print.dart';
    import 'package:mkaweel/core/constants/app_constant.dart';
 import 'package:mkaweel/core/base/base_state.dart';
 import 'package:mkaweel/core/base/base_service.dart';   
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/Tasks/service/Tasks_service.dart';
part 'Tasks_state.dart';

class TasksCubit extends BaseCubit<TasksState> {
   TasksCubit(this._service) : super(TasksLoaded()) ;
  final TasksService _service;
  
     static TasksCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
    // Always holds the latest combined state — used by copyWith
   TasksLoaded get _current => state is TasksLoaded
       ? state as TasksLoaded
       : TasksLoaded();
       
    Future<void> init() async {
     // TODO: implement init

   }
  
}
