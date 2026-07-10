part of 'workers_cubit.dart';

@immutable
abstract class WorkersState {}




class AllWorkersLoaded extends WorkersState {

  AllWorkersLoaded({
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit ;
  final WorkersState? refreshOrInit;

  AllWorkersLoaded copyWith({
    BaseEmit? allWorkersEmit,
    WorkersState? refreshOrInit,
  }) {
    return AllWorkersLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}