

import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/create_project/data/model/create_project_parameters.dart';
import 'package:mkaweel/features/screens/create_project/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/create_project/data/model/get_project_data_parameter.dart';
import 'package:mkaweel/features/screens/create_project/data/repo/remote/create_project_repo.dart';

class CreateProjectService extends BaseService {
  CreateProjectService(this._remoteRepo, this._localRepo);
  
  final CreateProjectRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  Future<void> createProjectServ(
    RequestCallbackObserver<CreateProjectRes, CreateProjectParameters> requestInfo,
  ) {
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.createprojectApi(
        requestInfo.parameter,
        cancelToken: token,
      )
    );
  }

  Future<void> getProjectDataServ(
    RequestCallbackObserver<CreateProjectRes, GetProjectDataParameter> requestInfo,
  ) {
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getProjectDataApi(
        requestInfo.parameter,
        cancelToken: token,
      )
    );
  }
}
