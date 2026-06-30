import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/catogeries_res/catogeries_res.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_cat_input.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_catogeries_data/sub_catogeries_data.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_state.dart';
import 'package:mkaweel/features/screens/market_prices/service/market_prices_service.dart';

class MarketPricesCubit extends BaseCubit<MarketPricesState> {
  MarketPricesCubit(this._service) : super(MarketPricesInitial());
  final MarketPricesService _service;

  static MarketPricesCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  int get getCatogeriesKeyCode => AppConstant.getCatogeriesKeyCode;

  int get getSubCatogeriesKeyCode => AppConstant.getSubCatogeriesKeyCode;

  init() {
    // TODO: implement init
  }

  @override
  Future<void> close() {
    debugPrint("............closed");
    // add every key in file
    CancelManager.cancel(getSubCatogeriesKeyCode);
    // add every key in file
    CancelManager.cancel(getCatogeriesKeyCode);

    return super.close();
  }

  Future<void> getCatogeriesFunc(RequestTypeBackV2 requestType) async {
    await CancelManager.runCancelableFun(getCatogeriesKeyCode, (token) async {
      await _service.getcatogeriesServ(
        RequestCallbackObserver<CatogeriesRes, NoParameter>(
          baseRequestBackType: requestType.toRequestType(),
          cancelToken: token,
          onLoadCallback: () => safeEmit(CatogeriesResState(Loading())),
          onRightCallback: (data) =>
              safeEmit(CatogeriesResState(Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(CatogeriesResState(ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> getSubCatogeriesFunc(
    RequestTypeBackV2 requestType, {
    required SubCatogeriesInput  parameter,
  }) async {
    await CancelManager.runCancelableFun(getSubCatogeriesKeyCode, (
      token,
    ) async {
      await _service.getsubcatogeriesServ(
        RequestCallbackObserver<SubCatogeriesData, SubCatogeriesInput>(
          baseRequestBackType: requestType.toRequestType(),
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(SubCatogeriesDataState(Loading())),
          onRightCallback: (data) =>
              safeEmit(SubCatogeriesDataState(Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(SubCatogeriesDataState(ErrorState(failure))),
        ),
      );
    });
  }
}
