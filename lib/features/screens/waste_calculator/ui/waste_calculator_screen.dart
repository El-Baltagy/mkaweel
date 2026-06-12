import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/waste_calculator/controller/waste_calculator_cubit.dart';
 import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/waste_calculator/ui/widgets/waste_data_entry_widget.dart';
import 'package:mkaweel/features/screens/waste_calculator/ui/widgets/waste_header_widget.dart';
import 'package:mkaweel/features/screens/waste_calculator/ui/widgets/waste_materials_grid_widget.dart';
import 'package:mkaweel/features/screens/waste_calculator/ui/widgets/waste_result_widget.dart';

@RoutePage()
class WasteCalculatorPage extends StatefulWidget implements AutoRouteWrapper {
  const WasteCalculatorPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<WasteCalculatorCubit>(
      create: (context) => WasteCalculatorCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<WasteCalculatorPage> createState() => _WasteCalculatorPageState();
}

class _WasteCalculatorPageState extends WasteCalculatorPageBaseState {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Waste Calculator Screen',
      child: Scaffold(
        backgroundColor: AppColors.contractorBackground,
        appBar: AppBar(
          backgroundColor: AppColors.contractorTeal,
          elevation: 0,
          leading: const SizedBox.shrink(),
          centerTitle: true,
          title: Text(
            'waste_calculator_title'.tr(),
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
          child: BlocBuilder<WasteCalculatorCubit, WasteCalculatorState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const WasteHeaderWidget(),
                    16.verticalSpace,
                    WasteMaterialsGridWidget(
                      selectedIndex: state.selectedMaterialIndex,
                      onMaterialSelected: (index) {
                        argData.selectMaterial(index);
                      },
                    ),
                    24.verticalSpace,
                    WasteDataEntryWidget(
                      floorArea: state.floorArea,
                      onAreaChanged: (value) {
                        argData.updateFloorArea(value);
                      },
                      onCalculate: () {
                        argData.calculate();
                      },
                    ),
                    if (state.isCalculated) ...[
                      16.verticalSpace,
                      WasteResultWidget(
                        floorArea: state.floorArea,
                        materialIndex: state.selectedMaterialIndex,
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

abstract class WasteCalculatorPageBaseState extends State<WasteCalculatorPage> {
  late final WasteCalculatorCubit argData;

  @override
  void initState() {
    super.initState();
    argData = WasteCalculatorCubit.get(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
