import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_cubit.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_state.dart';
import 'package:mkaweel/features/screens/settings/ui/widgets/settings_list_widget.dart';

@RoutePage()
class SettingsPage extends StatefulWidget implements AutoRouteWrapper {
  const SettingsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (context) => SettingsCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends SettingsPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.contractorBackground,
        appBar: AppBar(
          backgroundColor: AppColors.contractorTeal,
          elevation: 0,
          title: Text(
            'settings_title'.tr(),
            style: AppTextStyles.font18SemiBold.copyWith(color: AppColors.white),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: const SingleChildScrollView(
          child: SettingsListWidget(),
        ),
      ),
    );
  }
}

abstract class SettingsPageBaseState extends State<SettingsPage> {
  late final SettingsCubit argData;

  @override
  void initState() {
    super.initState();
    argData = SettingsCubit.get(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
