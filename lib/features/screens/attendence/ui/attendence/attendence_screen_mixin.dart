part of 'attendence_screen.dart';

abstract class AttendencePageBaseState extends State<AttendencePage> {
  late final AttendenceCubit attendenceCubit;
  late final ProjectsCubit projectsCubit;

  final ValueNotifier<List<int>> selectedProjectNotifier = ValueNotifier([]);
  final ValueNotifier<List<UIApiKeys<ProjectInfoData>>> projectsList = ValueNotifier([]);

  late final List<(GlobalKey<FormFieldState>, FocusNode?)> listFields =
      List.generate(1, (index) => (GlobalKey<FormFieldState>(), FocusNode()));

  @override
  void initState() {
    attendenceCubit = AttendenceCubit.get(context: context);
    projectsCubit = ProjectsCubit.get(context: context);
    super.initState();
    projectsCubit.getAllProjectsFunc(Init());
    attendenceCubit.getCurrentAttendenceFunc( );

  }

  @override
  void dispose() {
    selectedProjectNotifier.dispose();
    projectsList.dispose();
    for (var element in listFields) {
      element.$2?.dispose();
    }
    super.dispose();
  }

  void setDataIntoPJNotifier(BaseEmit? state) {
    if (state is Success && projectsList.value.isEmpty) {
      final cachedValue = state.data as AllProjectsRes;
      Future.microtask(() {
        projectsList.value = cachedValue.data
            .map<UIApiKeys<ProjectInfoData>>((e) => UIApiKeys(e.name, e))
            .toList();
      });
    }
  }

  void checkIn() {
    if (selectedProjectNotifier.value.isEmpty) {
      context.showToast('please_select_project'.tr(), isSuccess: false);
      return;
    }
    final selectedProject = projectsList.value[selectedProjectNotifier.value.first].apiValue;
    context.showToast('Checked in to ${selectedProject.name}');
  }

  void checkOut() {
    if (selectedProjectNotifier.value.isEmpty) {
      context.showToast('please_select_project'.tr(), isSuccess: false);
      return;
    }
    final selectedProject = projectsList.value[selectedProjectNotifier.value.first].apiValue;
    context.showToast('Checked out from ${selectedProject.name}');
  }
}
