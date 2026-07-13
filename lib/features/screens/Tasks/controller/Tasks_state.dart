part of 'Tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksLoaded extends TasksState {

  TasksLoaded({
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit ;
  final TasksState? refreshOrInit;

  TasksLoaded copyWith({
    BaseEmit? allWorkersEmit, 
    TasksState? refreshOrInit,
  }) {
    return TasksLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
