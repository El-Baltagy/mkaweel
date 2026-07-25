part of 'Tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksLoaded extends TasksState {

  TasksLoaded({
    this.workerMarkTaskCompleteState,
    this.addUpdateTaskFuncState,
    this.deleteTaskState,
    this.getTasksState,
      this.todayTasksState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , todayTasksState, getTasksState, deleteTaskState, addUpdateTaskFuncState, workerMarkTaskCompleteState;
  final TasksState? refreshOrInit;

  TasksLoaded copyWith({
    BaseEmit? workerMarkTaskCompleteState,
    BaseEmit? addUpdateTaskFuncState,
    BaseEmit? deleteTaskState,
    BaseEmit? getTasksState,
     BaseEmit? todayTasksState,
    BaseEmit? allWorkersEmit,
    TasksState? refreshOrInit,
  }) {
    return TasksLoaded(
      workerMarkTaskCompleteState: workerMarkTaskCompleteState ?? this.workerMarkTaskCompleteState,
      addUpdateTaskFuncState: addUpdateTaskFuncState ?? this.addUpdateTaskFuncState,
      deleteTaskState: deleteTaskState ?? this.deleteTaskState,
      getTasksState: getTasksState ?? this.getTasksState,
      todayTasksState: todayTasksState ?? this.todayTasksState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
