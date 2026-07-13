import 'package:mkaweel/core/constants/app_typedef.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_parameters.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/get_project_data_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_phases_res/project_phases_res.dart';
import 'package:mkaweel/features/screens/projects/data/repo/remote/projects_repo.dart';

class ProjectsService extends BaseService {
  ProjectsService(this._remoteRepo, this._localRepo);
  
  final ProjectsRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  Future<void> getAllProjectsServ(
    RequestCallbackObserver<AllProjectsRes, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getAllProjectsKeyCash;
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getAllprojectsApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
       fetchLocal: () async {
         final tuple = await _localRepo.readData(cacheKey);

         if (tuple?.$1['pr'] == _localRepo.primarySessionId&&tuple?.$1['sec'] == _localRepo.secondarySessionId) {
           return  .fromJson(tuple!.$2);
         }
         return null;
       },
       saveLocal: (old, newData) async {
         if (newData != null) {
           await _localRepo.saveData(cacheKey,   savedData: newData.toJson());
         }
       },
       clearLocal: () => _localRepo.clearData(cacheKey),
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

  Future<void> getProjectPhasesServ(
    RequestCallbackObserver<ProjectPhasesRes, GetProjectDataParameter> requestInfo,
  ) {
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getProjectPhasesApi(
        requestInfo.parameter,
        cancelToken: token,
      )
    );
  }
}
