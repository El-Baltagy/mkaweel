part of 'workers_cubit.dart';

@immutable
abstract class WorkersState {}




class AllWorkersLoaded extends WorkersState {

  AllWorkersLoaded({
     this.deleteWorkerState,
     this.allWorkersEmit,
     this.deletingWorkersIds= const [],
    this.refreshOrInit, this.addUpdateWorkerState,
   });
  final BaseEmit? allWorkersEmit , addUpdateWorkerState, deleteWorkerState;
  final WorkersState? refreshOrInit;
  final List<String> deletingWorkersIds;
  AllWorkersLoaded copyWith({
    BaseEmit? deleteWorkerState,
    BaseEmit? addUpdateWorkerState,
    BaseEmit? allWorkersEmit,
    WorkersState? refreshOrInit,
      List<String>? deletingWorkersIds
  }) {
    return AllWorkersLoaded(
      deletingWorkersIds: deletingWorkersIds ?? this.deletingWorkersIds,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
      allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
      addUpdateWorkerState: addUpdateWorkerState ?? this.addUpdateWorkerState,
      deleteWorkerState: deleteWorkerState ?? this.deleteWorkerState,
     );
  }
}