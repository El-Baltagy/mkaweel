import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/features/screens/workers/data/model/add_worker_data_request.dart';
import 'package:mkaweel/features/screens/workers/data/model/all_workers/all_workers.dart';
import 'package:mkaweel/main.dart';
 import 'package:mkaweel/features/screens/workers/service/workers_service.dart';
part 'workers_state.dart';

class WorkersCubit extends BaseCubit<WorkersState> {
   WorkersCubit(this._service) : super(AllWorkersLoaded()) ;
  final WorkersService _service;
  
     static WorkersCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);


   // Always holds the latest combined state — used by copyWith
   AllWorkersLoaded get current => state is AllWorkersLoaded
       ? state as AllWorkersLoaded
       : AllWorkersLoaded();


   int get getWorkersKeyCode => AppConstant.getWorkersKeyCode;
    int get addWorkerKeyCode => AppConstant.addWorkerKeyCode;

    int get deleteWorkerKeyCode => AppConstant.deleteWorkerKeyCode;

  Future<void> init() async {
     // TODO: implement init

   }
  

  Future<void> getWorkersFunc(  {NoParameter? parameter}) async {
    await CancelManager.runCancelableFun(getWorkersKeyCode, (token) async {
      await _service.getWorkersServ(
        RequestCallbackObserver<AllWorkers, NoParameter>(
          baseRequestBackType:Init(),
          parameter: parameter ,
          cancelToken: token,
          onLoadCallback: () => safeEmit(current.copyWith(allWorkersEmit: Loading() )),
          onRightCallback: (data) => safeEmit(current.copyWith(allWorkersEmit:Success(data))),
          onLeftCallback: (failure) => safeEmit(current.copyWith(allWorkersEmit:ErrorState(failure))),
        ),
      );
    });
  }
  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(deleteWorkerKeyCode);

    // add every key in file
    CancelManager.cancel(addWorkerKeyCode);

    return super.close();
  }

  Future<void> addUpdateWorkerFunc( {AddWorkerDataRequest? parameter}) async {
    await CancelManager.runCancelableFun(addWorkerKeyCode, (token) async {
      await _service.addWorkerServ(
        RequestCallbackObserver<DeleteProjectRes, AddWorkerDataRequest>(
           parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit( current.copyWith(
                addUpdateWorkerState: Loading()) ..deleteWorkerState=null),
          onRightCallback: (data) => safeEmit(current.copyWith(addUpdateWorkerState: Success(data))),
          onLeftCallback: (failure) => safeEmit(current.copyWith(addUpdateWorkerState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> deleteWorkerFunc( {required DeleteProjectParameter  parameter}) async {
    await CancelManager.runCancelableFun(deleteWorkerKeyCode, (token) async {
      await _service.deleteWorkerServ(
        RequestCallbackObserver<DeleteProjectRes, DeleteProjectParameter>(
           parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(current.copyWith(deleteWorkerState: Loading(),
              deletingWorkersIds: [...current.deletingWorkersIds, parameter.id.toString()]

          )),
           onRightCallback: (data) => safeEmit(current.copyWith(
            allWorkersEmit: current.allWorkersEmit is Success<AllWorkers> ?
            Success<AllWorkers>((current.allWorkersEmit as Success<AllWorkers>).data!.copyWith(
              data: (current.allWorkersEmit as Success<AllWorkers>).data!.data.where((element) => element.id.toString() != parameter.id.toString()).toList(),
            ))
                :current.allWorkersEmit,
            deleteWorkerState: Success(data),
            deletingWorkersIds: current.deletingWorkersIds.where((id) => id != parameter.id.toString()).toList(),
          )),
          onLeftCallback: (failure) => safeEmit(current.copyWith(deleteWorkerState: ErrorState(failure),
            deletingWorkersIds: current.deletingWorkersIds.where((id) => id != parameter.id.toString()).toList(),

          )),
        ),
        
      ) ;
    });
  }
}
