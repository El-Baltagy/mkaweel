import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/suppliers_res/suppliers_res.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'suppliers_info_screen_mixin.dart';


part 'widgets/detailed_row.dart';
part 'widgets/header.dart';

@RoutePage()
class SuppliersInfoPage extends StatefulWidget implements AutoRouteWrapper {
  const SuppliersInfoPage({super.key, required this.args});

  final SuppliersInfoRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => DashboardCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<SuppliersInfoPage> createState() => _SuppliersInfoPageState();
}

class _SuppliersInfoPageState extends SuppliersInfoPageBaseState {


  @override
  Widget build(BuildContext context) {

    return BlocListener<DashboardCubit, DashboardState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: CustomAppBar(
            title: 'supplier_details'.tr(),
          ),

          body: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: BlocSelector<DashboardCubit, DashboardState, BaseEmit?>(
              selector: (state)=>state is DashboardLoaded?state.getSuppliersState:null,
              builder: (context, state) {
                return SuppliersList(
                    emit: state
                );
              },
            ),
          ),
        )
    );
  }
}


