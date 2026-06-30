import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:dartz/dartz.dart';
 import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/features/screens/settings/data/model/logout_res/logout_res.dart';

class SettingsRepo extends BaseRepo {
  SettingsRepo(this.dio);
  final DioHelper dio;

   Future<Either<Failure, LogoutRes>> logoutApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.logout,
        cancelToken: cancelToken,
      ),
      asObject: LogoutRes.fromJson,
    );
  }
}

