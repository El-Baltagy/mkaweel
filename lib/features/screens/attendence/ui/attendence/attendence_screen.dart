import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/features/screens/attendence/controller/attendence_cubit.dart';
import 'package:mkaweel/features/screens/attendence/data/model/check_in_out_parameter.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/location_selection.dart';
import 'package:mkaweel/features/screens/workers/data/model/add_worker_data_request.dart';
import 'package:mkaweel/features/screens/attendence/data/model/attendence_res/attendence_res.dart';
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
        BlocProvider<AttendenceCubit>(create: (context) => AppLocator()()()),
        BlocProvider<ProjectsCubit>(create: (context) => AppLocator()()()),
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
      appBar: CustomAppBar(title: 'attendance'.tr(),
      actions: [
        GestureDetector(
            onTap:    attendenceCubit.getCurrentAttendenceFunc ,
            child: Icon(Icons.refresh_rounded))
      ],
      ),
      body: BlocListener<AttendenceCubit, AttendenceState>(
        listener: listenerAttendenceCubit,
        child: BlocSelector<AttendenceCubit, AttendenceState, BaseEmit?>(
          selector: (state) =>
          state is AttendenceLoaded ? state.getCurrentAttendenceState : null,
          builder: (context, attendanceEmit) {
            // sync state into mixin flag
            handleAttendanceState(attendanceEmit);

            final bool isLoadingAttendance =   attendanceEmit is! Success<AttendenceRes>;
            return ValueListenableBuilder(valueListenable: _isCheckedInNotifier,
              builder: (context, _isCheckedInVal, child) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Project selector (locked if checked-in) ────────────────
                      BlocSelector<ProjectsCubit, ProjectsState, BaseEmit?>(
                        selector: (state) =>
                        state is ProjectsLoaded
                            ? state.allProjectsResState
                            : null,
                        builder: (context, projectsEmit) {
                          bool isLoadingProjects =
                          projectsEmit is! Success<AllProjectsRes>;
                          setDataIntoPJNotifier(projectsEmit);
                          return Skeletonizer(
                            // enabled: isLoadingProjects,
                            enabled: isLoadingProjects || isLoadingAttendance,
                            child: ValueListenableBuilder(
                              valueListenable: projectsList,
                              builder: (context, value, child) {
                                return AbsorbPointer(
                                  absorbing: _isCheckedInVal,
                                  child: BottomSheetSelector(
                                    listChoices: value,
                                    field: listFields[0],
                                    selectedNotifier: selectedProjectNotifier,
                                    isMultiSelect: false,
                                    title: 'project'.tr(),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),

                      if (_isCheckedInVal) ...[
                        // lock indicator
                        8.verticalSpace,
                        Row(
                          children: [
                            Icon(
                              Icons.lock_outline,
                              size: 14,
                              color: Colors.orange.shade700,
                            ),
                            4.horizontalSpace,
                            Text(
                              'selecting_project_will_be_locked_untill_you_check_out'
                                  .tr(),
                              style: AppTextStyles.font14Regular.copyWith(
                                color: Colors.orange.shade700,
                              ),
                            ),
                          ],
                        ),
                      ],

                      40.verticalSpace,

                      // ── Single button toggling check-in / check-out ─────────────
                      BlocSelector<AttendenceCubit, AttendenceState, BaseEmit?>(
                        selector: (s) => s is AttendenceLoaded ? s.checkInOutToogleState : null,
                        builder: (context, toggleState) {
                          final bool isToggling = toggleState is Loading;
                          return SizedBox(
                            width: double.infinity,
                            child: isLoadingAttendance || isToggling
                                ? const Center(child: CircularProgressIndicator())
                                : _isCheckedInVal
                                    ? ElevatedButton.icon(
                                        onPressed: checkInOutToogle,
                                        icon: const Icon(Icons.logout, color: Colors.white),
                                        label: Text(
                                          'check_out'.tr(),
                                          style: AppTextStyles.font16SemiBold.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          padding: const EdgeInsets.symmetric(vertical: 15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(AppSizes.s8),
                                          ),
                                        ),
                                      )
                                    : ElevatedButton.icon(
                                        onPressed: checkInOutToogle,
                                        icon: const Icon(Icons.login, color: Colors.white),
                                        label: Text(
                                          'check_in'.tr(),
                                          style: AppTextStyles.font16SemiBold.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: context.theme.primaryColor,
                                          padding: const EdgeInsets.symmetric(vertical: 15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(AppSizes.s8),
                                          ),
                                        ),
                                      ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },);
          },
        ),
      ),
    );
  }
}
