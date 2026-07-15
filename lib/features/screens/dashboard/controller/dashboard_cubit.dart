import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
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
     CancelManager.cancel(calculateWastePercentageKeyCode);
     return super.close();
   }

   @override
   Future<void> init() async {

   }
  
}
