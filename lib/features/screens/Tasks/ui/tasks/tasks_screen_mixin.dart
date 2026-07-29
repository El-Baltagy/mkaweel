part of 'tasks_screen.dart';

enum TaskFilter { all, completed, uncompleted }

abstract class TasksPageBaseState extends State<TasksPage> {
  late final TasksCubit tasksCubit;
  final ValueNotifier<TaskFilter> filterNotifier = ValueNotifier(TaskFilter.all);

  @override
  void initState() {
    tasksCubit = TasksCubit.get(context: context);
    // TODO: implement initState
    super.initState();
    tasksCubit.getAllTasksFunc(parameter: widget.args.baseTasksData);
  }

  @override
  void dispose() {
    filterNotifier.dispose();
    super.dispose();
  }
}
