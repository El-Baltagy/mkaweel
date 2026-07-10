import 'package:mkaweel/features/screens/make_bus/data/model/get_all_data/get_all_data_req_param.dart';
import 'package:mkaweel/features/screens/make_bus/data/model/get_all_data/get_all_data.dart';
import 'package:mkaweel/features/screens/make_bus/controller/make_bus_state.dart';
import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
    import 'package:mkaweel/core/constants/app_constant.dart';
 import 'package:mkaweel/core/base/base_state.dart';
 import 'package:mkaweel/core/base/base_service.dart';   
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/make_bus/service/make_bus_service.dart';
part 'make_bus_state.dart';

class MakeBusCubit extends BaseCubit<MakeBusState> {
   MakeBusCubit(this._service) : super(MakeBusLoaded()) ;
  final MakeBusService _service;
  
     static MakeBusCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
    // Always holds the latest combined state — used by copyWith
   MakeBusLoaded get _current => state is MakeBusLoaded
       ? state as MakeBusLoaded
       : MakeBusLoaded();
       
    Future<void>   int get getAllDataKeyCode => AppConstant.getAllDataKeyCode;
  init() async {
     // TODO: implement init

   }
  

  Future<void> getAllDataFunc({NoParameter? parameter}) async {
    await CancelManager.runCancelableFun(getAllDataKeyCode, (token) async {
      await _service.getAllDataServ(
        RequestCallbackObserver<CatogeriesRes, NoParameter>(
          baseRequestBackType: Reload(),
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(getAllDataState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(getAllDataState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(getAllDataState: ErrorState(failure))),
        ),
      );
    });
  }
  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(getAllDataKeyCode);
    return super.close();
  }
}
