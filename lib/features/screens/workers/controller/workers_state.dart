part of 'workers_cubit.dart';

@immutable
abstract class WorkersState {}




class AllWorkersLoaded extends WorkersState {

  AllWorkersLoaded({
     this.deleteWorkerState,
     this.allWorkersEmit,
     this.deletingWorkersIds= const [],
    this.refreshOrInit, this.addWorkerState,
   });
  final BaseEmit? allWorkersEmit , addWorkerState, deleteWorkerState;
  final WorkersState? refreshOrInit;
  final List<String> deletingWorkersIds;
  AllWorkersLoaded copyWith({
    BaseEmit? deleteWorkerState,
    BaseEmit? addWorkerState,
    BaseEmit? allWorkersEmit,
    WorkersState? refreshOrInit,
      List<String>? deletingWorkersIds
  }) {
    return AllWorkersLoaded(
      deletingWorkersIds: deletingWorkersIds ?? this.deletingWorkersIds,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
      allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
      addWorkerState: addWorkerState ?? this.addWorkerState,
      deleteWorkerState: deleteWorkerState ?? this.deleteWorkerState,
     );
  }
}