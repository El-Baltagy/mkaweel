import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_cubit.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_state.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/currency_tabs_widget.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<WasteCalculatorCubit>(
          create: (context) => WasteCalculatorCubit(AppLocator()()()),
        ),
        BlocProvider<MarketPricesCubit>(
          create: (context) => MarketPricesCubit(AppLocator()()()),
        ),
      ],
      child: this,
    );
    // return BlocProvider<MarketPricesCubit>(
    //   create: (context) => MarketPricesCubit(AppLocator()()()),
    //   child: BlocProvider<WasteCalculatorCubit>(
    //     create: (context) => WasteCalculatorCubit(AppLocator()()()),
    //     child: this,
    //   ),
    // );
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
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          leading: const SizedBox.shrink(),
          centerTitle: true,
          title: Text(
            'waste_calculator_title'.tr(),
            style: AppTextStyles.font16SemiBold.copyWith(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () => context.pop(),
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
                    BlocSelector<
                      MarketPricesCubit,
                      MarketPricesState,
                      BaseEmit?
                    >(
                      selector: (state) => state is MarketPricesLoaded
                          ? state.subCategoriesEmit
                          : null,
                      builder: (context, state) => WasteMaterialsGridWidget(
                        onShowMore: (c,l ) async{
                          debugPrint(c.toString());
                          debugPrint(l.toString());
                              await marketPriceCubit.getSubCatogeriesFunc(
                                Pagination(currentPage: c, lastPage: l),
                                parameter: .new(
                                  -1,
                                  CurrencyTabsWidget.listTabs.first.shortcut,
                                    c
                                ),

                              );
                        }
                        // async =>

                        ,emit: state,
                        selectedSubCatNotifier: selectedSubCatNotifier,
                      ),
                    ),

                    24.verticalSpace,
                    WasteDataEntryWidget(
                      floorArea: state.floorArea,
                      onAreaChanged: (value) {
                        // argData.updateFloorArea(value);
                      },
                      onCalculate: () {
                        // argData.calculate();
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
  late final WasteCalculatorCubit wasteCalculatorCubit;
  late final MarketPricesCubit marketPriceCubit;
  ValueNotifier<int> selectedSubCatNotifier = .new(-1);

  @override
  void initState() {
    super.initState();
    wasteCalculatorCubit = WasteCalculatorCubit.get(context: context);
    marketPriceCubit = MarketPricesCubit.get(context: context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await marketPriceCubit.getSubCatogeriesFunc(
        Init(),
        parameter: .new(-1, CurrencyTabsWidget.listTabs.first.shortcut),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
