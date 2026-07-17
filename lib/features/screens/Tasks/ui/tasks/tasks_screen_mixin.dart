part of 'tasks_screen.dart';

abstract class TasksPageBaseState extends State<TasksPage> {
  late final TasksCubit tasksCubit;

  @override
  void initState() {
    tasksCubit = TasksCubit.get(context: context);
    // TODO: implement initState
    super.initState();
    tasksCubit.getTasksFunc(Init());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  void tasksListener(context, state) {
    // TODO: implement listener
  }
}
