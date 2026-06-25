import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:dartz/dartz.dart';
 import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/features/screens/login/data/model/login_parameters.dart';
import 'package:mkaweel/features/screens/login/data/model/login_res/login_res.dart';

class LoginRepo extends BaseRepo {
  LoginRepo(this.dio);
  final DioHelper dio;

   Future<Either<Failure, LoginRes>> loginApi(
    LoginParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.login,
        data: parameter?.toJson(),
        cancelToken: cancelToken,
      ),
      asObject: LoginRes.fromJson,
    );
  }
}

