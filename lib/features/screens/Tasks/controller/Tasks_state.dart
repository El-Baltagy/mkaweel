part of 'Tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksLoaded extends TasksState {

  TasksLoaded({
    this.workerMarkTaskCompleteState,
    this.addUpdateTaskFuncState,
    this.deleteTaskState,
    this.getTasksState,
      this.homeTasksState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , homeTasksState, getTasksState, deleteTaskState, addUpdateTaskFuncState, workerMarkTaskCompleteState;
  final TasksState? refreshOrInit;

  TasksLoaded copyWith({
    BaseEmit? workerMarkTaskCompleteState,
    BaseEmit? addUpdateTaskFuncState,
    BaseEmit? deleteTaskState,
    BaseEmit? getTasksState,
     BaseEmit? homeTasksState,
    BaseEmit? allWorkersEmit,
    TasksState? refreshOrInit,
  }) {
    return TasksLoaded(
      workerMarkTaskCompleteState: workerMarkTaskCompleteState ?? this.workerMarkTaskCompleteState,
      addUpdateTaskFuncState: addUpdateTaskFuncState ?? this.addUpdateTaskFuncState,
      deleteTaskState: deleteTaskState ?? this.deleteTaskState,
      getTasksState: getTasksState ?? this.getTasksState,
       homeTasksState: homeTasksState ?? this.homeTasksState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
