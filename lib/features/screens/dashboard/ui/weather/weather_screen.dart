import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
import 'package:mkaweel/features/screens/dashboard/ui/weather/widgets/weather_content_widget.dart';

part 'weather_screen_mixin.dart';

@RoutePage()
class WeatherPage extends StatefulWidget implements AutoRouteWrapper {
  const WeatherPage({super.key, required this.args});

  final WeatherRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => DashboardCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends WeatherPageBaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocSelector<DashboardCubit, DashboardState, BaseEmit?>(
        selector: (state)=>state is DashboardLoaded ? state.getWeatherState : null,
        builder: (context, state) {
          return WeatherContentWidget(
            state:state,
            onRetry:() =>  dashboardCubit.getWeatherFunc(Reload()),
          );
        },
      ),
    );
  }
}
