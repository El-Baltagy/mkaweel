
import 'package:mkaweel/core/constants/app_typedef.dart';
 import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/catogeries_res/catogeries_res.dart';
 import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/exchange_rate/exchange_rate.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_cat_input.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/sub_catogeries_data/sub_catogeries_data.dart';
import 'package:mkaweel/features/screens/market_prices/data/repo/remote/market_prices_repo.dart';

class MarketPricesService extends BaseService {
  MarketPricesService(this._remoteRepo, this._localRepo);
  
  final MarketPricesRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  Future<void> getcatogeriesServ(
    RequestCallbackObserver<CatogeriesRes, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getCatogeriesKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getcatogeriesApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final json = await _localRepo.readData(cacheKey);
        return json == null ? null : CatogeriesRes.fromJson(json);
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          PrintHelper().ordinaryPrint("................saving\n${newData.toJson()}");
          await _localRepo.saveData(cacheKey, newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }

  Future<void> getsubcatogeriesServ(
    RequestCallbackObserver<SubCatogeriesData, SubCatogeriesInput> requestInfo
  ) {
    // const cacheKey = AppConstant.getSubCatogeriesKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getsubcatogeriesApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      // fetchLocal: () async {
      //   final json = await _localRepo.readData(cacheKey);
      //   return json == null ? null : SubCatogeriesData.fromJson(json);
      // },
      // saveLocal: (old, newData) async {
      //
      //   if (newData != null) {
      //     PrintHelper().ordinaryPrint("................saving\n${newData.toJson()}");
      //      await _localRepo.saveData(cacheKey, newData.toJson());
      //   }
      // },
      // clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }

  Future<void> getexchagngerateServ(
    RequestCallbackObserver<ExchangeRate, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getExchagngeRateKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getexchagngerateApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final json = await _localRepo.readData(cacheKey);
        return json == null ? null : ExchangeRate.fromJson(json);
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey, newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }
}
