import 'package:mkaweel/core/base/base_state.dart';

import 'package:flutter/material.dart';

@immutable
abstract class MarketPricesState {}

class MarketPricesInitial extends MarketPricesState {}

class CatogeriesResState extends MarketPricesState {
  final BaseEmit baseEmit;
  CatogeriesResState(this.baseEmit);
}

class SubCatogeriesDataState extends MarketPricesState {
  final BaseEmit baseEmit;
  SubCatogeriesDataState(this.baseEmit);
}
