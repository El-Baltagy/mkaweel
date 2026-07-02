import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/features/screens/waste_calculator/data/model/waste_calc_paremeter.dart';
import 'package:mkaweel/features/screens/waste_calculator/data/model/waste_calc_res/waste_calc_res.dart';
import 'package:mkaweel/features/screens/waste_calculator/service/waste_calculator_service.dart';
 part 'waste_calculator_state.dart';

class WasteCalculatorCubit extends BaseCubit<WasteCalculatorState> {
  WasteCalculatorCubit(this._service) : super(  WasteCalculatorLoaded());
  final WasteCalculatorService _service;

  static WasteCalculatorCubit get({required BuildContext context}) => BlocProvider.of(context);



  WasteCalculatorLoaded get _current => state is WasteCalculatorLoaded
      ? state as WasteCalculatorLoaded
      : WasteCalculatorLoaded();

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
