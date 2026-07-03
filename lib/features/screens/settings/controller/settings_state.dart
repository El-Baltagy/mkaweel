import 'package:mkaweel/core/base/base_state.dart';

import 'package:flutter/material.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class LogoutResState extends SettingsState {
  final BaseEmit baseEmit;
  LogoutResState(this.baseEmit);
}

class DeleteAccountResState extends SettingsState {
  final BaseEmit baseEmit;
  DeleteAccountResState(this.baseEmit);
}
