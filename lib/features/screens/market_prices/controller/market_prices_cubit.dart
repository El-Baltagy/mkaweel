import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/catogeries_res/catogeries_res.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/exchange_rate/exchange_rate.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_cat_input.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_catogeries_data/sub_catogeries_data.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_state.dart';
import 'package:mkaweel/features/screens/market_prices/service/market_prices_service.dart';

class MarketPricesCubit extends BaseCubit<MarketPricesState> {
  MarketPricesCubit(this._service) : super(MarketPricesLoaded());
  final MarketPricesService _service;

  // Always holds the latest combined state — used by copyWith
  MarketPricesLoaded get _current => state is MarketPricesLoaded
      ? state as MarketPricesLoaded
      : MarketPricesLoaded();

  static MarketPricesCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  int get getCatogeriesKeyCode => AppConstant.getCatogeriesKeyCode;

  int get getSubCatogeriesKeyCode => AppConstant.getSubCatogeriesKeyCode;

  int get getExchagngeRateKeyCode => AppConstant.getExchagngeRateKeyCode;

  @override
  Future<void> init( ) async{

  }

  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(getExchagngeRateKeyCode);
    debugPrint("............closed");
    // add every key in file
    CancelManager.cancel(getSubCatogeriesKeyCode);
    // add every key in file
    CancelManager.cancel(getCatogeriesKeyCode);

    return super.close();
  }

  Future<void> getCatogeriesFunc(BaseRequestBackType requestType) async {
    await CancelManager.runCancelableFun(getCatogeriesKeyCode, (token) async {
      await _service.getcatogeriesServ(
        RequestCallbackObserver<CatogeriesRes, NoParameter>(
          baseRequestBackType: requestType ,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(categoriesEmit: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(categoriesEmit: Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(_current.copyWith(categoriesEmit: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> getSubCatogeriesFunc(
      BaseRequestBackType requestType, {
    required SubCatogeriesInput parameter,
  }) async {

      await _service.getsubcatogeriesServ(
        RequestCallbackObserver<SubCatogeriesData, SubCatogeriesInput>(
          baseRequestBackType: requestType,
           parameter: parameter ,
           onLoadCallback: () =>
              safeEmit(_current.copyWith(subCategoriesEmit: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(subCategoriesEmit: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(subCategoriesEmit: ErrorState(failure)),
          ),
        ),
      );
   }

  Future<void> getExchagngeRateFunc(
      BaseRequestBackType requestType, {
    NoParameter? parameter,
  }) async {
    await CancelManager.runCancelableFun(getExchagngeRateKeyCode, (
      token,
    ) async {
      await _service.getexchagngerateServ(
        RequestCallbackObserver<ExchangeRate, NoParameter>(
          baseRequestBackType: requestType ,
           parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(exchangeRateState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(exchangeRateState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(exchangeRateState: ErrorState(failure)),
          ),
        ),
      );
    });
  }
}
