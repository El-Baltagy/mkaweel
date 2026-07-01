import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/service/projects_service.dart';


class ProjectsCubit extends BaseCubit<ProjectsState> {
   ProjectsCubit(this._service) : super(ProjectsInitial()) ;
  final ProjectsService _service;
  
     static ProjectsCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);

   @override
   Future<void> init() async {
     // TODO: implement init

   }
  
}
