abstract class EndPoints {
  static const String baseUrl = "https://muqawili.app";

  // Api Endpoints
  static const String login = '/api/login';
  static const String logout = '/api/logout';
  static const String getCatogeries = '/api/categories';

  static String getSubCatogeriesById(int id) =>
      '/api/categories/$id/construction_materials';
  static const String getAllSubCatogeries = '/api/construction-materials';
  static const String getExchagngeRate = '/api/exchange-rates/latest';
  static const String calculateWastePercentage =
      '/api/construction-materials/calculate-waste';
  static const String sendResetPWLink = '/api/forgot-password';
  static const String deleteAccount = '/api/delete_user';
  static const String updateProfile = '/api/update_profile';


  static const String getAllProjects = '/api/projects';
  static const String createProject = '/api/projects';
  static   String updateProject (String id) => '/api/projects/$id/update';
   static String getProjectData(String id) => '/api/projects/$id';
   static String deleteProject(String id) => '/api/projects/$id';

  static const String addWorker = '/api/workers';
  static const String getAllWorkers = '/api/workers';
   static String deleteWorker(String id) => '/api/workers/$id';
   static String updateWorker(String id) => '/api/workers/$id/update';

  static   String getProjectPhases(String id) => '/api/projects/$id/phases';

  static const String getSuppliers = '/api/suppliers';

  static   String updatePhase (String id) =>  '/api/project-phases/$id/store';
}
