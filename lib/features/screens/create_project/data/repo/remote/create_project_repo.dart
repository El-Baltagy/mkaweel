
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:dartz/dartz.dart';
 import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/features/screens/create_project/data/model/create_project_parameters.dart';
import 'package:mkaweel/features/screens/create_project/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/create_project/data/model/get_project_data_parameter.dart';

class CreateProjectRepo extends BaseRepo {
  CreateProjectRepo(this.dio);
  final DioHelper dio;

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

