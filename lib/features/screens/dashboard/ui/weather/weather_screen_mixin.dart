part of 'weather_screen.dart';

abstract class WeatherPageBaseState extends State<WeatherPage> {
  late final DashboardCubit dashboardCubit;
  WeatherParameter? weatherParameter;
  final ValueNotifier<List<int>> selectedProjectNotifier = ValueNotifier([]);
  final ValueNotifier<List<UIApiKeys<ProjectInfoData>>> projectsList = .new([]);
  late final ProjectsCubit projectsCubit;
  @override
  void initState() {
    dashboardCubit = DashboardCubit.get(context: context);
    projectsCubit = ProjectsCubit.get(context: context);
    // TODO: implement initState
    // latLng=widget.args.latlng;
    weatherParameter = widget.args.latlng == null
        ? null
        : WeatherParameter(
            latitude: widget.args.latlng!.lat,
            longitude: widget.args.latlng!.lng,
          );
    super.initState();
    projectsCubit.getAllProjectsFunc(Init(), BaseTypeAdmin.instance);
    dashboardCubit.getWeatherFunc(Init(), parameter: weatherParameter);
  }
  setDataIntoPJNotifier(BaseEmit? state) {
    if (state is Success && projectsList.value.isEmpty) {
      final cachedValue = state.data as AllProjectsRes;
      Future.microtask(() {
        projectsList.value = cachedValue.data
            .where((ee) =>ee.latitude!=null&&ee.longitude!=null )
            .map<UIApiKeys<ProjectInfoData>>((e) => UIApiKeys(e.name, e))
            .toList();

        // Pre-select project & phase for edit mode.
        if (widget.args.projectId != null &&
            selectedProjectNotifier.value.isEmpty) {
          final projectIndex = projectsList.value.indexWhere(
                (element) =>
            element.apiValue.id == widget.args.projectId! ,
          );
          if (projectIndex != -1) {
            selectedProjectNotifier.value = [projectIndex];
          }
        }
      });
      selectedProjectNotifier.addListener(startNotifierForProjectWeather);
    }
  }
  startNotifierForProjectWeather(){
    if (selectedProjectNotifier.value.isNotEmpty) {
      final selectedIndex = selectedProjectNotifier.value.first;
      final selectedProject = projectsList.value[selectedIndex].apiValue;

      dashboardCubit.getWeatherFunc(Init(), parameter: WeatherParameter(
        latitude:double.parse(selectedProject.latitude.toString()) ,
        longitude: double.parse(selectedProject.longitude.toString()),
      ));
    }

  }
  @override
  void dispose() {
    // TODO: implement dispose

    selectedProjectNotifier.removeListener(startNotifierForProjectWeather);
    super.dispose();
  }
}
