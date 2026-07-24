import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/widgets/app_bar.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/dob_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_state.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/invoice_res/invoice_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/create_invoice_parameter.dart';
import 'package:mkaweel/features/screens/dashboard/ui/invoice/widgets/invoice_image_picker.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_cubit.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/currency_tabs_widget.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/title_with_input.dart';
import 'package:mkaweel/features/screens/workers/data/model/add_worker_data_request.dart';
import 'package:mkaweel/features/screens/workers/ui/add_workers/widgets/drop_down_role_selector.dart';

part 'invoice_screen_mixin.dart';

@RoutePage()
class InvoicePage extends StatefulWidget implements AutoRouteWrapper {
  const InvoicePage({super.key, required this.args});

  final InvoiceRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        if (args.dashboardCubit != null)
          BlocProvider.value(value: args.dashboardCubit!)
        else
          BlocProvider<DashboardCubit>(
            create: (context) => .new(AppLocator()()()),
          ),
        BlocProvider<MarketPricesCubit>(
          create: (context) => .new(AppLocator()()()),
        ),
        BlocProvider<ProjectsCubit>(
          create: (context) => .new(AppLocator()()()),
        ),
      ],
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
      listener: dashboardListener,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(title: 'new_invoice'.tr()),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 20,
              children: [
                // 1. Select Project
                BlocSelector<ProjectsCubit, ProjectsState, BaseEmit?>(
                  selector: (state) => state is ProjectsLoaded
                      ? state.allProjectsResState
                      : null,
                  builder: (context, state) {
                   setDataIntoProjectController(state);
                    return ValueListenableBuilder(
                      valueListenable: projectsList,
                      builder: (context, value, child) {
                        return BottomSheetSelector(
                          field: fields[0],
                          title: 'select_project'.tr(),
                          isMultiSelect: false,
                          listChoices: value,
                          selectedNotifier: selectedProjectNotifier,
                        );
                      },
                    );
                  },
                ),
                // 2. Select Category
                ValueListenableBuilder(
                  valueListenable: categoriesList,
                  builder: (context, value, child) {
                    return BottomSheetSelector(
                      field: fields[1],
                      title: 'category'.tr(),
                      isMultiSelect: false,
                      listChoices: value,
                      selectedNotifier: selectedCategoryNotifier,
                    );
                  },
                ),

                // 3. Enter Amount
                TitleWithInputField(
                  'amount'.tr(),
                  NameInputData(
                    field: fields[2],
                    isLabel: false,
                    widgetPrefix: const SizedBox.shrink(),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    labelText: '0.00',
                    controller: amountController,
                  ),
                ),

                // 4. Select Currency
                BottomSheetSelector(
                  field: fields[3],
                  title: 'currency'.tr(),
                  isMultiSelect: false,
                  listChoices: currenciesList,
                  selectedNotifier: selectedCurrencyNotifier,
                ),
                // 6. Enter Date (default today)
                TitleWithInputField(
                  'date'.tr(),
                  DOPInputData(
                    field: fields[4],
                    labelText: 'mm/dd/yyyy',
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100),
                      );
                      if (date != null) {
                        dateController.text =
                            "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                      }
                    },
                    controller: dateController,
                  ),
                ),

                // 5. Enter Attachment (one image only)
                InvoiceImagePicker(imageNotifier: attachmentNotifier),

                // 7. Enter Notes
                TitleWithInputField(
                  'notes'.tr(),
                  NameInputData(
                    isLabel: false,
                    widgetPrefix: const SizedBox.shrink(),
                    validator: (v) => null,
                    // not required
                    maxLines: 3,
                    labelText: '${'enter_notes'.tr()}...',
                    controller: notesController,
                  ),
                ),

                // Submit Button
                BlocSelector<DashboardCubit, DashboardState, BaseEmit?>(
                  selector: (state) => state is DashboardLoaded
                      ? state.createInvoiceState
                      : null,
                  builder: (context, state) {
                    bool isLoading = state is Loading;
                    return Container(
                      padding: const .only(top: 10),

                      child: isLoading
                          ? const Row(
                              mainAxisAlignment: .center,
                              children: [CircularProgressIndicator.adaptive()],
                            )
                          : SizedBox(
                              width: double.infinity,
                              height: AppSizes.s48,
                              child: ElevatedButton(
                                onPressed: submitInvoice,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: context.theme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppSizes.s8,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'save'.tr(),
                                  style: AppTextStyles.font16SemiBold.copyWith(
                                    color:
                                        context.theme.scaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                            ),
                    );
                  },
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
