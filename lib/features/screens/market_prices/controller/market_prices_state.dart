import 'package:mkaweel/core/base/base_state.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MarketPricesState {}


/// Single combined state — both slices are always present together.
/// This prevents one request's emission from wiping the other's data.
class MarketPricesLoaded extends MarketPricesState {
  final BaseEmit? categoriesEmit,subCategoriesEmit,exchangeRate;
  final MarketPricesState? refreshOrInit;

    MarketPricesLoaded({
    this.exchangeRate,
    this.categoriesEmit,
    this.refreshOrInit,
    this.subCategoriesEmit,
  });

  MarketPricesLoaded copyWith({
    BaseEmit? categoriesEmit,
    BaseEmit? exchangeRate,
    BaseEmit? subCategoriesEmit,
    MarketPricesState? refreshOrInit,
  }) {
    return MarketPricesLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      categoriesEmit: categoriesEmit ?? this.categoriesEmit,
      subCategoriesEmit: subCategoriesEmit ?? this.subCategoriesEmit,
    );
  }
}
