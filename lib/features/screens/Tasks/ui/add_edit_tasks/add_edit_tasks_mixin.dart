part of 'add_edit_tasks_screen.dart';

abstract class AddEditTasksBaseState extends State<AddEditTasksPage> {
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
    projectsCubit.getAllProjectsFunc(Init());
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
    selectedWorkerNotifier.dispose();
    workersList.dispose();
    statusNotifier.dispose();

    for (var element in listFields) {
      element.$2?.dispose();
    }

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
              element.apiValue == widget.args.taskItem!.worker.id.toString(),
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

  void taskListener(BuildContext context, TasksState state) {
    if (state is TasksLoaded) {
      if (state.addUpdateTaskFuncState is Success<DeleteProjectRes>) {
        final DeleteProjectRes data =
            (state.addUpdateTaskFuncState as Success<DeleteProjectRes>).data!;
        if (data.status == 'success') {
          context.showToast(data.message).whenComplete(() => context.pop());
        }
      } else if (state.addUpdateTaskFuncState is ErrorState) {
        final ErrorState f = state.addUpdateTaskFuncState as ErrorState;
        context.showToast(f.failure.message, isSuccess: false);
      }
    }
  }

  Future<void> saveTask() async {
    if (await _key.validateAndScroll(context, listRecorder: listFields)) {
      await tasksCubit.addUpdateTaskFuncFunc(
        parameter: AddEditTaskRequest(
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim(),
          dueDate: _dueDateController.text.trim(),
          taskId: widget.args.taskItem?.id.toString(),
          status: statusChoices[statusNotifier.value.first].apiValue,
          workerId:
              workersList.value[selectedWorkerNotifier.value.first].apiValue,
          projectId: projectsList
              .value[selectedProjectNotifier.value.first]
              .apiValue
              .id
              .toString(),

          projectPhaseId: phaseList
              .value[selectedPhaseNotifier.value.first]
              .apiValue
              .id
              .toString(),
        ),
      );
    }
  }
}
