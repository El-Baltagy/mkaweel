import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
     import 'package:mkaweel/core/constants/app_constant.dart';
 import 'package:mkaweel/core/base/base_state.dart';
 import 'package:mkaweel/core/base/base_service.dart';   
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/add_edit_update_task_parameter.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/tasks_res/tasks_res.dart';
import 'package:mkaweel/features/screens/Tasks/ui/tasks/base_tasks_data.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
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
       

    int get deleteTaskKeyCode => AppConstant.deleteTaskKeyCode;

    int get addUpdateTaskFuncKeyCode => AppConstant.addUpdateTaskFuncKeyCode;

  Future<void> init() async {
     // TODO: implement init

   }

   // Future<void> getTodayTasksFunc( {required BaseTasksData  parameter}) async {
   //   await _service.getTasksServ(
   //     RequestCallbackObserver<TasksRes, BaseTasksData>(
   //        parameter: parameter,
   //       onLoadCallback: () => safeEmit(_current.copyWith(todayTasksState: Loading())),
   //       onRightCallback: (data) => safeEmit(_current.copyWith(todayTasksState: Success(data))),
   //       onLeftCallback: (failure) => safeEmit(_current.copyWith(todayTasksState: ErrorState(failure))),
   //     ),
   //   );
   // }
  

  Future<void> getAllTasksFunc( {required BaseTasksData  parameter}) async {
       await _service.getTasksServ(
        RequestCallbackObserver<TasksRes, BaseTasksData>(

          parameter: parameter,
           onLoadCallback: () => safeEmit(_current.copyWith(getTasksState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(getTasksState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(getTasksState: ErrorState(failure))),
        ),
      );
   }

  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(addUpdateTaskFuncKeyCode);

    // add every key in file
    CancelManager.cancel(deleteTaskKeyCode);

     return super.close();
  }

  Future<void> deleteTaskFunc(DeleteProjectParameter parameter) async {
    await CancelManager.runCancelableFun(deleteTaskKeyCode, (token) async {
      await _service.deleteTaskServ(
        RequestCallbackObserver<DeleteProjectRes, DeleteProjectParameter>(
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(
            _current.copyWith(deleteTaskState: Loading<String>(parameter.id)),
          ),
          onRightCallback: (data) {
            // Remove the deleted task from the cached list
            final currentTasksState = _current.getTasksState;
            BaseEmit? updatedTasksState = currentTasksState;
            if (currentTasksState is Success<TasksRes> &&
                currentTasksState.data != null) {
              final updatedList = currentTasksState.data!.data
                  .where((t) => t.id.toString() != parameter.id)
                  .toList();
              updatedTasksState = Success(
                currentTasksState.data!.copyWith(data: updatedList),
              );
            }
            safeEmit(_current.copyWith(
              deleteTaskState: Success(data),
              getTasksState: updatedTasksState,
            ));
          },
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(deleteTaskState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  Future<void> addUpdateTaskFuncFunc( {required AddEditTaskRequest  parameter}) async {
    PrintHelper().ordinaryPrint(parameter.toJson());
     await CancelManager.runCancelableFun(addUpdateTaskFuncKeyCode, (token) async {
      await _service.addUpdateTaskFuncServ(
        RequestCallbackObserver<DeleteProjectRes, AddEditTaskRequest>(
           parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(addUpdateTaskFuncState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(addUpdateTaskFuncState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(addUpdateTaskFuncState: ErrorState(failure))),
        ),
      );
    });
  }
}
