import 'package:mkaweel/features/screens/make_bus/data/model/get_all_data/get_all_data_req_param.dart';
import 'package:mkaweel/features/screens/make_bus/data/model/get_all_data/get_all_data.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/print.dart';        
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/catogeries_res/catogeries_res.dart';

class MakeBusRepo extends BaseRepo {
  final DioHelper dio;
  MakeBusRepo(this.dio);

  Future<Either<Failure, CatogeriesRes>> getAllDataApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getAllData,
        cancelToken: cancelToken,
      ),
      asObject: CatogeriesRes.fromJson,
    );
  }
}

