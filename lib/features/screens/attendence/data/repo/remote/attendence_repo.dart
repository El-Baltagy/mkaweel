import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/print.dart';        
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/caller_tag.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/features/screens/attendence/data/model/attendence_res/attendence_res.dart';

class AttendenceRepo extends BaseRepo {
  final DioHelper dio;
  AttendenceRepo(this.dio);

  Future<Either<Failure, AttendenceRes>> getCurrentAttendenceApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getCurrentAttendence,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: AttendenceRes.fromJson,
    );
  }
}

