import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/repo/remote/projects_repo.dart';

class ProjectsService extends BaseService {
  ProjectsService(this._remoteRepo, this._localRepo);
  
  final ProjectsRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  Future<void> getAllProjectsServ(
    RequestCallbackObserver<AllProjectsRes, NoParameter> requestInfo,
  ) {
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getAllprojectsApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
     );
  }

  Future<void> deleteProjectServ(
    RequestCallbackObserver<DeleteProjectRes, DeleteProjectParameter> requestInfo,
  ) {
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.deleteProjectApi(
        requestInfo.parameter,
        cancelToken: token,
      )
    );
  }
}
