    import 'package:mkaweel/core/constants/app_constant.dart';
 import 'package:mkaweel/core/base/base_state.dart';
 import 'package:mkaweel/core/base/base_service.dart';   
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/main.dart';
import 'create_project_state.dart';
import 'package:mkaweel/features/screens/create_project/service/create_project_service.dart';


class CreateProjectCubit extends BaseCubit<CreateProjectState> {
   CreateProjectCubit(this._service) : super(CreateProjectInitial()) ;
  final CreateProjectService _service;
  
     static CreateProjectCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
  @override
  init() {
    // TODO: implement init
   
  }
  
}
