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
import 'package:mkaweel/features/screens/dashboard/data/model/create_invoice_parameter.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/ghant_data.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/ghant_res/ghant_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/invoice_res/invoice_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/statistics_res/statistics_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/suppliers_res/suppliers_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/waste_calc_paremeter.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/waste_calc_res/waste_calc_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/weather_parameter.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/weather_res/weather_res.dart';

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

  Future<Either<Failure, StatisticsRes>> getStatisticsApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getStatistics,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: StatisticsRes.fromJson,
    );
  }
  /// Fetch weather data for the given [parameter] lat/lng coordinates.
  Future<Either<Failure, WeatherRes>> getWeatherApi(
      WeatherParameter parameter, {
        CancelToken? cancelToken,
      }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getWeather,
        cancelToken: cancelToken,
        caller: callerTag(),
        query: parameter.toJson(),
      ),
      asObject: WeatherRes.fromJson,
    );
  }

  Future<Either<Failure, GhantRes>> getGhantDataApi(
    GhantParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getGhantData,
        cancelToken: cancelToken,
        caller: callerTag(),
        query: parameter?.toJson()
      ),
      asObject: GhantRes.fromJson,
    );
  }

  Future<Either<Failure, InvoiceRes>> createInvoiceApi(
    CreateInvoiceParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.createInvoice(parameter!.projectId!),
        data: await parameter.toFormData(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: InvoiceRes.fromJson,
    );
  }
}

