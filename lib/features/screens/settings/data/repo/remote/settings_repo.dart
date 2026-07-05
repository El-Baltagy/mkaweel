
import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:dartz/dartz.dart';
 import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/features/screens/settings/data/model/delete_account_res/delete_account_res.dart';
import 'package:mkaweel/features/screens/settings/data/model/logout_res/logout_res.dart';
import 'package:mkaweel/features/screens/settings/data/model/update_profile_parameters.dart';
import 'package:mkaweel/features/screens/settings/data/model/update_profile_res/update_profile_res.dart';

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

   Future<Either<Failure, DeleteAccountRes>> deleteaccountApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.deleteData(
        uri: EndPoints.deleteAccount,
        cancelToken: cancelToken,
      ),
      asObject: DeleteAccountRes.fromJson,
    );
  }

   Future<Either<Failure, UpdateProfileRes>> updateprofileApi(
       UpdateProfileParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        data: FormData.fromMap(await parameter!.toJson()),
        uri: EndPoints.updateProfile,
        cancelToken: cancelToken,
      ),
      asObject: UpdateProfileRes.fromJson,
    );
  }
}

