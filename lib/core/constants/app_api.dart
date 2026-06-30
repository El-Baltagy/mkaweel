abstract class EndPoints {
  static const String baseUrl = "https://muqawili.app";

  // Api Endpoints
static const String login = '/api/login';
static const String getCatogeries = '/api/categories';
static   String getSubCatogeries (int id)=> '/api/categories/$id/construction_materials';


}
