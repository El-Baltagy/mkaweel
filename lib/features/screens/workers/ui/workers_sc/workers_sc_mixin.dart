part of 'workers_screen.dart';
abstract class WorkersPageBaseState extends State<WorkersPage> {
  late final WorkersCubit workersCubit;

  @override
  void initState() {
    super.initState();
    workersCubit = WorkersCubit.get(context: context);
    loadData();
  }
  Future<void> loadData() async {
    await  workersCubit.getWorkersFunc();
  }
  @override
  void dispose() {
    super.dispose();
  }
}