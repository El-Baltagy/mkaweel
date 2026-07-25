part of 'tasks_screen.dart';

abstract class TasksPageBaseState extends State<TasksPage> {
  late final TasksCubit tasksCubit;

  @override
  void initState() {
    tasksCubit = TasksCubit.get(context: context);
    // TODO: implement initState
    super.initState();
    tasksCubit.getTasksFunc(parameter: widget.args.baseTasksData);
  }


  void tasksListener(context, state) {
     if (state is TasksLoaded) {
       if (state.addUpdateTaskFuncState is Success) {
         tasksCubit.getTasksFunc(parameter: widget.args.baseTasksData);
       }
     }
  }
}
