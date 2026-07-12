import 'package:mkaweel/core/base/base_state.dart';

import 'package:flutter/material.dart';

@immutable
abstract class CreateProjectState {}

class CreateProjectInitial extends CreateProjectState {}

class CreateProjectResState extends CreateProjectState {
  CreateProjectResState(this.baseEmit);
  final BaseEmit baseEmit;
}
