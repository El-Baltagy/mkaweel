import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
    import 'package:mkaweel/core/shared/methods/print.dart';
    import 'package:mkaweel/core/constants/app_constant.dart';
 import 'package:mkaweel/core/base/base_state.dart';
 import 'package:mkaweel/core/base/base_service.dart';   
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/features/screens/attendence/data/model/attendence_res/attendence_res.dart';
import 'package:mkaweel/features/screens/attendence/data/model/check_in_out_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/attendence/service/attendence_service.dart';
part 'attendence_state.dart';

class AttendenceCubit extends BaseCubit<AttendenceState> {
   AttendenceCubit(this._service) : super(AttendenceLoaded()) ;
  final AttendenceService _service;
  
     static AttendenceCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
    // Always holds the latest combined state — used by copyWith
   AttendenceLoaded get _current => state is AttendenceLoaded
       ? state as AttendenceLoaded
       : AttendenceLoaded();
       
      int get getCurrentAttendenceKeyCode => AppConstant.getCurrentAttendenceKeyCode;

    int get checkInOutToogleKeyCode => AppConstant.checkInOutToogleKeyCode;

  Future<void> init() async {
     // TODO: implement init

   }
  

  Future<void> getCurrentAttendenceFunc( {NoParameter? parameter}) async {
    await CancelManager.runCancelableFun(getCurrentAttendenceKeyCode, (token) async {
      await _service.getCurrentAttendenceServ(
        RequestCallbackObserver<AttendenceRes, NoParameter>(
           parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(getCurrentAttendenceState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(getCurrentAttendenceState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(getCurrentAttendenceState: ErrorState(failure))),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(checkInOutToogleKeyCode);

    // add every key in file
    CancelManager.cancel(getCurrentAttendenceKeyCode);
    return super.close();
  }

  Future<void> checkInOutToogleFunc( {required CheckInOutParameter  parameter}) async {
    PrintHelper().ordinaryPrint(parameter.toJson());
    PrintHelper().ordinaryPrint('......................wasd');
    await CancelManager.runCancelableFun(checkInOutToogleKeyCode, (token) async {
      await _service.checkInOutToogleServ(
        RequestCallbackObserver<DeleteProjectRes, CheckInOutParameter>(
           parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(checkInOutToogleState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(checkInOutToogleState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(checkInOutToogleState: ErrorState(failure))),
        ),
      );
    });
  }
}
