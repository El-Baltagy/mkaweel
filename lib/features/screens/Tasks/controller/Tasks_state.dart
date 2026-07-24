part of 'Tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksLoaded extends TasksState {

  TasksLoaded({
    this.addUpdateTaskFuncState,
    this.deleteTaskState,
    this.getTasksState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , getTasksState, deleteTaskState, addUpdateTaskFuncState;
  final TasksState? refreshOrInit;

  TasksLoaded copyWith({
    BaseEmit? addUpdateTaskFuncState,
    BaseEmit? deleteTaskState,
    BaseEmit? getTasksState,
    BaseEmit? allWorkersEmit, 
    TasksState? refreshOrInit,
  }) {
    return TasksLoaded(
      addUpdateTaskFuncState: addUpdateTaskFuncState ?? this.addUpdateTaskFuncState,
      deleteTaskState: deleteTaskState ?? this.deleteTaskState,
      getTasksState: getTasksState ?? this.getTasksState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
