part of 'Tasks_screen.dart';

abstract class TasksPageBaseState extends State<TasksPage> {
  late final TasksCubit tasksCubit;

  @override
  void initState() {
    tasksCubit = TasksCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
