class SubCatogeriesInput{
  SubCatogeriesInput(this.id,this.currencySymbol);
  final int id;
  final String currencySymbol;
  Map<String, dynamic> toJsonParameters() =>{
    "currency":currencySymbol
  };
}