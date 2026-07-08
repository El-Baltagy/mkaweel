import 'package:mkaweel/core/base/base_state.dart';

import 'package:flutter/material.dart';

@immutable
abstract class ProjectsState {}

class ProjectsLoaded extends ProjectsState {

  ProjectsLoaded({
    this.deleteProjectResState,
    this.allProjectsResState,
    this.refreshOrInit,
    this.deletingProjectIds = const [],
  });
  final BaseEmit? allProjectsResState,deleteProjectResState;
  final ProjectsState? refreshOrInit;
  final List<String> deletingProjectIds;

  ProjectsLoaded copyWith({
    BaseEmit? deleteProjectResState,
    BaseEmit? allProjectsResState,
    ProjectsState? refreshOrInit,
    List<String>? deletingProjectIds,
  }) {
    return ProjectsLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
        allProjectsResState: allProjectsResState ?? this.allProjectsResState,
        deleteProjectResState: deleteProjectResState ?? this.deleteProjectResState,
        deletingProjectIds: deletingProjectIds ?? this.deletingProjectIds,
    );
  }
}
