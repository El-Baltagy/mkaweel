import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/core/constants/app_api.dart';
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
}

