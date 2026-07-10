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

  void   listenerWorkersCubit(BuildContext c, WorkersState s){
    if(s is AllWorkersLoaded ){
      if(s.deleteWorkerState is Success<DeleteProjectRes?>){
        final x=s.deleteWorkerState as Success<DeleteProjectRes?>;
         context.showToast( x.data?.message );
      }
      if(s.deleteWorkerState is ErrorState){
        context.showToast( (s.deleteWorkerState as ErrorState ) .failure.message,isSuccess: false);
      }
    }
  }
}