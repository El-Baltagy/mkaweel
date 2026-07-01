import 'package:easy_localization/easy_localization.dart';

abstract class BaseCurrencyTab{
  String get label ;
  String get  shortcut;
  String get  symbol;
}
class SyrialLira extends BaseCurrencyTab{
  SyrialLira._();
  static final SyrialLira _instance = SyrialLira._();
  factory SyrialLira() => _instance;
  @override
  // TODO: implement label
  String get label => 'syrian_lira'.tr();

  @override
  // TODO: implement symbol
  String get shortcut => 'syp';

  @override
  // TODO: implement symbol
  String get symbol => 'ل.س';

}



class TyrkishLira extends BaseCurrencyTab{
  TyrkishLira._();
  static final TyrkishLira _instance = TyrkishLira._();
  factory TyrkishLira() => _instance;
  @override
  // TODO: implement label
  String get label => 'turkish_lira'.tr();

  @override
  // TODO: implement symbol
  String get shortcut => 'try';

  @override
  // TODO: implement symbol
  String get symbol => '₺';

}



class USDollar extends BaseCurrencyTab{
  USDollar._();
  static final USDollar _instance = USDollar._();
  factory USDollar() => _instance;
  @override
  // TODO: implement label
  String get label => 'dollar'.tr();

  @override
  // TODO: implement symbol
  String get shortcut => 'usd';

  @override
  // TODO: implement symbol
  String get symbol => '\$';

}