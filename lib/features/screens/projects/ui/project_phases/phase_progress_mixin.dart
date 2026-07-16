part of 'phase_progress_screen.dart';

abstract class PhaseProgressPageBaseState extends State<PhaseProgressPage> {
  /// Convenient getter for the route arguments passed to this page.
  PhaseProgressRouteArgs get args => widget.args;
  late final ProjectsCubit projectsCubit;
  final _key = GlobalKey<FormState>();
  final TextEditingController _updateDateController = TextEditingController();
  final TextEditingController _controllerDesc = TextEditingController();
  final TextEditingController _controllerPS = TextEditingController();
  final TextEditingController _controllerPE = TextEditingController();
  final TextEditingController _controllerAS = TextEditingController();
  final TextEditingController _controllerAE = TextEditingController();
  final ValueNotifier<double> progressValue = .new(0.0);

  List<(GlobalKey<FormFieldState<dynamic>>, FocusNode?)> listFiels =
      List.generate(1, (index) => (.new(), .new()));

  ValueNotifier<List<File>> imagesListNotifier = .new([]);

  @override
  void initState() {
    projectsCubit = ProjectsCubit.get(context: context);
    super.initState();
    _updateDateController.text = DateTimeHelper.convertDateIntoCustomString(
      DateTime.now(),
    )!;

    _controllerDesc.text = args.projectPhaseItem.notes ?? '';
    progressValue.value = args.projectPhaseItem.progress_percentage.toDouble();

    _controllerPS.text = args.projectPhaseItem.planned_start_date ?? '';
    _controllerPE.text = args.projectPhaseItem.planned_end_date ?? '';
    _controllerAS.text = args.projectPhaseItem.actual_start_date ?? '';
    _controllerAE.text = args.projectPhaseItem.actual_end_date ?? '';
  }

  @override
  void dispose() {
    _controllerDesc.dispose();
    _controllerPS.dispose();
    _controllerPE.dispose();
    _controllerAS.dispose();
    _controllerAE.dispose();
    _updateDateController.dispose();
    imagesListNotifier.dispose();
    progressValue.dispose();
    for (var element in listFiels) {
      element.$2?.dispose();
    }

    super.dispose();
  }

  void listener(BuildContext context, ProjectsState state) {
    // TODO: implement listener
  }

  updateAction() async {
    if (await _key.validateAndScroll(context, listRecorder: listFiels)) {
      await projectsCubit.updatePhaseFunc(

          parameter: .new(
          phaseId: args.projectPhaseItem.id,
          progressPercentage: progressValue.value.toString(),
          updateDate: _updateDateController.text.trim(),

           notes:_controllerDesc.text.trim(),

          plannedStartDate: _controllerPS.text.trim(),
          plannedEndDate: _controllerPE.text.trim(),

          actualStartDate: _controllerAS.text.trim(),
          actualEndDate: _controllerAE.text.trim(),
          photos: imagesListNotifier.value,
        ),
      );
    }
  }
}
