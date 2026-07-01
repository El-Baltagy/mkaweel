import 'package:mkaweel/features/screens/market_prices/data/model/sub_catogeries_data/sub_catogeries_data.dart';

class SubCatogeriesInput{
  SubCatogeriesInput(this.id,this.currencySymbol,[this.page] );
  //,this.subCatogeriesData
  final int id ;
    int? page;
  // SubCatogeriesData? subCatogeriesData;
  final String currencySymbol;
  Map<String, dynamic> toJsonParameters() =>{
    'currency':currencySymbol,
    if(page!=null)
    'page':page!+1,
  };
}