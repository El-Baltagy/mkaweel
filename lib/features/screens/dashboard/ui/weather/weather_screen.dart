import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/weather_parameter.dart';
import 'package:mkaweel/features/screens/dashboard/ui/weather/widgets/weather_content_widget.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/location_selection.dart';
import 'package:mkaweel/features/screens/settings/data/base_type_worker.dart';
import 'package:mkaweel/features/screens/workers/data/model/add_worker_data_request.dart';

part 'weather_screen_mixin.dart';

@RoutePage()
class WeatherPage extends StatefulWidget implements AutoRouteWrapper {
  const WeatherPage({super.key, required this.args});

  final WeatherRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        if(args.dashboardCubit != null)
    BlocProvider.value(value: args.dashboardCubit!, child: this)
        else
    BlocProvider<DashboardCubit>(create: (context) => AppLocator()()())  ,
        BlocProvider<ProjectsCubit>(create: (context) => AppLocator()()()),
      ],
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
      appBar: CustomAppBar(title: 'weather'.tr()),
      body: BlocSelector<DashboardCubit, DashboardState, BaseEmit?>(
        selector: (state) =>
            state is DashboardLoaded ? state.getWeatherState : null,
        builder: (context, state) {
          return WeatherContentWidget(
            projectsList: widget.args.projectId == null ? null : projectsList,
            selectedNotifier: widget.args.projectId == null
                ? null
                : selectedProjectNotifier,
            setDataIntoPJNotifier: setDataIntoPJNotifier,
            state: state,
            onRetry: () => dashboardCubit.getWeatherFunc(
              Reload(),
              parameter: weatherParameter,
            ),
          );
        },
      ),
    );
  }
}
