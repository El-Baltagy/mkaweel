abstract class EndPoints {
  static const String baseUrl = "https://muqawili.app";

  // Api Endpoints
static const String login = '/api/login';
static const String logout = '/api/logout';
static const String getCatogeries = '/api/categories';
static String getSubCatogeriesById (int id)=> '/api/categories/$id/construction_materials';
static const String getAllSubCatogeries  =  '/api/construction-materials';
static const String getExchagngeRate  =  '/api/exchange-rates/latest';
static const String calculateWastePercentage  =  '/api/construction-materials/calculate-waste';


}
