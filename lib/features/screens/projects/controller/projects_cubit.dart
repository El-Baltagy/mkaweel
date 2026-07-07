
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/service/projects_service.dart';

class ProjectsCubit extends BaseCubit<ProjectsState> {
  ProjectsCubit(this._service) : super(ProjectsLoaded());
  final ProjectsService _service;

  ProjectsLoaded get _current =>
      state is ProjectsLoaded ? state as ProjectsLoaded : ProjectsLoaded();

  static ProjectsCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  int get getAllProjectsKeyCode => AppConstant.getAllProjectsKeyCode;

   init() async {
    // TODO: implement init
  }

  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(getAllProjectsKeyCode);
    return super.close();
  }

  Future<void> getAllProjectsFunc({NoParameter? parameter}) async {
    await CancelManager.runCancelableFun(getAllProjectsKeyCode, (token) async {
      await _service.getAllProjectsServ(
        RequestCallbackObserver<AllProjectsRes, NoParameter>(
          baseRequestBackType: Reload(),
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(allProjectsResState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(allProjectsResState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(allProjectsResState: ErrorState(failure)),
          ),
        ),
      );
    });
  }



  Future<void> deleteProjectFunc(  {required DeleteProjectParameter  parameter}) async {

    await _service.deleteProjectServ(
      RequestCallbackObserver<DeleteProjectRes, DeleteProjectParameter>(
        baseRequestBackType: Reload(),
        parameter: parameter ,
        onLoadCallback: () => safeEmit(_current.copyWith(deleteProjectResState: Loading<String>(parameter .id.toString()) )),
        onRightCallback: (data) => safeEmit(_current.copyWith(
            allProjectsResState: _current.allProjectsResState is Success<AllProjectsRes> ?
            Success<AllProjectsRes>((_current.allProjectsResState as Success<AllProjectsRes>).data!.copyWith(
              data: (_current.allProjectsResState as Success<AllProjectsRes>).data!.data.where((element) => element.id.toString() != parameter.id.toString()).toList(),
            ))
            :_current.allProjectsResState,
            deleteProjectResState: Success(data) )),
        onLeftCallback: (failure) => safeEmit(_current.copyWith(deleteProjectResState: ErrorState(failure) )),
      ),
    );

  }
}
