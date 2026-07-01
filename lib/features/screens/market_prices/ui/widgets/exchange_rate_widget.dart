
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/shared/methods/date_helper.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/currency_data.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/exchange_rate/exchange_rate.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExchangeRateWidget extends StatelessWidget {
  const ExchangeRateWidget({super.key, required this.currencyTabNotifier, this.onUpdatePress, this.emit});
  final ValueNotifier<BaseCurrencyTab> currencyTabNotifier;
  final void Function()? onUpdatePress;
  final BaseEmit? emit;
  @override
  Widget build(BuildContext context) {
    bool isLoading= emit is !Success<ExchangeRate>;

    final RateData  exchangeData =isLoading?RateData.toGetEmptyForLoading():
     (emit as Success<ExchangeRate>).data?.data ?? RateData.toGetEmptyForLoading()     ;

    return Skeletonizer(
      enabled: isLoading,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(AppSizes.s8),
           border: .all(color: Theme.of(context).primaryColor.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap:onUpdatePress?.call ,
                child: const Icon(Icons.sync, color: AppColors.contractorGreyText)),
            ValueListenableBuilder(valueListenable: currencyTabNotifier, builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('live_exchange_rates'.tr(), style: AppTextStyles.font14Regular.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                  5.verticalSpace,

                   Text('1 ${USDollar().symbol} = ${exchangeData.usd.in_try.toStringAsFixed(2)} ${TyrkishLira().symbol}  |  1 ${USDollar().symbol} = ${exchangeData?.usd.sell_rate_syp.toStringAsFixed(2)} ${SyrialLira().symbol}', style: AppTextStyles.font14Regular.copyWith(color: context.theme.colorScheme.tertiaryFixed)),
                   5.verticalSpace,
                    Text('open.er-api.com  • ${DateTimeHelper.formatDateAsStringIntoStringDayMonth(exchangeData.usd.fetched_at.toString())}', style: AppTextStyles.font12Regular),
                ],
              );
            },),
          ],
        ),
      ),
    );
  }
}
