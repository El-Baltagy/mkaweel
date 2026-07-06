import 'package:mkaweel/core/base/base_state.dart';

import 'package:flutter/material.dart';

@immutable
abstract class ProjectsState {}




class ProjectsLoaded extends ProjectsState {
  final BaseEmit? allProjectsResState;
  final ProjectsState? refreshOrInit;

  ProjectsLoaded({
    this.allProjectsResState,
    this.refreshOrInit
  });

  ProjectsLoaded copyWith({
    BaseEmit? allProjectsResState,
    ProjectsState? refreshOrInit,
  }) {
    return ProjectsLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
        allProjectsResState: allProjectsResState ?? this.allProjectsResState
    );
  }
}