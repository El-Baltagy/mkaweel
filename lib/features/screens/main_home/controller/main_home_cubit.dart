import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/login/data/model/login_res/login_res.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/main_home/controller/main_home_state.dart';
import 'package:mkaweel/features/screens/main_home/service/main_home_service.dart';


class MainHomeCubit extends BaseCubit<MainHomeState> {
   MainHomeCubit(this._service) : super(MainHomeLoaded()) ;
  final MainHomeService _service;
  
     static MainHomeCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);



   MainHomeLoaded get _current => state is MainHomeLoaded
       ? state as MainHomeLoaded
       : MainHomeLoaded();

     int get getProfileDataKeyCode => AppConstant.getProfileDataKeyCode;

  @override
   Future<void> init() async {
     // TODO: implement init

   }
  

  Future<void> getProfileDataFunc(BaseRequestBackType baseRequestBackType,{NoParameter? parameter}) async {
    await CancelManager.runCancelableFun(getProfileDataKeyCode, (token) async {
      await _service.getProfileDataServ(
        RequestCallbackObserver<User, NoParameter>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(getProfileDataState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(getProfileDataState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(getProfileDataState: ErrorState(failure))),
        ),
      );
    });
  }
  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(getProfileDataKeyCode);
    return super.close();
  }
}
