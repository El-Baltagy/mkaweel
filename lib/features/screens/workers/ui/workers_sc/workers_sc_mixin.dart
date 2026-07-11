part of 'workers_screen.dart';

abstract class WorkersPageBaseState extends State<WorkersPage> {
  late final WorkersCubit workersCubit;
  late final ProjectsCubit projectsCubit;

  @override
  void initState() {
    super.initState();
    workersCubit = WorkersCubit.get(context: context);
    projectsCubit = ProjectsCubit.get(context: context);

  }


  @override
  void dispose() {
    super.dispose();
  }

  void listenerWorkersCubit(BuildContext c, WorkersState s) {
    if (s is AllWorkersLoaded) {
      if (s.deleteWorkerState is Success<DeleteProjectRes>) {
        final x = s.deleteWorkerState as Success<DeleteProjectRes>;

        context
            .showToast(x.data!.message)
            .whenComplete(() => workersCubit.current.deleteWorkerState = null);
      }
      if (s.deleteWorkerState is ErrorState) {
        context
            .showToast(
              (s.deleteWorkerState as ErrorState).failure.message,
              isSuccess: false,
            )
            .whenComplete(() => workersCubit.current.deleteWorkerState = null);
      }
    }
  }
}
