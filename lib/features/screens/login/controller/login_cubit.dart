import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/features/screens/login/data/model/login_parameters.dart';
import 'package:mkaweel/features/screens/login/data/model/login_res/login_res.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/login/controller/login_state.dart';
import 'package:mkaweel/features/screens/login/service/login_service.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._service) : super(LoginInitial());
  final LoginService _service;

  static LoginCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  @override
  int get loginKeyCode => AppConstant.loginKeyCode;

  @override
  Future<void> init() async {
    // TODO: implement init

  }

  Future<void> login({required LoginParameters  parameter}) async {
    await CancelManager.runCancelableFun(loginKeyCode, (token) async {
      await _service.loginServ(
        RequestCallbackObserver<LoginRes, LoginParameters>(
          baseRequestBackType: Reload(),
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(LoginResState(Loading())),
          onRightCallback: (data) => safeEmit(LoginResState(Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(LoginResState(ErrorState(failure))),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(loginKeyCode);
    return super.close();
  }
}
