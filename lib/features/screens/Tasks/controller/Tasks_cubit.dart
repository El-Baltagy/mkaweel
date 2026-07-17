import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
    import 'package:mkaweel/core/shared/methods/print.dart';
    import 'package:mkaweel/core/constants/app_constant.dart';
 import 'package:mkaweel/core/base/base_state.dart';
 import 'package:mkaweel/core/base/base_service.dart';   
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/tasks_res/tasks_res.dart';
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
       
      int get getTasksKeyCode => AppConstant.getTasksKeyCode;

  Future<void> init() async {
     // TODO: implement init

   }

   
  

  Future<void> getTasksFunc(BaseRequestBackType baseRequestBackType,{NoParameter? parameter}) async {
    await CancelManager.runCancelableFun(getTasksKeyCode, (token) async {
      await _service.getTasksServ(
        RequestCallbackObserver<TasksRes, NoParameter>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(getTasksState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(getTasksState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(getTasksState: ErrorState(failure))),
        ),
      );
    });
  }
  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(getTasksKeyCode);
    return super.close();
  }
}
