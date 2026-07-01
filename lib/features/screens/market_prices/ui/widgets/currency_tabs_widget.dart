import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/currency_data.dart';

class CurrencyTabsWidget extends StatelessWidget {
    const CurrencyTabsWidget({super.key, required this.currencyTabNotifier});
    final   ValueNotifier<BaseCurrencyTab >currencyTabNotifier;
 static final List<BaseCurrencyTab> listTabs=[
    USDollar(),
    SyrialLira(),
    TyrkishLira()

  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: currencyTabNotifier, builder: (context, value, child) {
      return Row(
          spacing: 10 ,
          children: List.generate(listTabs.length,
                  (index) => Expanded(child: _buildTab(context,listTabs[index], value)))

      );
    },);
  }

  Widget _buildTab(BuildContext context,BaseCurrencyTab currentTab, BaseCurrencyTab selectedTab) {
    bool isSelected=currentTab==selectedTab;
    return GestureDetector(
      onTap: () {
        if(!isSelected){
          currencyTabNotifier.value=currentTab;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.1) : context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(AppSizes.s8),
          /// to do: add border
          border: .all(
            color: isSelected ? Theme.of(context).primaryColor : context.theme.canvasColor,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          currentTab.label,
          style: AppTextStyles.font14Regular.copyWith(
            color: isSelected ? Theme.of(context).primaryColor : context.theme.colorScheme.tertiaryFixed,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}