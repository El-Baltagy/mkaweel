import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/features/screens/attendence/controller/attendence_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/workers/data/model/add_worker_data_request.dart';
import 'package:mkaweel/features/screens/workers/ui/add_workers/widgets/drop_down_role_selector.dart';
import 'package:skeletonizer/skeletonizer.dart';
part 'attendence_screen_mixin.dart';

@RoutePage()
class AttendencePage extends StatefulWidget implements AutoRouteWrapper {
  const AttendencePage({super.key, required this.args});
  final AttendenceRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AttendenceCubit>(
          create: (context) => AppLocator()()(),
        ),
        BlocProvider<ProjectsCubit>(
          create: (context) => AppLocator()()(),
        ),
      ],
      child: this,
    );
  }

  @override
  State<AttendencePage> createState() => _AttendencePageState();
}

class _AttendencePageState extends AttendencePageBaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocSelector<ProjectsCubit, ProjectsState, BaseEmit?>(
              selector: (state) => state is ProjectsLoaded ? state.allProjectsResState : null,
              builder: (context, state) {
                bool isLoading = state is! Success<AllProjectsRes>;
                setDataIntoPJNotifier(state);
                return Skeletonizer(
                  enabled: isLoading,
                  child: ValueListenableBuilder(
                    valueListenable: projectsList,
                    builder: (context, value, child) {
                      return BottomSheetSelector(
                        field: listFields[0],
                        isMultiSelect: false,
                        title: 'project'.tr(),
                        listChoices: value,
                        selectedNotifier: selectedProjectNotifier,
                      );
                    },
                  ),
                );
              },
            ),
            40.verticalSpace,
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: checkIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.s8),
                      ),
                    ),
                    child: Text(
                      'check_in'.tr(),
                      style: AppTextStyles.font16SemiBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                 Expanded(
                  child: ElevatedButton(
                    onPressed: checkOut,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.s8),
                      ),
                    ),
                    child: Text(
                      'check_out'.tr(),
                      style: AppTextStyles.font16SemiBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
