
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/api_helper/cancel/cancel_manager.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/features/screens/add_edit_task_project/data/model/create_project_parameters.dart';
import 'package:mkaweel/features/screens/add_edit_task_project/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/add_edit_task_project/data/model/get_project_data_parameter.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/add_edit_task_project/controller/create_project_state.dart';
import 'package:mkaweel/features/screens/add_edit_task_project/service/create_project_service.dart';


class AddEditProjectTaskCubit extends BaseCubit<AddEditProjectTaskState> {
   AddEditProjectTaskCubit(this._service) : super(CreateProjectInitial()) ;
  final CreateProjectService _service;
  
     static AddEditProjectTaskCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
   int get createProjectKeyCode => AppConstant.CreateProjectKeyCode;

  init() async {
    // TODO: implement init

  }
  

  Future<void> createProjectFunc(  {CreateProjectParameters? parameter}) async {
    await CancelManager.runCancelableFun(createProjectKeyCode, (token) async {
      await _service.createProjectServ(
        RequestCallbackObserver<CreateProjectRes, CreateProjectParameters>(
          baseRequestBackType: Reload(),
          parameter: parameter ,
          cancelToken: token,
          onLoadCallback: () => safeEmit(CreateProjectResState(Loading())),
          onRightCallback: (data) => safeEmit(CreateProjectResState(Success(data))),
          onLeftCallback: (failure) => safeEmit(CreateProjectResState(ErrorState(failure))),
        ),
      );
    });
  }

  @override
  Future<void> close() {

    // add every key in file
    CancelManager.cancel(createProjectKeyCode);
    return super.close();
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
}
