import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/create_invoice_parameter.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/ghant_data.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/ghant_res/ghant_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/invoice_res/invoice_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/statistics_res/statistics_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/suppliers_res/suppliers_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/waste_calc_paremeter.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/waste_calc_res/waste_calc_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/weather_parameter.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/weather_res/weather_res.dart';
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
   int get getSuppliersKeyCode => AppConstant.getSuppliersKeyCode;
   int get getStatisticsKeyCode => AppConstant.getStatisticsKeyCode;
   int get getWeatherKeyCode => AppConstant.getWeatherKeyCode;
   int get getGhantDataKeyCode => AppConstant.getGhantDataKeyCode;
   @override
   Future<void> close() {
    // add every key in file
    CancelManager.cancel(createInvoiceKeyCode);

     // add every key in file
     CancelManager.cancel(getGhantDataKeyCode);

     // add every key in file
     CancelManager.cancel(getStatisticsKeyCode);

     // add every key in file
     CancelManager.cancel(getSuppliersKeyCode);

     // add every key in file
     CancelManager.cancel(calculateWastePercentageKeyCode);
     CancelManager.cancel(getWeatherKeyCode);
     return super.close();
   }


     int get createInvoiceKeyCode => AppConstant.createInvoiceKeyCode;

  @override
   Future<void> init() async {
     _current.getGhantDataState=null;
   }




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

  Future<void> getWeatherFunc(BaseRequestBackType baseRequestBackType,{WeatherParameter? parameter}) async {
    await CancelManager.runCancelableFun(getWeatherKeyCode, (token) async {
      await _service.getWeatherServ(
        RequestCallbackObserver<WeatherRes, WeatherParameter>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(getWeatherState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(getWeatherState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(getWeatherState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> getGhantDataFunc( {required GhantParameter  parameter}) async {
    await CancelManager.runCancelableFun(getGhantDataKeyCode, (token) async {
      await _service.getGhantDataServ(
        RequestCallbackObserver<GhantRes, GhantParameter>(
          baseRequestBackType: Reload() ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(getGhantDataState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(getGhantDataState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(getGhantDataState: ErrorState(failure))),
        ),
      );

    });
  }


  Future<void> createInvoiceFunc( {CreateInvoiceParameter? parameter}) async {
    await CancelManager.runCancelableFun(createInvoiceKeyCode, (token) async {
      await _service.createInvoiceServ(
        RequestCallbackObserver<InvoiceRes, CreateInvoiceParameter>(
           parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(createInvoiceState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(createInvoiceState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(createInvoiceState: ErrorState(failure))),
        ),
      );
    });
  }
}
