import 'package:easy_localization/easy_localization.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/create_project/controller/create_project_cubit.dart';
import 'package:mkaweel/features/screens/create_project/controller/create_project_state.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/features/screens/create_project/ui/widgets/custom_text_field.dart';
import 'package:mkaweel/features/screens/create_project/ui/widgets/currency_selector_widget.dart';

@RoutePage()
class CreateProjectPage extends StatefulWidget implements AutoRouteWrapper{
  const CreateProjectPage({super.key});
  
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CreateProjectCubit>(
      create: (context) =>CreateProjectCubit(AppLocator()()()),
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
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Semantics(
        label: 'Create Project Screen',
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.primaryColor,
            title: Text('new_project'.tr(), style: AppTextStyles.font18SemiBold.copyWith(color: context.theme.scaffoldBackgroundColor)),
            centerTitle: true,
            leading: const SizedBox.shrink(),
            actions: [
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: context.theme.scaffoldBackgroundColor),
                onPressed: ()=>context.pop(),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  CustomTextField(
                  label: 'project_name'.tr(),
                  hintText: 'building_residential_house'.tr(),
                ),
                20.verticalSpace,
                const CurrencySelectorWidget(),
                20.verticalSpace,
                const CustomTextField(
                  label: 'قيمة العقد (\$)',
                  hintText: '50000',
                ),
                20.verticalSpace,
                  CustomTextField(
                  label: 'location'.tr(),
                  hintText: 'damascus_mezzeh'.tr(),
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: 'end_date'.tr(),
                        hintText: 'mm/dd/yyyy',
                        suffixIcon: const Icon(Icons.calendar_today_outlined, color: AppColors.contractorGreyText),
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: CustomTextField(
                        label: 'start_date'.tr(),
                        hintText: 'mm/dd/yyyy',
                        suffixIcon: const Icon(Icons.calendar_today_outlined, color: AppColors.contractorGreyText),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                  CustomTextField(
                  label: 'project_status'.tr(),
                  hintText: 'active'.tr(),
                  suffixIcon: const Icon(Icons.keyboard_arrow_down, color: AppColors.contractorGreyText),
                ),
                20.verticalSpace,
                Text('site_location_gps'.tr(), style: AppTextStyles.font14Regular.copyWith(color: AppColors.contractorDarkText)),
                10.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(AppSizes.s8),
                    /// to do: add border
                    // border: BorderSide(color: AppColors.contractorLightGrey, style: BorderStyle.solid),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('determine_current_location'.tr(), style: AppTextStyles.font16SemiBold.copyWith(color: AppColors.contractorGreyText)),
                      10.horizontalSpace,
                      const Icon(Icons.my_location, color: AppColors.contractorGreyText),
                    ],
                  ),
                ),
                30.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  height: AppSizes.s48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.s8),
                      ),
                    ),
                    child: Text('create_project'.tr(), style: AppTextStyles.font16SemiBold.copyWith(color: context.theme.scaffoldBackgroundColor)),
                  ),
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

abstract class  CreateProjectPageBaseState extends State<CreateProjectPage> {
  late final CreateProjectCubit argData;
  
  @override
  void initState() {
    argData = CreateProjectCubit.get(context: context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
