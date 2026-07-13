import 'package:mkaweel/core/base/base_state.dart';

import 'package:flutter/material.dart';

@immutable
abstract class ProjectsState {}

class ProjectsLoaded extends ProjectsState {

  ProjectsLoaded({
    this.getProjectPhasesState,
    this.deleteProjectResState,
    this.allProjectsResState,
    this.createProjectResState,
    this.refreshOrInit,
    this.deletingProjectIds = const [],
  });
  final BaseEmit? allProjectsResState,deleteProjectResState,createProjectResState, getProjectPhasesState;
  final ProjectsState? refreshOrInit;
  final List<String> deletingProjectIds;

  ProjectsLoaded copyWith({
    BaseEmit? getProjectPhasesState,
    BaseEmit? deleteProjectResState,
    BaseEmit? allProjectsResState,
    BaseEmit? createProjectResState,
    ProjectsState? refreshOrInit,
    List<String>? deletingProjectIds,
  }) {
    return ProjectsLoaded(
      getProjectPhasesState: getProjectPhasesState ?? this.getProjectPhasesState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
        allProjectsResState: allProjectsResState ?? this.allProjectsResState,
      createProjectResState: createProjectResState ?? this.createProjectResState,
        deleteProjectResState: deleteProjectResState ?? this.deleteProjectResState,
        deletingProjectIds: deletingProjectIds ?? this.deletingProjectIds,
    );
  }
}
