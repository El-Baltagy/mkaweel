import 'package:mkaweel/core/api_helper/caller_tag.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/suppliers_res/suppliers_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/waste_calc_paremeter.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/waste_calc_res/waste_calc_res.dart';

class DashboardRepo extends BaseRepo {
  DashboardRepo(this.dio);
  final DioHelper dio;

  Future<Either<Failure, WasteCalcRes>> calculatewastepercentageApi(
      WasteCalcParemeter? parameter, {
        CancelToken? cancelToken,
      }) async {
    return handleResponse(
      onCallData: dio.postData(
        data: parameter?.toJson(),
        uri: EndPoints.calculateWastePercentage,
        cancelToken: cancelToken,
      ),
      asObject: WasteCalcRes.fromJson,
    );
  }

  Future<Either<Failure, SuppliersRes>> getSuppliersApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getSuppliers,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: SuppliersRes.fromJson,
    );
  }
}

