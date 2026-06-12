import 'package:easy_localization/easy_localization.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_cubit.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_state.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/exchange_rate_widget.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/currency_tabs_widget.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/search_and_filter_widget.dart';
import 'package:mkaweel/features/screens/market_prices/ui/widgets/price_item_widget.dart';

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
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Semantics(
        label: 'Market Prices Screen',
        child: Scaffold(
          backgroundColor: AppColors.contractorBackground,
          appBar: AppBar(
            backgroundColor: AppColors.contractorTeal,
            title: Text('market_prices'.tr(), style: AppTextStyles.font18SemiBold.copyWith(color: AppColors.white)),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.sync, color: AppColors.white),
              onPressed: () {},
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              children: [
                const ExchangeRateWidget(),
                16.verticalSpace,
                const CurrencyTabsWidget(),
                16.verticalSpace,
                const SearchAndFilterWidget(),
                20.verticalSpace,
                  PriceItemWidget(
                  title: 'window_aluminum'.tr(),
                  subtitle: 'per_m2'.tr(),
                  category: 'aluminum'.tr(),
                  price: '\$ 85',
                  date: '14 مارس 2026',
                ),
                  PriceItemWidget(
                  title: 'white_cement'.tr(),
                  subtitle: 'per_40_kg_bag'.tr(),
                  category: 'cement'.tr(),
                  price: '\$ 12',
                  date: '14 مارس 2026',
                ),
                  PriceItemWidget(
                  title: 'portland_cement'.tr(),
                  subtitle: 'per_50_kg_bag'.tr(),
                  category: 'cement'.tr(),
                  price: '\$ 8.5',
                  date: '14 مارس 2026',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

abstract class  MarketPricesPageBaseState extends State<MarketPricesPage> {
  late final MarketPricesCubit argData;
  
  @override
  void initState() {
    argData = MarketPricesCubit.get(context: context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
