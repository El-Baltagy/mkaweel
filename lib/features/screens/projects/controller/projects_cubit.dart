import 'dart:convert';
import 'dart:io';
import 'package:mkaweel/core/internet/connected_bloc.dart';
import 'package:mkaweel/core/storage/hive_storage.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/dummy.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_parameters.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/get_project_data_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_inoices_res/project_inoices_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_phases_res/project_phases_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/update_phase_parameter.dart';
import 'package:mkaweel/features/screens/settings/data/base_type_worker.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/service/projects_service.dart';
import 'package:mkaweel/features/screens/projects/data/model/pj_phase_update/pj_phase_update.dart';

class ProjectsCubit extends BaseCubit<ProjectsState> {
  ProjectsCubit(this._service) : super(ProjectsLoaded());
  final ProjectsService _service;

  ProjectsLoaded get current =>
      state is ProjectsLoaded ? state as ProjectsLoaded : ProjectsLoaded();

  static ProjectsCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  int get createProjectKeyCode => AppConstant.CreateProjectKeyCode;

  int get getAllProjectsKeyCode => AppConstant.getAllProjectsKeyCode;

  int get getProjectPhasesKeyCode => AppConstant.getProjectPhasesKeyCode;

  int get updatePhaseKeyCode => AppConstant.updatePhaseKeyCode;

  int get getPhaseUpdatesKeyCode => AppConstant.getPhaseUpdatesKeyCode;

  int get getProjectInvoicesKeyCode => AppConstant.getProjectInvoicesKeyCode;

  int get deleteTaskKeyCode => AppConstant.deleteTaskKeyCode;

  init() async {}

  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(deleteTaskKeyCode);

    // add every key in file
    CancelManager.cancel(getProjectInvoicesKeyCode);

    // add every key in file
    CancelManager.cancel(updatePhaseKeyCode);

    // add every key in file
    CancelManager.cancel(getProjectPhasesKeyCode);

