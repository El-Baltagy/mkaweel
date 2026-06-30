import 'package:mkaweel/core/base/base_service.dart' show RequestCallbackObserver;
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/features/screens/settings/data/model/logout_res/logout_res.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_state.dart';
import 'package:mkaweel/features/screens/settings/service/settings_service.dart';


class SettingsCubit extends BaseCubit<SettingsState> {
   SettingsCubit(this._service) : super(SettingsInitial()) ;
  final SettingsService _service;
  
     static SettingsCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
       // int get logoutKeyCode => AppConstant.logoutKeyCode;
  init() {
    // TODO: implement init
   
  }
  

  Future<void> logoutFunc(RequestTypeBackV2 requestType, {NoParameter? parameter}) async {
    // await CancelManager.runCancelableFun(logoutKeyCode, (token) async {
      await _service.logoutServ(
        RequestCallbackObserver<LogoutRes, NoParameter>(
          baseRequestBackType: requestType.toRequestType(),
          parameter: parameter ,
          // cancelToken: token,
          onLoadCallback: () => safeEmit(LogoutResState(Loading())),
          onRightCallback: (data) => safeEmit(LogoutResState(Success(data))),
          onLeftCallback: (failure) => safeEmit(LogoutResState(ErrorState(failure))),
        ),
      );
    // });
  }
  @override
  Future<void> close() {
    // add every key in file
    // CancelManager.cancel(logoutKeyCode);
    return super.close();
  }
}
