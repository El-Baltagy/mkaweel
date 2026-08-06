part of 'add_edit_tasks_screen.dart';

abstract class AddEditTasksBaseState extends State<AddEditTasksPage> {
  bool isEditMode() => (widget.args.taskItem?.id ?? -1) > 0;
  bool isThisCashRequest() =>(widget.args.taskItem?.id??-1) < 0  ;
  final List<UIApiKeys<String>> statusChoices = [
    UIApiKeys('pending_status'.tr(), 'Pending'),
    UIApiKeys('in_progress_status'.tr(), 'in_progress'),
    UIApiKeys('completed_status'.tr(), 'completed'),
  ];
  late final TasksCubit tasksCubit;
  late final WorkersCubit workersCubit;
  late final ProjectsCubit projectsCubit;

  // Controllers
  final TextEditingController _nameController = .new();
  final TextEditingController _dueDateController = .new();
  final TextEditingController _descriptionController = .new();

  // Notifiers for selectors
  final ValueNotifier<List<int>> selectedProjectNotifier = ValueNotifier([]);
  final ValueNotifier<List<UIApiKeys<ProjectInfoData>>> projectsList = .new([]);

  final ValueNotifier<List<int>> selectedPhaseNotifier = ValueNotifier([]);
  final ValueNotifier<List<UIApiKeys<ProjectphaseItem>>> phaseList = .new([]);

  final ValueNotifier<List<int>> selectedWorkerNotifier = ValueNotifier([]);
  final ValueNotifier<List<UIApiKeys<String>>> workersList = .new([]);

  final ValueNotifier<List<int>> statusNotifier = ValueNotifier([]);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  // Focus and Field Keys
  late final List<(GlobalKey<FormFieldState>, FocusNode?)> listFields =
      List.generate(7, (index) => (GlobalKey<FormFieldState>(), FocusNode()));

   ValueNotifier<bool> hasInternetNotifier = ValueNotifier<bool>(true);
  StreamSubscription<bool>? _connectivitySubscription;

  @override
  void initState() {
    tasksCubit = widget.args.tasksCubit;
    workersCubit = WorkersCubit.get(context: context);
    projectsCubit = ProjectsCubit.get(context: context);
    super.initState();
    _nameController.text = widget.args.taskItem?.name ?? '';
    _dueDateController.text = widget.args.taskItem?.due_date ?? '';
    _descriptionController.text = widget.args.taskItem?.description ?? '';

    if (widget.args.taskItem != null) {
      final statusIndex = statusChoices.indexWhere(
        (element) => element.apiValue == widget.args.taskItem!.status,
      );
      if (statusIndex != -1) {
        statusNotifier.value = [statusIndex];
      }
    }
    workersCubit.getWorkersFunc();

    selectedProjectNotifier.addListener(_onProjectChanged);
    projectsCubit.getAllProjectsFunc(Init(), BaseTypeAdmin.instance);

    _connectivitySubscription = ConnectivityService.connectivityStream.listen((
      connected,
    ) {
      hasInternetNotifier.value=connected;
    });
  }

  @override
  void dispose() {
    selectedProjectNotifier.removeListener(_onProjectChanged);
    _nameController.dispose();
    _dueDateController.dispose();
    _descriptionController.dispose();
    selectedProjectNotifier.dispose();
    projectsList.dispose();
    selectedPhaseNotifier.dispose();
    phaseList.dispose();
    hasInternetNotifier.dispose();
    selectedWorkerNotifier.dispose();
    workersList.dispose();
    statusNotifier.dispose();

    for (var element in listFields) {
      element.$2?.dispose();
    }

    _connectivitySubscription?.cancel();
    super.dispose();
  }

  setDataIntoWorkerNotifier(BaseEmit? state) {
    if (state is Success<AllWorkers>) {
      AllWorkers? res = state.data as AllWorkers;
      workersList.value = res.data
          .map((e) => UIApiKeys(e.name, e.id.toString()))
          .toList();

      // Pre-select worker for edit mode.
      if (widget.args.taskItem != null) {
        final workerIndex = workersList.value.indexWhere(
          (element) =>
              element.apiValue == widget.args.taskItem!.worker?.id.toString(),
        );
        if (workerIndex != -1) {
          selectedWorkerNotifier.value = [workerIndex];
        }
      }
    }
  }

  setDataIntoPJNotifier(BaseEmit? state) {
    if (state is Success && projectsList.value.isEmpty) {
      final cachedValue = state.data as AllProjectsRes;
      Future.microtask(() {
        projectsList.value = cachedValue.data
            .map<UIApiKeys<ProjectInfoData>>((e) => UIApiKeys(e.name, e))
            .toList();

        // Pre-select project & phase for edit mode.
        if (widget.args.taskItem != null &&
            selectedProjectNotifier.value.isEmpty) {
          final projectIndex = projectsList.value.indexWhere(
            (element) =>
                element.apiValue.id == widget.args.taskItem!.project.id,
          );
          if (projectIndex != -1) {
            selectedProjectNotifier.value = [projectIndex];
          }
        }
      });
    }
  }

