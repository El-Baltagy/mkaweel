part of 'workers_screen.dart';

abstract class WorkersPageBaseState extends State<WorkersPage> {
  late final WorkersCubit workersCubit;
  late final ProjectsCubit projectsCubit;
  late final StreamSubscription<bool> _connectivitySubscription;
  @override
  void initState() {

    super.initState();
    workersCubit = WorkersCubit.get(context: context );
    projectsCubit = ProjectsCubit.get( context: context);
    workersCubit.getWorkersFunc();
    projectsCubit.getAllProjectsFunc(Init(),BaseTypeAdmin.instance);
    _connectivitySubscription =
        ConnectivityService.connectivityStream.listen(_listenIntoInternetChange);
  }
  void _listenIntoInternetChange(bool hasInternet) {
    if (hasInternet) {
      workersCubit.getWorkersFunc();
      projectsCubit.getAllProjectsFunc(Init(),BaseTypeAdmin.instance);
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void listenerWorkersCubit(BuildContext c, WorkersState s) {
    if (s is AllWorkersLoaded) {
      if (s.deleteWorkerState is Success<DeleteProjectRes>) {
        final x = s.deleteWorkerState as Success<DeleteProjectRes>;

        context
            .showToast(x.data!.message);
            // .whenComplete(() => workersCubit.current.deleteWorkerState = null)
      }
      if (s.deleteWorkerState is ErrorState) {
        context
            .showToast(
              (s.deleteWorkerState as ErrorState).failure.message,
              isSuccess: false,
            );
            // .whenComplete(() => workersCubit.current.deleteWorkerState = null)
      }
    }
  }
}
