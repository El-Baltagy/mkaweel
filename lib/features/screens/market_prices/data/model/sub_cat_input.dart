class SubCatogeriesInput{
  SubCatogeriesInput(this.id,this.currencySymbol,[this.page] );
  final int id ;
    int? page;
  final String currencySymbol;
  Map<String, dynamic> toJsonParameters() =>{
    'currency':currencySymbol,
    if(page!=null)
    'page':page!+1,
  };
}