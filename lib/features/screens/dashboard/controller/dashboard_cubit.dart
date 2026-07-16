import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/statistics_res/statistics_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/suppliers_res/suppliers_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/waste_calc_paremeter.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/waste_calc_res/waste_calc_res.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
import 'package:mkaweel/features/screens/dashboard/service/dashboard_service.dart';


class DashboardCubit extends BaseCubit<DashboardState> {
   DashboardCubit(this._service) : super(DashboardLoaded()) ;
  final DashboardService _service;
  
     static DashboardCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);



   DashboardLoaded get _current => state is DashboardLoaded
       ? state as DashboardLoaded
       : DashboardLoaded();

   int get calculateWastePercentageKeyCode => AppConstant.calculateWastePercentageKeyCode;

   Future<void> calculateWastePercentageFunc(  {WasteCalcParemeter? parameter}) async {
     await CancelManager.runCancelableFun(calculateWastePercentageKeyCode, (token) async {
       await _service.calculateWastePercentageServ(
         RequestCallbackObserver<WasteCalcRes, WasteCalcParemeter>(
           baseRequestBackType:Reload(),
           parameter: parameter ,
           cancelToken: token,
           onLoadCallback: () =>
               safeEmit(_current.copyWith(wasteCalcEmit: Loading())),
           onRightCallback: (data) =>
               safeEmit(_current.copyWith(wasteCalcEmit: Success(data))),
           onLeftCallback: (failure) =>
               safeEmit(_current.copyWith(wasteCalcEmit: ErrorState(failure))),
         ),
       );
     });
   }


   @override
   Future<void> close() {
    // add every key in file
    CancelManager.cancel(getStatisticsKeyCode);

    // add every key in file
    CancelManager.cancel(getSuppliersKeyCode);

     // add every key in file
     CancelManager.cancel(calculateWastePercentageKeyCode);
     return super.close();
   }

     int get getSuppliersKeyCode => AppConstant.getSuppliersKeyCode;

    int get getStatisticsKeyCode => AppConstant.getStatisticsKeyCode;

  @override
   Future<void> init() async {

   }
  

  Future<void> getSuppliersFunc(BaseRequestBackType baseRequestBackType,{NoParameter? parameter}) async {
    await CancelManager.runCancelableFun(getSuppliersKeyCode, (token) async {
      await _service.getSuppliersServ(
        RequestCallbackObserver<SuppliersRes, NoParameter>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(getSuppliersState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(getSuppliersState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(getSuppliersState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> getStatisticsFunc(BaseRequestBackType baseRequestBackType,{NoParameter? parameter}) async {
       await _service.getStatisticsServ(
        RequestCallbackObserver<StatisticsRes, NoParameter>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
           onLoadCallback: () => safeEmit(_current.copyWith(getStatisticsState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(getStatisticsState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(getStatisticsState: ErrorState(failure))),
        ),
      );
   }
}
