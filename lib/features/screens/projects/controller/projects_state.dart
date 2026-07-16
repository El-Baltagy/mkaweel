import 'package:mkaweel/core/base/base_state.dart';

import 'package:flutter/material.dart';

@immutable
abstract class ProjectsState {}

class ProjectsLoaded extends ProjectsState {

  ProjectsLoaded({
    this.updatePhaseState,
    this.getProjectPhasesState,
    this.deleteProjectResState,
    this.allProjectsResState,
    this.createProjectResState,
    this.refreshOrInit,
    this.deletingProjectIds = const [],
  });
  final BaseEmit? allProjectsResState,deleteProjectResState,createProjectResState, getProjectPhasesState, updatePhaseState;
  final ProjectsState? refreshOrInit;
  final List<String> deletingProjectIds;

  ProjectsLoaded copyWith({
    BaseEmit? updatePhaseState,
    BaseEmit? getProjectPhasesState,
    BaseEmit? deleteProjectResState,
    BaseEmit? allProjectsResState,
    BaseEmit? createProjectResState,
    ProjectsState? refreshOrInit,
    List<String>? deletingProjectIds,
  }) {
    return ProjectsLoaded(
      updatePhaseState: updatePhaseState ?? this.updatePhaseState,
      getProjectPhasesState: getProjectPhasesState ?? this.getProjectPhasesState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
        allProjectsResState: allProjectsResState ?? this.allProjectsResState,
      createProjectResState: createProjectResState ?? this.createProjectResState,
        deleteProjectResState: deleteProjectResState ?? this.deleteProjectResState,
        deletingProjectIds: deletingProjectIds ?? this.deletingProjectIds,
    );
  }
}
