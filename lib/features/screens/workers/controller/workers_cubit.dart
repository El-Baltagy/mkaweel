import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
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
   AllWorkersLoaded get _current => state is AllWorkersLoaded
       ? state as AllWorkersLoaded
       : AllWorkersLoaded();


   int get getWorkersKeyCode => AppConstant.getWorkersKeyCode;
  init() async {
     // TODO: implement init

   }
  

  Future<void> getWorkersFunc(  {NoParameter? parameter}) async {
    await CancelManager.runCancelableFun(getWorkersKeyCode, (token) async {
      await _service.getWorkersServ(
        RequestCallbackObserver<AllWorkers, NoParameter>(
          baseRequestBackType:Init(),
          parameter: parameter ,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(allWorkersEmit: Loading() )),
          onRightCallback: (data) => safeEmit(_current.copyWith(allWorkersEmit:Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(allWorkersEmit:ErrorState(failure))),
        ),
      );
    });
  }
  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(getWorkersKeyCode);
    return super.close();
  }
}
