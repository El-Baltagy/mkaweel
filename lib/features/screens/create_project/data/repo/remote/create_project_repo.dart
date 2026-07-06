import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:dartz/dartz.dart';
 import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/features/screens/create_project/data/model/create_project_parameters.dart';
import 'package:mkaweel/features/screens/create_project/data/model/create_project_res/create_project_res.dart';

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
}

