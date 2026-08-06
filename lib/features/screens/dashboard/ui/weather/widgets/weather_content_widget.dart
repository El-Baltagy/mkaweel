import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/entrance_fader.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/dummy.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/weather_res/weather_res.dart';
import 'package:mkaweel/features/screens/dashboard/ui/weather/widgets/weather_description_card_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/weather/widgets/weather_details_row_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/weather/widgets/weather_error_widget.dart';
import 'package:mkaweel/features/screens/dashboard/ui/weather/widgets/weather_header_widget.dart';
 import 'package:mkaweel/features/screens/dashboard/ui/weather/widgets/weather_location_card_widget.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/workers/data/model/add_worker_data_request.dart';
import 'package:mkaweel/features/screens/workers/ui/add_workers/widgets/drop_down_role_selector.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Renders the weather content based on the current [BaseEmit] state.
class WeatherContentWidget extends StatelessWidget {
  const WeatherContentWidget({
    super.key,
    required this.state,
    required this.onRetry,
    required this.projectsList,
    required this.selectedNotifier,
    required this.setDataIntoPJNotifier,
  });

  final BaseEmit? state;
  final VoidCallback onRetry;
  final ValueNotifier<List<UIApiKeys<ProjectInfoData>>>? projectsList;
  final ValueNotifier<List<int>>? selectedNotifier;
  final void Function(BaseEmit? state) setDataIntoPJNotifier;

  @override
  Widget build(BuildContext context) {
    // Error state
    if (state is ErrorState) {
      return WeatherErrorWidget(onRetry: onRetry);
    }

    // Loading or success
    final bool isLoading = state is! Success<WeatherRes>;

    // Use dummy data for skeleton loading
    final WeatherRes data = isLoading
        ?  dummyWeatherRes
        : (state as Success<WeatherRes>).data!;

    final weather = data.data.weather;
    final location = data.data.location;

    return EntranceFader(
      dx: context.isLTR ? -32 : 32,
      enableAnimation: !isLoading,
      child: Skeletonizer(
        enabled: isLoading,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          child: Column(
            spacing: 16,
            children: [
              if( projectsList!=null)
              buildProjectSelector(),
              // Hero temperature display
              WeatherHeaderWidget(
                temperature: weather.temperature,
                temperatureUnit: weather.temperature_unit,
                weatherCode: weather.weather_code,
                status: weather.status,
                locationName: location.formatted_address,
              ),

              // Wind speed + condition row
               Padding(
                 padding: const EdgeInsets.only(top: 8.0),
                 child: WeatherDetailsRowWidget(
                  windSpeed: weather.wind_speed,
                  windSpeedUnit: weather.wind_speed_unit,
                  status: weather.status,
                  description: weather.description,
                               ),
               ),

              // Description card
              WeatherDescriptionCardWidget(
                description: weather.description,
              ),

              // Location card
              WeatherLocationCardWidget(
                formattedAddress: location.formatted_address,
                region: location.region,
                subdivision: location.subdivision,
                country: location.country,
              ),
              8.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
  Widget buildProjectSelector() {
    return BlocSelector<ProjectsCubit, ProjectsState, BaseEmit?>(
      selector: (state) => state is ProjectsLoaded?state.allProjectsResState:null,
      builder: (context, state) {
        bool isLoading=state is !Success<AllProjectsRes>;
        setDataIntoPJNotifier(state);
        return Skeletonizer(
          enabled: isLoading,
          child: ValueListenableBuilder(
            valueListenable: projectsList!,
            builder: (context, value, child) {
              return BottomSheetSelector(
                // field: listFields[1],
                isMultiSelect: false,
                title: 'project'.tr(),
                listChoices: value,
                selectedNotifier: selectedNotifier!,
              );
            },
          ),
        );
      },
    );
  }
}


