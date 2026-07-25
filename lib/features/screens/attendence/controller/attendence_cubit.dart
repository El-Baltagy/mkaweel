    import 'package:mkaweel/core/shared/methods/print.dart';
    import 'package:mkaweel/core/constants/app_constant.dart';
 import 'package:mkaweel/core/base/base_state.dart';
 import 'package:mkaweel/core/base/base_service.dart';   
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/attendence/service/attendence_service.dart';
part 'attendence_state.dart';

class AttendenceCubit extends BaseCubit<AttendenceState> {
   AttendenceCubit(this._service) : super(AttendenceLoaded()) ;
  final AttendenceService _service;
  
     static AttendenceCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
    // Always holds the latest combined state — used by copyWith
   AttendenceLoaded get _current => state is AttendenceLoaded
       ? state as AttendenceLoaded
       : AttendenceLoaded();
       
    Future<void> init() async {
     // TODO: implement init

   }
  
}
