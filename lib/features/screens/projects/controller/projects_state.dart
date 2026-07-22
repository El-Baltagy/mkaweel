import 'package:mkaweel/core/base/base_state.dart';

import 'package:flutter/material.dart';

@immutable
abstract class ProjectsState {}

class ProjectsLoaded extends ProjectsState {

  ProjectsLoaded({
    this.deleteTaskState,
    this.getProjectInvoicesState,
    this.updatePhaseState,
    this.getProjectPhasesState,
    this.deleteProjectResState,
    this.allProjectsResState,
    this.createProjectResState,
    this.refreshOrInit,
    this.deletingProjectIds = const [],
    this.getPjPhaseUpdateState,
  });
  final BaseEmit? allProjectsResState,deleteProjectResState,createProjectResState, getProjectPhasesState, updatePhaseState, getPjPhaseUpdateState, getProjectInvoicesState, deleteTaskState;
  final ProjectsState? refreshOrInit;
  final List<String> deletingProjectIds;

  ProjectsLoaded copyWith({
    BaseEmit? deleteTaskState,
    BaseEmit? getProjectInvoicesState,
    BaseEmit? updatePhaseState,
    BaseEmit? getProjectPhasesState,
    BaseEmit? deleteProjectResState,
    BaseEmit? allProjectsResState,
    BaseEmit? createProjectResState,
    ProjectsState? refreshOrInit,
    List<String>? deletingProjectIds,
    BaseEmit? getPjPhaseUpdateState,
  }) {
    return ProjectsLoaded(
      deleteTaskState: deleteTaskState ?? this.deleteTaskState,
      getProjectInvoicesState: getProjectInvoicesState ?? this.getProjectInvoicesState,
      updatePhaseState: updatePhaseState ?? this.updatePhaseState,
      getProjectPhasesState: getProjectPhasesState ?? this.getProjectPhasesState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
        allProjectsResState: allProjectsResState ?? this.allProjectsResState,
      createProjectResState: createProjectResState ?? this.createProjectResState,
        deleteProjectResState: deleteProjectResState ?? this.deleteProjectResState,
        deletingProjectIds: deletingProjectIds ?? this.deletingProjectIds,
        getPjPhaseUpdateState: getPjPhaseUpdateState ?? this.getPjPhaseUpdateState,
    );
  }
}
