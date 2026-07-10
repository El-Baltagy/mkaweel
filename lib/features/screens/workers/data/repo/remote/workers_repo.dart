import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/workers/data/model/all_workers/all_workers.dart';
// import 'package:mkaweel/features/screens/workers/data/model/get_workers/get_workers_req_param.dart';
// import 'package:mkaweel/features/screens/workers/data/model/get_workers/get_workers.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:dartz/dartz.dart';
 import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';

class WorkersRepo extends BaseRepo {
  WorkersRepo(this.dio);
  final DioHelper dio;

   Future<Either<Failure, AllWorkers>> getWorkersApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getAllWorkers,
        cancelToken: cancelToken,
      ),
      asObject: AllWorkers.fromJson,
    );
  }
}

