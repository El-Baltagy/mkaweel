import 'package:mkaweel/core/base/base_state.dart';

import 'package:flutter/material.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

// class LoginLoading extends LoginState {}
//
// class LoginSuccess extends LoginState {}
//
// class LoginError extends LoginState {
//   LoginError(this.message);
//   final String message;
// }

class LoginResState extends LoginState {
  final BaseEmit baseEmit;
  LoginResState(this.baseEmit);
}

class ForgetPasswordLinkState extends LoginState {
  final BaseEmit baseEmit;
  ForgetPasswordLinkState(this.baseEmit);
}