  setDataIntoPhaseNotifier(BaseEmit? state) {
    if (state is Success) {
      final cachedValue = state.data as ProjectPhasesRes;
      phaseList.value = cachedValue.data
          .map<UIApiKeys<ProjectphaseItem>>((e) => UIApiKeys(e.name, e))
          .toList();

      final projectIndex = phaseList.value.indexWhere(
        (element) =>
            element.apiValue.id == widget.args.taskItem?.project_phase?.id,
      );
      if (projectIndex != -1) {
        selectedPhaseNotifier.value = [projectIndex];
      }
    }
  }

  /// Updates [phaseList] with the phases of the currently selected project
  /// and clears any previously selected phase.
  void _onProjectChanged() {
    selectedPhaseNotifier.value = [];
    projectsCubit.getProjectPhasesFunc(
      parameter: GetProjectDataParameter(
        projectsList.value[selectedProjectNotifier.value.first].apiValue.id
            .toString(),
      ),
    );
  }

  Future<void> taskListener(BuildContext context, TasksState state) async {
    if (state is TasksLoaded) {
      if (state.addUpdateTaskFuncState is Success<DeleteProjectRes>) {
        final DeleteProjectRes data =
            (state.addUpdateTaskFuncState as Success<DeleteProjectRes>).data!;
        if (data.status == 'success') {
          await context.showToast(data.message);

          if (widget.args.taskItem != null && widget.args.taskItem!.id < 0) {
            final raw = HiveStorage().readData<List<dynamic>>('offline_task_requests');
            final offlineRequests = raw?.map((e) => e.toString()).toList() ?? [];
            final idToRemove = widget.args.taskItem!.id.toString();
            PrintHelper().ordinaryPrint( '..............eeeeeeeeeee}');
            PrintHelper().ordinaryPrint( '$idToRemove\n${offlineRequests.toString()}');
            offlineRequests.removeWhere((req) {
              final map = jsonDecode(req) as Map<String, dynamic>;
              return map['task_id'] == idToRemove;
            });
            if (offlineRequests.isEmpty) {
              await HiveStorage().deleteData('offline_task_requests');
            } else {
              await HiveStorage().writeData('offline_task_requests', offlineRequests);
            }
          }

        if(context.mounted)  await context.pop();
          await tasksCubit.getAllTasksFunc(
            parameter: const AdminTasksData(AdminTaskType.today),
          );
          bool isToday =
              widget.args.baseTasksData is AdminTasksData &&
              (widget.args.baseTasksData as AdminTasksData).type ==
                  AdminTaskType.today;
          if (!isToday) {
            await tasksCubit.getAllTasksFunc(parameter: widget.args.baseTasksData);
          }
        }
      } else if (state.addUpdateTaskFuncState is ErrorState) {
        final ErrorState f = state.addUpdateTaskFuncState as ErrorState;
        await context.showToast(f.failure.message, isSuccess: false);
      }
    }
  }

  Future<void> saveTask(BuildContext context) async {
    if (await _key.validateAndScroll(context, listRecorder: listFields)) {
      AddEditTaskRequest request = AddEditTaskRequest(
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim(),
        dueDate: _dueDateController.text.trim(),
        taskId: (widget.args.taskItem != null && widget.args.taskItem!.id < 0)
            ? null
            : widget.args.taskItem?.id.toString(),
        status: statusChoices.first.apiValue,
        workerId: selectedWorkerNotifier.value.isNotEmpty
            ? workersList.value[selectedWorkerNotifier.value.first].apiValue
            : null,
        projectId: selectedProjectNotifier.value.isNotEmpty
            ? projectsList
                  .value[selectedProjectNotifier.value.first]
                  .apiValue
                  .id
                  .toString()
            : null,
        projectPhaseId: selectedPhaseNotifier.value.isNotEmpty
            ? phaseList.value[selectedPhaseNotifier.value.first].apiValue.id
                  .toString()
            : null,
      );

      if (!hasInternetNotifier.value&&!isEditMode()) {
        final offlineRequests =
            (HiveStorage().readData<List<dynamic>>('offline_task_requests') ?? [])
                .map((e) => e.toString())
                .toList();
        final cacheId =
            // (widget.args.taskItem != null && widget.args.taskItem!.id < 0)
            // ? widget.args.taskItem!.id.toString()
            // :
    '${-(DateTime.now().millisecondsSinceEpoch.remainder(100000))}';

        final cachedRequest = AddEditTaskRequest(
          name: request.name,
          description: request.description,
          dueDate: request.dueDate,
          taskId: cacheId,
          status: request.status,
          workerId: request.workerId,
          projectId: request.projectId,
          projectPhaseId: request.projectPhaseId,
        );

        // Remove old entry if editing existing offline task
        offlineRequests.removeWhere((req) {
          final map = jsonDecode(req) as Map<String, dynamic>;
          return map['task_id'] == cacheId;
        });

        offlineRequests.add(jsonEncode(cachedRequest.toJson()));
        await HiveStorage().writeData('offline_task_requests', offlineRequests);
        if (context.mounted) await context.showToast('task_saved_offline'.tr());
        if (context.mounted) await context.pop();
        return;
      }

      await tasksCubit.addUpdateTaskFuncFunc(
        parameter: request
          ..taskId = isEditMode()?
              widget.args.taskItem?.id.toString()
              :null
      );

     
    }
  }
}
