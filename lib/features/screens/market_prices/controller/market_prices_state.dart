import 'package:mkaweel/core/base/base_state.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MarketPricesState {}


/// Single combined state — both slices are always present together.
/// This prevents one request's emission from wiping the other's data.
class MarketPricesLoaded extends MarketPricesState {
  final BaseEmit? categoriesEmit,subCategoriesEmit,exchangeRateState;
  final MarketPricesState? refreshOrInit;

    MarketPricesLoaded({
    this.exchangeRateState,
    this.categoriesEmit,
    this.refreshOrInit,
    this.subCategoriesEmit,
  });

  MarketPricesLoaded copyWith({
    BaseEmit? categoriesEmit,
    BaseEmit? exchangeRateState,
    BaseEmit? subCategoriesEmit,
    MarketPricesState? refreshOrInit,
  }) {
    return MarketPricesLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
      exchangeRateState: exchangeRateState ?? this.exchangeRateState,
      categoriesEmit: categoriesEmit ?? this.categoriesEmit,
      subCategoriesEmit: subCategoriesEmit ?? this.subCategoriesEmit,
    );
  }
}

