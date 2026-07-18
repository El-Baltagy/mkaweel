part of 'weather_screen.dart';

abstract class WeatherPageBaseState extends State<WeatherPage> {
  late final DashboardCubit dashboardCubit;

  @override
  void initState() {
    dashboardCubit = DashboardCubit.get(context: context);
    // TODO: implement initState
    super.initState();
    dashboardCubit.getWeatherFunc(Init());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
