import 'package:mkaweel/core/api_helper/caller_tag.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/exchange_rate/exchange_rate.dart';
 import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
 import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/catogeries_res/catogeries_res.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_cat_input.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_catogeries_data/sub_catogeries_data.dart';

class MarketPricesRepo extends BaseRepo {
  MarketPricesRepo(this.dio);

  final DioHelper dio;

  Future<Either<Failure, CatogeriesRes>> getcatogeriesApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
      return handleResponse(
       onCallData: dio.getData(
        uri: EndPoints.getCatogeries,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: CatogeriesRes.fromJson,
    );
  }

  Future<Either<Failure, SubCatogeriesData>> getsubcatogeriesApi(
    SubCatogeriesInput? parameter, {
    CancelToken? cancelToken,
  }) async {
     return handleResponse(
       onCallData: dio.getData(
         query:parameter?.toJsonParameters() ,
        uri: parameter!.id == -1
            ? EndPoints.getAllSubCatogeries
            : EndPoints.getSubCatogeriesById(parameter.id),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: SubCatogeriesData.fromJson,
    );
  }

   Future<Either<Failure, ExchangeRate>> getexchagngerateApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getExchagngeRate,
        cancelToken: cancelToken,
      ),
      asObject: ExchangeRate.fromJson,
    );
  }
}
