import 'package:easy_localization/easy_localization.dart';
import 'package:auto_route/auto_route.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/shared/widgets/classic_header_refresh.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_cubit.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_state.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/currency_data.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_catogeries_data/sub_catogeries_data.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/exchange_rate_widget.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/currency_tabs_widget.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/search_and_filter_widget.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/price_item_widget.dart';
import 'package:mkaweel/core/extension/context.dart';
 import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class MarketPricesPage extends StatefulWidget implements AutoRouteWrapper {
  const MarketPricesPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<MarketPricesCubit>(
      create: (context) => AppLocator()()() ,
      child: this,
    );
  }

  @override
  State<MarketPricesPage> createState() => _MarketPricesPageState();
}

class _MarketPricesPageState extends MarketPricesPageBaseState {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Market Prices Screen',
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'market_prices'.tr(),
            style: AppTextStyles.font18SemiBold.copyWith(
              color: context.theme.scaffoldBackgroundColor,
            ),
          ),
          centerTitle: true,
          leading: SizedBox.shrink(),
        ),

        body: BlocSelector<MarketPricesCubit, MarketPricesState, BaseEmit?>(
          selector: (state) =>
              state is MarketPricesLoaded ? state.subCategoriesEmit : null,
          builder: (context, state) {
            SubCatogeriesData? data;
            if (state is Success<SubCatogeriesData>) {
              data = state.data;
            } else if (state is Loading<SubCatogeriesData>)
              data = state.item;

            final Pagination? pagination = data?.pagination;
            return SmartRefresher(
              controller: refreshController,
              onRefresh: () async =>
                  await _loadData(Reload()).whenComplete(() {
                    refreshController.loadComplete();
                    refreshController.refreshCompleted();
                  }),
              header: const ClassicHeaderRefresh(),
              onLoading: () async {
                if (pagination == null) {
                  refreshController.loadComplete();
                  return;
                }
                PrintHelper().ordinaryPrint(".........loading");
                await marketPriceCubit.getSubCatogeriesFunc(
                  pagination.toGetPaginationInfo(data),
                  parameter: .new(
                    selectedCatIdNotifier.value!,
                    currencyTabNotifier.value.shortcut,
                    pagination.current_page,
                  ),
                );
                refreshController.loadComplete();
              },
              enablePullUp:
                  (pagination != null &&
                  pagination.current_page < pagination.last_page),
              footer: CustomFooter(
                height: 50,
                builder: (BuildContext context, LoadStatus? mode) {
                  if (mode == LoadStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return const SizedBox.shrink();
                },
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Column(
                  children: [
                    BlocSelector<
                      MarketPricesCubit,
                      MarketPricesState,
                      BaseEmit?
                    >(
                      selector: (state) => state is MarketPricesLoaded
                          ? state.exchangeRateState
                          : null,
                      builder: (context, emit) => ExchangeRateWidget(
                        emit: emit,
                        onUpdatePress: () async => await marketPriceCubit
                            .getExchagngeRateFunc(Reload()),
                        currencyTabNotifier: currencyTabNotifier,
                      ),
                    ),
                    16.verticalSpace,
                    CurrencyTabsWidget(
                      currencyTabNotifier: currencyTabNotifier,
                    ),
                    // 16.verticalSpace,
                    // const TextInputFilter(),
                    16.verticalSpace,
                    BlocSelector<
                      MarketPricesCubit,
                      MarketPricesState,
                      BaseEmit?
                    >(
                      selector: (state) => state is MarketPricesLoaded
                          ? state.categoriesEmit
                          : null,
                      builder: (context, emit) => RowCatogeries(
                        selectedCat: selectedCatIdNotifier,
                        emit: emit,
                      ),
                    ),

                    20.verticalSpace,
                    BlocSelector<
                      MarketPricesCubit,
                      MarketPricesState,
                      BaseEmit?
                    >(
                      selector: (state) => state is MarketPricesLoaded
                          ? state.subCategoriesEmit
                          : null,
                      builder: (context, emit) => SubCatogeries(emit: emit),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

abstract class MarketPricesPageBaseState extends State<MarketPricesPage>
    with AutoRouteAwareStateMixin<MarketPricesPage> {
  late final MarketPricesCubit marketPriceCubit;
  RefreshController refreshController = .new();
  ValueNotifier<int?> selectedCatIdNotifier = .new(-1);
  ValueNotifier<BaseCurrencyTab> currencyTabNotifier = .new(
    CurrencyTabsWidget.listTabs.first,
  );

  void _listenerCatIdNotfieir() {
    debugPrint("...................");
    marketPriceCubit.getSubCatogeriesFunc(
      Reload(),
      parameter: .new(
        selectedCatIdNotifier.value!,
        currencyTabNotifier.value.shortcut,
      ),
    );
  }

  void _listenerCurrencyNotfieir() {
    marketPriceCubit.getSubCatogeriesFunc(
      Reload(),
      parameter: .new(
        selectedCatIdNotifier.value!,
        currencyTabNotifier.value.shortcut,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    debugPrint("init..............................");
    marketPriceCubit = MarketPricesCubit.get(context: context);
    selectedCatIdNotifier.addListener(_listenerCatIdNotfieir);
    currencyTabNotifier.addListener(_listenerCurrencyNotfieir);

    _loadData();
  }

  Future<void> _loadData([BaseRequestBackType? requestType]) async {
    debugPrint("loading data in Market Prices Cubit ................");
    await Future.wait([
      marketPriceCubit.getCatogeriesFunc(requestType ?? Init()),
      marketPriceCubit.getExchagngeRateFunc(requestType ?? Init()),

      marketPriceCubit.getSubCatogeriesFunc(
        requestType ?? Init(),
        parameter: .new(
          selectedCatIdNotifier.value!,
          currencyTabNotifier.value.shortcut,
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    marketPriceCubit.close();
    selectedCatIdNotifier.removeListener(_listenerCatIdNotfieir);
    selectedCatIdNotifier.dispose();
    currencyTabNotifier.removeListener(_listenerCurrencyNotfieir);
    currencyTabNotifier.dispose();
    refreshController.dispose();
    super.dispose();
  }


}
