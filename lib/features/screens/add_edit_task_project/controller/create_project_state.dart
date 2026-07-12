import 'package:mkaweel/core/base/base_state.dart';

import 'package:flutter/material.dart';

@immutable
abstract class AddEditProjectTaskState {}

class CreateProjectInitial extends AddEditProjectTaskState {}

class CreateProjectResState extends AddEditProjectTaskState {
  CreateProjectResState(this.baseEmit);
  final BaseEmit baseEmit;
}
