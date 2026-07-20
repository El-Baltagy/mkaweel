import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
 
part 'invoice_screen_mixin.dart';

@RoutePage()
class InvoicePage extends StatefulWidget implements AutoRouteWrapper {
  const InvoicePage({super.key, required this.args});
  final InvoiceRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => DashboardCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends InvoicePageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardCubit, DashboardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'new_invoice'.tr(),
        ),
      ),
    );
  }
}
