    import 'package:mkaweel/core/constants/app_constant.dart';
 import 'package:mkaweel/core/base/base_state.dart';
 import 'package:mkaweel/core/base/base_service.dart';   
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/main.dart';
import 'settings_state.dart';
import 'package:mkaweel/features/screens/settings/service/settings_service.dart';


class SettingsCubit extends BaseCubit<SettingsState> {
   SettingsCubit(this._service) : super(SettingsInitial()) ;
  final SettingsService _service;
  
     static SettingsCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
  @override
  init() {
    // TODO: implement init
   
  }
  
}
