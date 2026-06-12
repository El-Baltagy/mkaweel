import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/invoices/controller/invoices_cubit.dart';
 import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/invoices/ui/widgets/invoice_form_widget.dart';
import 'package:mkaweel/features/screens/invoices/ui/widgets/invoice_items_widget.dart';
import 'package:mkaweel/features/screens/invoices/ui/widgets/invoice_summary_widget.dart';

@RoutePage()
class InvoicesPage extends StatefulWidget implements AutoRouteWrapper {
  const InvoicesPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<InvoicesCubit>(
      create: (context) => InvoicesCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends InvoicesPageBaseState {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Invoices Screen',
      child: Scaffold(
        backgroundColor: AppColors.contractorBackground,
        appBar: AppBar(
          backgroundColor: AppColors.contractorTeal,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text(
            'invoices_title'.tr(),
            style: AppTextStyles.font16SemiBold.copyWith(color: Colors.white),
          ),
          actions: [
             IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
              onPressed: () => context.router.pop(),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocListener<InvoicesCubit, InvoicesState>(
            listener: (context, state) {},
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InvoiceFormWidget(),
                    24.verticalSpace,
                    Text(
                      'invoice_items'.tr(),
                      style: AppTextStyles.font18SemiBold.copyWith(color: AppColors.contractorDarkText,
                          fontSize: 14
                      ),
                    ),
                    8.verticalSpace,
                    const InvoiceItemsWidget(),
                    16.verticalSpace,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, color: AppColors.contractorTeal, size: 18),
                        label: Text(
                          'add_invoice_item'.tr(),
                          style: AppTextStyles.font18SemiBold.copyWith(color: AppColors.contractorTeal,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    24.verticalSpace,
                    const InvoiceSummaryWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

abstract class InvoicesPageBaseState extends State<InvoicesPage> {
  late final InvoicesCubit argData;

  @override
  void initState() {
    super.initState();
    argData = InvoicesCubit.get(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
