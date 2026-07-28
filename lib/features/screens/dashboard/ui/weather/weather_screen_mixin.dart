part of 'weather_screen.dart';

abstract class WeatherPageBaseState extends State<WeatherPage> {
  late final DashboardCubit dashboardCubit;
  WeatherParameter? weatherParameter;

  @override
  void initState() {
    dashboardCubit = DashboardCubit.get(context: context);
    // TODO: implement initState
    // latLng=widget.args.latlng;
    weatherParameter = widget.args.latlng == null
        ? null
        : WeatherParameter(
            latitude: widget.args.latlng!.lat,
            longitude: widget.args.latlng!.lng,
          );
    super.initState();

    dashboardCubit.getWeatherFunc(Init(), parameter: weatherParameter);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
