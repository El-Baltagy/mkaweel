import 'package:easy_localization/easy_localization.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/base_text_input_data.dart';
 import 'package:mkaweel/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/text_input_widget.dart';
import 'package:mkaweel/features/screens/create_project/controller/create_project_cubit.dart';
import 'package:mkaweel/features/screens/create_project/controller/create_project_state.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/features/screens/create_project/ui/widgets/currency_selector_widget.dart';
import 'package:mkaweel/features/screens/create_project/ui/widgets/location_selection.dart';
 import 'package:mkaweel/features/screens/create_project/ui/widgets/start_end_date.dart';

@RoutePage()
class CreateProjectPage extends StatefulWidget implements AutoRouteWrapper {
  const CreateProjectPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CreateProjectCubit>(
      create: (context) => CreateProjectCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends CreateProjectPageBaseState {

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateProjectCubit, CreateProjectState>(
      listener: createProjectLisener,
      child: Semantics(
        label: 'Create Project Screen',
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.primaryColor,
            title: Text(
              'new_project'.tr(),
              style: AppTextStyles.font18SemiBold.copyWith(
                color: context.theme.scaffoldBackgroundColor,
              ),
            ),
            centerTitle: true,
            leading: const SizedBox.shrink(),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: context.theme.scaffoldBackgroundColor,
                ),
                onPressed: () => context.pop(),
              ),
            ],
          ),
          body: Form(
            key: _key,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(
                    'project_name'.tr(),
                    NameInputData(
                      isLabel: false,
                      widgetPrefix: const SizedBox.shrink(),
                       field: field1,
                      labelText: 'building_residential_house'.tr(),
                      controller: _controller1,
                    ),
                  ),

                  20.verticalSpace,
                  _buildTextField(
                    'project_owner'.tr(),
                    NameInputData(
                      isLabel: false,
                      widgetPrefix: const SizedBox.shrink(),
                      field: field2,
                      labelText: 'ministry_of_housing'.tr(),
                      controller: _controller2,
                    ),
                  ),

                  20.verticalSpace,
                    CurrencySelectorWidget(
                      listStringCurrencies: _listStringCurrencies,
                      selectedCurrencyNotifier: selectedCurrencyNotifier,
                    ),

                  20.verticalSpace,
                  _buildTextField(
                    '${'contract_value'.tr()} (\$)',
                    NameInputData(
                      isLabel: false,
                      widgetPrefix: const SizedBox.shrink(),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          // Allow clearing the field
                          if (newValue.text.isEmpty) {
                            return newValue;
                          }

                          // Prevent entering 0 as the first character
                          if (oldValue.text.isEmpty && newValue.text == '0') {
                            return oldValue;
                          }

                          return newValue;
                        }),
                      ],
                      field: field3,
                      labelText: '50000',
                      controller: _controller3,
                    ),
                  ),

                  20.verticalSpace,
                  StartEndDates(
                      controllerE:_controller5 ,
                      controllerS: _controller4,
                      fieldE: field5,
                      fieldS:field4 ,
                   ),

                  20.verticalSpace,
                   LoccationSelection(
                     locationNotifier: locationNotifier,

                   ),

                  30.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    height: AppSizes.s48,
                    child: ElevatedButton(
                      onPressed: () async {
                        // if (isLoading) return;
                        if (await _key.validateAndScroll(
                          context,
                          listRecorder: [field1, field2],
                        )) {}
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.s8),
                        ),
                      ),
                      child: Text(
                        'create_project'.tr(),
                        style: AppTextStyles.font16SemiBold.copyWith(
                          color: context.theme.scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildTextField(String mainLabel, BaseTextInputData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mainLabel,
          style: AppTextStyles.font14Regular.copyWith(
            color: context.theme.colorScheme.tertiaryFixed,
          ),
        ),
        10.verticalSpace,
        TextInputWidget(data: data),
      ],
    );
  }
}

abstract class CreateProjectPageBaseState extends State<CreateProjectPage> {
  late final CreateProjectCubit argData;
  final ValueNotifier<String> selectedCurrencyNotifier = .new('');
  final _key = GlobalKey<FormState>();
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field1 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field2 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field3 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field4 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field5 = (.new(), .new());
  final TextEditingController _controller1 = .new();
  final TextEditingController _controller2 = .new();
  final TextEditingController _controller3 = .new();
  final TextEditingController _controller4 = .new();
  final TextEditingController _controller5 = .new();
  final ValueNotifier<(String?, LatLng?)> locationNotifier=.new((null,null));


  @override
  void initState() {
    super.initState();
    argData = CreateProjectCubit.get(context: context);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    field1.$2?.dispose();
    field2.$2?.dispose();
    field3.$2?.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    selectedCurrencyNotifier.dispose();
    locationNotifier.dispose();

    super.dispose();
  }

  void createProjectLisener(context, state) {
    // TODO: implement listener
  }

  final List<String> _listStringCurrencies = [
    'SAR',
    'USD',
    'TRY',
    'EUR',
    'AED',
    'EGP',
    'IQD',
    'JOD',
    'KWD',
    'LYD',
    'OMR',
    'QAR',
    'SYP',
  ];
}
