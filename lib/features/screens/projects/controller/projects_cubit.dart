
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_parameters.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/get_project_data_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_phases_res/project_phases_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/update_phase_parameter.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/service/projects_service.dart';

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

  init() async {
    // TODO: implement init
  }

  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(updatePhaseKeyCode);

    // add every key in file
    CancelManager.cancel(getProjectPhasesKeyCode);

    // add every key in file
    CancelManager.cancel(getAllProjectsKeyCode);
    CancelManager.cancel(createProjectKeyCode);
    return super.close();
  }


  Future<void> deleteProjectFunc(  {required DeleteProjectParameter  parameter}) async {

    await _service.deleteProjectServ(
      RequestCallbackObserver<DeleteProjectRes, DeleteProjectParameter>(
        baseRequestBackType: Reload(),
        parameter: parameter ,
        onLoadCallback: () => safeEmit(current.copyWith(
          deleteProjectResState: Loading<String>(parameter.id.toString()),
          deletingProjectIds: [...current.deletingProjectIds, parameter.id.toString()]
        )),
        onRightCallback: (data) => safeEmit(current.copyWith(
            allProjectsResState: current.allProjectsResState is Success<AllProjectsRes> ?
            Success<AllProjectsRes>((current.allProjectsResState as Success<AllProjectsRes>).data!.copyWith(
              data: (current.allProjectsResState as Success<AllProjectsRes>).data!.data.where((element) => element.id.toString() != parameter.id.toString()).toList(),
            ))
            :current.allProjectsResState,
            deleteProjectResState: Success(data),
            deletingProjectIds: current.deletingProjectIds.where((id) => id != parameter.id.toString()).toList(),
        )),
        onLeftCallback: (failure) => safeEmit(current.copyWith(
          deleteProjectResState: ErrorState(failure),
          deletingProjectIds: current.deletingProjectIds.where((id) => id != parameter.id.toString()).toList(),
        )),
      ),
    );

  }
  Future<AllProjectsRes?> getAllProjectsFunc(BaseRequestBackType? baseRequestBackType,{NoParameter? parameter}) async {
    AllProjectsRes? res;
    await CancelManager.runCancelableFun(getAllProjectsKeyCode, (token) async {
      await _service.getAllProjectsServ(
        RequestCallbackObserver<AllProjectsRes, NoParameter>(
          baseRequestBackType:baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(current.copyWith(allProjectsResState: Loading())),
          onRightCallback: (data) {
            res=data;
            safeEmit(current.copyWith(allProjectsResState: Success(data)));
          }
          ,
          onLeftCallback: (failure) => safeEmit(
            current.copyWith(allProjectsResState: ErrorState(failure)),
          ),
        ),
      );
    });
    return res;
  }


  Future<void> createProjectFunc(  {CreateProjectParameters? parameter}) async {
    await CancelManager.runCancelableFun(createProjectKeyCode, (token) async {
      await _service.createProjectServ(
        RequestCallbackObserver<CreateProjectRes, CreateProjectParameters>(
          baseRequestBackType: Reload(),
          parameter: parameter ,
          cancelToken: token,
          onLoadCallback: () => safeEmit(current.copyWith(createProjectResState: Loading())),
           onRightCallback: (data) => safeEmit(current.copyWith(createProjectResState: Success(data))),
           onLeftCallback: (failure) => safeEmit(current.copyWith(createProjectResState: ErrorState(failure))),
         ),
      );
    });
  }

  Future<CreateProjectRes?> getProjectDataFunc( {GetProjectDataParameter? parameter}) async {
    CreateProjectRes? res;
    await _service.getProjectDataServ(
      RequestCallbackObserver<CreateProjectRes, GetProjectDataParameter>(
        baseRequestBackType: Reload(),
        parameter: parameter ,
        onLoadCallback:  (){},
        onRightCallback: (data) => res=data,
        onLeftCallback: (failure){},
      ),
    );
    return res;
   }



  Future<void> getProjectPhasesFunc( {GetProjectDataParameter? parameter}) async {
    await CancelManager.runCancelableFun(getProjectPhasesKeyCode, (token) async {
      await _service.getProjectPhasesServ(
        RequestCallbackObserver<ProjectPhasesRes, GetProjectDataParameter>(
          baseRequestBackType: Reload() ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(current.copyWith(getProjectPhasesState: Loading())),
          onRightCallback: (data) => safeEmit(current.copyWith(getProjectPhasesState: Success(data))),
          onLeftCallback: (failure) => safeEmit(current.copyWith(getProjectPhasesState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> updatePhaseFunc( {UpdateProjectPhaseRequest? parameter}) async {
    await CancelManager.runCancelableFun(updatePhaseKeyCode, (token) async {
      await _service.updatePhaseServ(
        RequestCallbackObserver<ProjectPhasesRes, UpdateProjectPhaseRequest>(
           parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit( current.copyWith(updatePhaseState: Loading())),
          onRightCallback: (data) {
            var newGetProjectPhasesState = current.getProjectPhasesState;
            PrintHelper().ordinaryPrint('.sssssssssssssssssssssssssssssssccc');

            if ( newGetProjectPhasesState is Success<ProjectPhasesRes> && parameter != null) {
              PrintHelper().ordinaryPrint('................wascccccccccccccc');
              final oldData = newGetProjectPhasesState.data;
              PrintHelper().ordinaryPrint('oldData is \n $oldData');
              final updatedList = (oldData?.data.map((e) {
                if (e.id == parameter.phaseId) {
                  return data !.data.first;
                }
                return e;
              }).toList())??[];
              newGetProjectPhasesState = Success(oldData?.copyWith(data: updatedList));
            }

            safeEmit(current.copyWith(
              getProjectPhasesState: newGetProjectPhasesState,
              updatePhaseState: Success(data),
            ));
          },
          onLeftCallback: (failure) => safeEmit( current.copyWith(updatePhaseState: ErrorState(failure))),
        ),
      );
    });
  }
}
//dart run lib/core/tools/create_auto_functions/add_function_script.dart
//projects getProjectPhases ProjectPhasesRes GetProjectDataParameter
