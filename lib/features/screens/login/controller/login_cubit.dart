    import 'package:mkaweel/core/constants/app_constant.dart';
 import 'package:mkaweel/core/base/base_state.dart';
 import 'package:mkaweel/core/base/base_service.dart';   
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/main.dart';
import 'login_state.dart';
import 'package:mkaweel/features/screens/login/service/login_service.dart';


class LoginCubit extends BaseCubit<LoginState> {
   LoginCubit(this._service) : super(LoginInitial()) ;
  final LoginService _service;
  
     static LoginCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
  @override
  init() {
    // TODO: implement init
  }

  Future<void> login(String phone, String password) async {

    emit(LoginLoading());
    try {
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 1500));
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
  
}
