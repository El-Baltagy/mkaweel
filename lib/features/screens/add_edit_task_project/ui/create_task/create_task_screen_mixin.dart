part of 'create_task_screen.dart';

abstract class CreateTaskPageBaseState extends State<CreateTaskPage> {
  late final AddEditProjectTaskCubit addEditTaskProjectCubit;

  @override
  void initState() {
    addEditTaskProjectCubit = AddEditProjectTaskCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