    // add every key in file
    CancelManager.cancel(getAllProjectsKeyCode);
    CancelManager.cancel(createProjectKeyCode);
    CancelManager.cancel(getPhaseUpdatesKeyCode);
    return super.close();
  }

  Future<void> deleteProjectFunc({
    required DeleteProjectParameter parameter,
  }) async {
    await _service.deleteProjectServ(
      RequestCallbackObserver<DeleteProjectRes, DeleteProjectParameter>(
        baseRequestBackType: Reload(),
        parameter: parameter,
        onLoadCallback: () => safeEmit(
          current.copyWith(
            deleteProjectResState: Loading<String>(parameter.id.toString()),
            deletingProjectIds: [
              ...current.deletingProjectIds,
              parameter.id.toString(),
            ],
          ),
        ),
        onRightCallback: (data) => safeEmit(
          current.copyWith(
            allProjectsResState:
                current.allProjectsResState is Success<AllProjectsRes>
                ? Success<AllProjectsRes>(
                    (current.allProjectsResState as Success<AllProjectsRes>)
                        .data!
                        .copyWith(
                          data:
                              (current.allProjectsResState
                                      as Success<AllProjectsRes>)
                                  .data!
                                  .data
                                  .where(
                                    (element) =>
                                        element.id.toString() !=
                                        parameter.id.toString(),
                                  )
                                  .toList(),
                        ),
                  )
                : current.allProjectsResState,
            deleteProjectResState: Success(data),
            deletingProjectIds: current.deletingProjectIds
                .where((id) => id != parameter.id.toString())
                .toList(),
          ),
        ),
        onLeftCallback: (failure) => safeEmit(
          current.copyWith(
            deleteProjectResState: ErrorState(failure),
            deletingProjectIds: current.deletingProjectIds
                .where((id) => id != parameter.id.toString())
                .toList(),
          ),
        ),
      ),
    );
  }

  Future<void> getAllProjectsFunc(
    BaseRequestBackType? baseRequestBackType,
        BaseUserType  parameter,
   ) async {
    await CancelManager.runCancelableFun(getAllProjectsKeyCode, (token) async {
      await _service.getAllProjectsServ(
        RequestCallbackObserver<AllProjectsRes, BaseUserType>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(current.copyWith(allProjectsResState: Loading())),
          onRightCallback: (data) {
            safeEmit(current.copyWith(allProjectsResState: Success(data)));
          },
          onLeftCallback: (failure) => safeEmit(
            current.copyWith(allProjectsResState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  Future<void> createProjectFunc({CreateProjectParameters? parameter}) async {
    // late bool hasInternet  ;

    await CancelManager.runCancelableFun(createProjectKeyCode, (token) async {
      await _service.createProjectServ(
        RequestCallbackObserver<(CreateProjectRes,bool), CreateProjectParameters>(
        // RequestCallbackObserver<(CreateProjectRes,bool), CreateProjectParameters>(
          baseRequestBackType: Reload(),
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () async {
            safeEmit(current.copyWith(createProjectResState: Loading()));
           },
          onRightCallback: (data) =>
              safeEmit(current.copyWith(createProjectResState: Success((data,true)))),
          onLeftCallback: (failure) {
            if (failure.error is SocketException && parameter != null) {
              final offlineRequests = HiveStorage().readData<List<String>>('offline_project_requests') ?? <String>[];
              offlineRequests.add(jsonEncode(parameter.toJson()));
              HiveStorage().writeData('offline_project_requests', offlineRequests);
              
              safeEmit(
                current.copyWith(
                  createProjectResState:   Success(
                      (   CreateProjectRes(
                          status: 'offline',
                          message: 'Request saved offline. It will be sent when internet is restored.',
                          data: getEmptyProjectInfoData
                      ),
                      false
                      )
                  ),
                ),
              );
            } else {
              safeEmit(
                current.copyWith(createProjectResState: ErrorState(failure)),
              );
            }
          },
        ),
      );
    });
    // return hasInternet;
  }

  Future<CreateProjectRes?> getProjectDataFunc({
    GetProjectDataParameter? parameter,
  }) async {
    CreateProjectRes? res;
    await _service.getProjectDataServ(
      RequestCallbackObserver<CreateProjectRes, GetProjectDataParameter>(
        baseRequestBackType: Reload(),
        parameter: parameter,
        onLoadCallback: () {},
        onRightCallback: (data) => res = data,
        onLeftCallback: (failure) {},
      ),
    );
    return res;
  }

  Future<void> getProjectPhasesFunc({
    GetProjectDataParameter? parameter,
  }) async {
    await CancelManager.runCancelableFun(getProjectPhasesKeyCode, (
      token,
    ) async {
      await _service.getProjectPhasesServ(
        RequestCallbackObserver<ProjectPhasesRes, GetProjectDataParameter>(
          baseRequestBackType: Reload(),
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(current.copyWith(getProjectPhasesState: Loading())),
          onRightCallback: (data) =>
              safeEmit(current.copyWith(getProjectPhasesState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            current.copyWith(getProjectPhasesState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  Future<void> updatePhaseFunc({UpdateProjectPhaseRequest? parameter}) async {
    await CancelManager.runCancelableFun(updatePhaseKeyCode, (token) async {
      await _service.updatePhaseServ(
        RequestCallbackObserver<ProjectPhasesRes, UpdateProjectPhaseRequest>(
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(current.copyWith(updatePhaseState: Loading())),
          onRightCallback: (data) {
            var newGetProjectPhasesState = current.getProjectPhasesState;
            PrintHelper().ordinaryPrint('.sssssssssssssssssssssssssssssssccc');

            if (newGetProjectPhasesState is Success<ProjectPhasesRes> &&
                parameter != null) {
              PrintHelper().ordinaryPrint('................wascccccccccccccc');
              final oldData = newGetProjectPhasesState.data;
              PrintHelper().ordinaryPrint('oldData is \n $oldData');
              final updatedList =
                  (oldData?.data.map((e) {
                    if (e.id == parameter.phaseId) {
                      return data!.data.first;
                    }
                    return e;
                  }).toList()) ??
                  [];
              newGetProjectPhasesState = Success(
                oldData?.copyWith(data: updatedList),
              );
            }

            safeEmit(
              current.copyWith(
                getProjectPhasesState: newGetProjectPhasesState,
                updatePhaseState: Success(data),
              ),
            );
          },
          onLeftCallback: (failure) =>
              safeEmit(current.copyWith(updatePhaseState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> getPhaseUpdatesFunc({GetProjectDataParameter? parameter}) async {
    await CancelManager.runCancelableFun(getPhaseUpdatesKeyCode, (token) async {
      await _service.getPhaseUpdatesServ(
        RequestCallbackObserver<PjPhaseUpdate, GetProjectDataParameter>(
          baseRequestBackType: Reload(),
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(current.copyWith(getPjPhaseUpdateState: Loading())),
          onRightCallback: (data) =>
              safeEmit(current.copyWith(getPjPhaseUpdateState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            current.copyWith(getPjPhaseUpdateState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  Future<void> getProjectInvoicesFunc({
    DeleteProjectParameter? parameter,
  }) async {
    await CancelManager.runCancelableFun(getProjectInvoicesKeyCode, (
      token,
    ) async {
      await _service.getProjectInvoicesServ(
        RequestCallbackObserver<ProjectInoicesRes, DeleteProjectParameter>(
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(current.copyWith(getProjectInvoicesState: Loading())),
          onRightCallback: (data) => safeEmit(
            current.copyWith(getProjectInvoicesState: Success(data)),
          ),
          onLeftCallback: (failure) => safeEmit(
            current.copyWith(getProjectInvoicesState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  Future<void> deleteInvoiceFunc({DeleteProjectParameter? parameter}) async {
    await CancelManager.runCancelableFun(deleteTaskKeyCode, (token) async {
      await _service.deleteInvoiceServ(
        RequestCallbackObserver<DeleteProjectRes, DeleteProjectParameter>(
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(
            current.copyWith(
              deleteTaskState: Loading<String>(parameter?.id.toString()),
            ),
          ),
          onRightCallback: (data) {
            var newInvoicesState = current.getProjectInvoicesState;
            if (newInvoicesState is Success<ProjectInoicesRes> &&
                parameter != null) {
              final oldRes = newInvoicesState.data;
              if (oldRes != null) {
                final updatedInvoices = oldRes.data.invoices
                    .where(
                      (element) =>
                          element.id.toString() != parameter.id.toString(),
                    )
                    .toList();
                final updatedData = oldRes.data.copyWith(
                  invoices: updatedInvoices,
                );
                newInvoicesState = Success<ProjectInoicesRes>(
                  oldRes.copyWith(data: updatedData),
                );
              }
            }
            safeEmit(
              current.copyWith(
                getProjectInvoicesState: newInvoicesState,
                deleteTaskState: Success(data),
              ),
            );
          },
          onLeftCallback: (failure) =>
              safeEmit(current.copyWith(deleteTaskState: ErrorState(failure))),
        ),
      );
    });
  }
}
