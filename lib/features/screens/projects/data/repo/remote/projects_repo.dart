
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:dartz/dartz.dart';
 import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_parameters.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/get_project_data_parameter.dart';

class ProjectsRepo extends BaseRepo {
  ProjectsRepo(this.dio);
  final DioHelper dio;

   Future<Either<Failure, AllProjectsRes>> getAllprojectsApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getAllProjects,
        cancelToken: cancelToken,
      ),
      asObject: AllProjectsRes.fromJson,
    );
  }

   Future<Either<Failure, DeleteProjectRes>> deleteProjectApi(
    DeleteProjectParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.deleteData(
        uri: EndPoints.deleteProject(parameter!.id),
        cancelToken: cancelToken,
      ),
      asObject: DeleteProjectRes.fromJson,
    );
  }
  Future<Either<Failure, CreateProjectRes>> createprojectApi(
      CreateProjectParameters? parameter, {
        CancelToken? cancelToken,
      }) async {
    return handleResponse(
      onCallData: dio.postData(
        data: parameter?.toJsonBody(),
        uri: EndPoints.createProject,
        cancelToken: cancelToken,
      ),
      asObject: CreateProjectRes.fromJson,
    );
  }

  Future<Either<Failure, CreateProjectRes>> getProjectDataApi(
      GetProjectDataParameter? parameter, {
        CancelToken? cancelToken,
      }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getProjectData(parameter!.projectId),
        cancelToken: cancelToken,
      ),
      asObject: CreateProjectRes.fromJson,
    );
  }
}

