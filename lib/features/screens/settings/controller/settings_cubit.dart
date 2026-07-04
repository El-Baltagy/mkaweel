import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_service.dart' show RequestCallbackObserver;
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/features/screens/settings/data/model/delete_account_res/delete_account_res.dart';
import 'package:mkaweel/features/screens/settings/data/model/logout_res/logout_res.dart';
import 'package:mkaweel/features/screens/settings/data/model/update_profile_parameters.dart';
import 'package:mkaweel/features/screens/settings/data/model/update_profile_res/update_profile_res.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_state.dart';
import 'package:mkaweel/features/screens/settings/service/settings_service.dart';


class SettingsCubit extends BaseCubit<SettingsState> {
   SettingsCubit(this._service) : super(SettingsInitial()) ;
  final SettingsService _service;
  
     static SettingsCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
       int get logoutKeyCode => AppConstant.logoutKeyCode;

  int get deleteAccountKeyCode => AppConstant.deleteAccountKeyCode;
   int get updateProfileKeyCode => AppConstant.updateProfileKeyCode;
  init() async {
     // TODO: implement init

   }
  

  Future<void> logoutFunc(  {NoParameter? parameter}) async {
    await CancelManager.runCancelableFun(logoutKeyCode, (token) async {
      await _service.logoutServ(
        RequestCallbackObserver<LogoutRes, NoParameter>(
          baseRequestBackType: Reload() ,
          parameter: parameter ,
          cancelToken: token,
          onLoadCallback: () => safeEmit(LogoutResState(Loading())),
          onRightCallback: (data) => safeEmit(LogoutResState(Success(data))),
          onLeftCallback: (failure) => safeEmit(LogoutResState(ErrorState(failure))),
        ),
      );
    });
  }


  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(updateProfileKeyCode);
    // add every key in file
    CancelManager.cancel(deleteAccountKeyCode);
    // add every key in file
    CancelManager.cancel(logoutKeyCode);
    return super.close();
  }

  Future<void> deleteAccountFunc(  {NoParameter? parameter}) async {
    await CancelManager.runCancelableFun(deleteAccountKeyCode, (token) async {
      await _service.deleteAccountServ(
        RequestCallbackObserver<DeleteAccountRes, NoParameter>(
          baseRequestBackType:  Reload() ,
          parameter: parameter ,
          cancelToken: token,
          onLoadCallback: () => safeEmit(DeleteAccountResState(Loading())),
          onRightCallback: (data) => safeEmit(DeleteAccountResState(Success(data))),
          onLeftCallback: (failure) => safeEmit(DeleteAccountResState(ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> updateProfileFunc(  {UpdateProfileParameters? parameter}) async {
    await CancelManager.runCancelableFun(updateProfileKeyCode, (token) async {
      await _service.updateprofileServ(
        RequestCallbackObserver<UpdateProfileRes, UpdateProfileParameters>(
          baseRequestBackType: Reload(),
          parameter: parameter ,
          cancelToken: token,
          onLoadCallback: () => safeEmit(UpdateProfileResState(Loading())),
          onRightCallback: (data) => safeEmit(UpdateProfileResState(Success(data))),
          onLeftCallback: (failure) => safeEmit(UpdateProfileResState(ErrorState(failure))),
        ),
      );
    });
  }
}
