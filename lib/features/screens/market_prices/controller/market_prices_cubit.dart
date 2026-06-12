import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/features/screens/market_prices/controller/market_prices_state.dart';
import 'package:mkaweel/features/screens/market_prices/service/market_prices_service.dart';


class MarketPricesCubit extends BaseCubit<MarketPricesState> {
   MarketPricesCubit(this._service) : super(MarketPricesInitial()) ;
  final MarketPricesService _service;
  
     static MarketPricesCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
  @override
  void init() {
    // TODO: implement init
   
  }
  
}
