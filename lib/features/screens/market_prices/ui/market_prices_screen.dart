import 'package:easy_localization/easy_localization.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_cubit.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_state.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_catogeries_data/sub_catogeries_data.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/exchange_rate_widget.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/currency_tabs_widget.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/search_and_filter_widget.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/price_item_widget.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/text_input_filter.dart';

@RoutePage()
class MarketPricesPage extends StatefulWidget implements AutoRouteWrapper{
  const MarketPricesPage({super.key});
  
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<MarketPricesCubit>(
      create: (context) =>MarketPricesCubit(AppLocator()()()),
      child: this,
    );
  }
  
  @override
  State<MarketPricesPage> createState() => _MarketPricesPageState();
}

class _MarketPricesPageState extends MarketPricesPageBaseState {
  @override
  Widget build(BuildContext context) {
     return BlocListener<MarketPricesCubit, MarketPricesState>(
      listener: listenerPricesCubit,
      child: Semantics(
        label: 'Market Prices Screen',
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text('market_prices'.tr(), style: AppTextStyles.font18SemiBold.copyWith(color: context.theme.scaffoldBackgroundColor)),
            centerTitle: true,
            leading: IconButton(
              icon:   Icon(Icons.sync, color: context.theme.scaffoldBackgroundColor),
              onPressed: () {},
            ),
          ),
          floatingActionButton: kDebugMode?
              FloatingActionButton(onPressed: () {
                _loadData();
              },)
              :null,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              children: [
                const ExchangeRateWidget(),
                16.verticalSpace,
                 CurrencyTabsWidget(
                   currencyTabNotifier: currencyTab,
                 ),
                16.verticalSpace,
                const TextInputFilter(),
                16.verticalSpace,
                BlocSelector<MarketPricesCubit, MarketPricesState, BaseEmit?>(
                  selector: (state) =>
                  state is MarketPricesLoaded ? state.categoriesEmit : null,
                  builder: (context, emit) => SearchAndFilterWidget(
                      selectedCat: selectedCatId,
                      emit: emit),
                ),

                20.verticalSpace,
                BlocSelector<MarketPricesCubit, MarketPricesState, BaseEmit?>(
                  selector: (state) =>
                  state is MarketPricesLoaded ? state.subCategoriesEmit : null,
                  builder: (context, emit) {
                    // ── 1. Initial / not yet loaded ──────────────────────
                    if (emit == null) return const SizedBox.shrink();

                    // ── 2. Loading ───────────────────────────────────────
                    if (emit is Loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // ── 3. Error ─────────────────────────────────────────
                    if (emit is ErrorState) {
                      return Text(emit.failure.toString());
                    }

                    // ── 4. Success — data IS SubCatogeriesData ───────────
                    if (emit is Success<SubCatogeriesData>) {
                      final List<DataItem> items = emit.data?.data ?? [];
                      return Column(
                        children: items
                            .map(
                              (item) => PriceItemWidget(
                                title: item.name,
                                subtitle: item.unit,
                                category: item.category.name,
                                price: '\$ ${item.selling_price}',
                                date: item.created_at,
                              ),
                            )
                            .toList(),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

 }

abstract class MarketPricesPageBaseState extends State<MarketPricesPage>
    with AutoRouteAwareStateMixin<MarketPricesPage> {
  late final MarketPricesCubit argData;
ValueNotifier<int?>selectedCatId=.new(-1);
  ValueNotifier<BaseCurrencyTab >currencyTab=.new(CurrencyTabsWidget.listTabs.first);

void _listenerNotfieir(){
  debugPrint(selectedCatId.value.toString());
  argData.getSubCatogeriesFunc(.reload, parameter: .new(selectedCatId.value!));
}

  @override
  void initState() {
    super.initState();
    debugPrint("init..............................");
    argData = MarketPricesCubit.get(context: context);
    selectedCatId.addListener(_listenerNotfieir);

    _loadData();
  }



  void _loadData() {
    debugPrint("loading data................");
    argData.getCatogeriesFunc(.reload);
    argData.getSubCatogeriesFunc(.reload, parameter: .new(selectedCatId.value!));
  }

  @override
  void dispose() {
    argData.close();
    selectedCatId.removeListener(_listenerNotfieir);
    selectedCatId.dispose();
    super.dispose();
  }

  void listenerPricesCubit(BuildContext context, MarketPricesState state) {
    // TODO: implement listener
  }
}
