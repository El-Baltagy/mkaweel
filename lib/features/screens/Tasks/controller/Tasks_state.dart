part of 'Tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksLoaded extends TasksState {

  TasksLoaded({
    this.getTasksState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , getTasksState;
  final TasksState? refreshOrInit;

  TasksLoaded copyWith({
    BaseEmit? getTasksState,
    BaseEmit? allWorkersEmit, 
    TasksState? refreshOrInit,
  }) {
    return TasksLoaded(
      getTasksState: getTasksState ?? this.getTasksState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
