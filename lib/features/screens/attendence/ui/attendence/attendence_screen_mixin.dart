part of 'attendence_screen.dart';

abstract class AttendencePageBaseState extends State<AttendencePage> {
  late final AttendenceCubit attendenceCubit;
  late final ProjectsCubit projectsCubit;
    final ValueNotifier<bool> _isCheckedInNotifier=.new(false);

  final ValueNotifier<List<int>> selectedProjectNotifier = ValueNotifier([]);
  final ValueNotifier<List<UIApiKeys<ProjectInfoData>>> projectsList = ValueNotifier([]);
  // tracks whether we have a live checked-in session
  // bool _isCheckedIn = false;

  late final List<(GlobalKey<FormFieldState>, FocusNode?)> listFields =
      List.generate(1, (index) => (GlobalKey<FormFieldState>(), FocusNode()));

  @override
  void initState() {
    attendenceCubit = AttendenceCubit.get(context: context);
    projectsCubit = ProjectsCubit.get(context: context);
    projectsCubit.getAllProjectsFunc(Init(),BaseTypeWorker.instance);
    attendenceCubit.getCurrentAttendenceFunc();
    super.initState();
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

  /// Called every time the projects BlocSelector rebuilds.
  void setDataIntoPJNotifier(BaseEmit? state) {
    if (state is Success<AllProjectsRes> && projectsList.value.isEmpty) {
      final res = state.data as AllProjectsRes;
      Future.microtask(() {
        projectsList.value = res.data
            .map<UIApiKeys<ProjectInfoData>>((e) => UIApiKeys(e.name, e))
            .toList();
        // After list is populated, try to pre-select from attendance response
        _preselectFromAttendance();
      });
    }
  }

  /// Called every time the attendance BlocSelector rebuilds.
  void handleAttendanceState(BaseEmit? state) {
    if (state is! Success<AttendenceRes>) return;
    final data =  state .data!.data;
    _isCheckedInNotifier.value = data.is_checked_in==true && data.current_attendance?.check_out_time == null;
    _preselectFromAttendance();
  }

  void _preselectFromAttendance() {
    if (!_isCheckedInNotifier.value) return;
    if (projectsList.value.isEmpty) return;
    final attendanceState = attendenceCubit.state;
    if (attendanceState is! AttendenceLoaded) return;
    final emit = attendanceState.getCurrentAttendenceState;
    if (emit is! Success<AttendenceRes>) return;
    final projectId = emit.data!.data.current_attendance?.project_id;
    final idx = projectsList.value.indexWhere((e) => e.apiValue.id == projectId);
    if (idx != -1) {
      Future.microtask(() => selectedProjectNotifier.value = [idx]);
    }
  }



  void checkInOutToogle() async{
    if (selectedProjectNotifier.value.isEmpty) {
      await context.showToast('please_select_project'.tr(), isSuccess: false);
      return;
    }
    if(_isCheckedInNotifier.value){
      PrintHelper().ordinaryPrint(".............checkout action");
    }else{
      PrintHelper().ordinaryPrint(".............checkin action");
    }
   await  attendenceCubit.checkInOutToogleFunc(parameter: CheckInOutParameter(
      latLng: LatLng(33.51380000, 36.27650000),
      projectId: _isCheckedInNotifier.value ? null : projectsList.value[selectedProjectNotifier.value.first].apiValue.id,
    ));
  }

  void listenerAttendenceCubit(BuildContext c, AttendenceState state) {
    if (state is AttendenceLoaded) {
      if (state.checkInOutToogleState is Success<DeleteProjectRes>) {
        final res = (state.checkInOutToogleState as Success<DeleteProjectRes>).data!;
        context.showToast(res.message);
        attendenceCubit.getCurrentAttendenceFunc();
      } else if (state.checkInOutToogleState is ErrorState) {
        final err = state.checkInOutToogleState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
 }
