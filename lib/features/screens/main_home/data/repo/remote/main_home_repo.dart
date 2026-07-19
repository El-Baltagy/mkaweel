import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/caller_tag.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/login/data/model/login_res/login_res.dart';

class MainHomeRepo extends BaseRepo {
  MainHomeRepo(this.dio);
  final DioHelper dio;

  Future<Either<Failure, User>> getProfileDataApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getProfileData,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject:(map) =>  User.fromJson(map['data']),
    );
  }
}

