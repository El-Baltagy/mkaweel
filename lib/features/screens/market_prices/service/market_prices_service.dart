
import 'package:mkaweel/core/base/base_cubit.dart';
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

  Future<void> getCatogeriesServ(
    RequestCallbackObserver<CatogeriesRes, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getCatogeriesKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getcatogeriesApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return CatogeriesRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
           await _localRepo.saveData(cacheKey,   savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }

  Future<void> getSubCatogeriesServ(
    RequestCallbackObserver<SubCatogeriesData, SubCatogeriesInput> requestInfo
  ) {
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getsubcatogeriesApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {

        return requestInfo.baseRequestBackType is PaginationInfo?
        (requestInfo.baseRequestBackType as PaginationInfo<SubCatogeriesData>).oldDataToCombine:null;
       },

      combinePagination: (oldData, newData) {
         return newData.copyWith(
          pagination:newData.pagination ,
          data: [...oldData.data, ...newData.data],
        );
      },
    );
  }

  Future<void> getExchangeRateServ(
    RequestCallbackObserver<ExchangeRate, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getExchagngeRateKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getexchagngerateApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);
        if ( tuple?.$1['pr'] ==  _localRepo.primarySessionId ) {
          return ExchangeRate.fromJson(tuple!.$2);
        }

        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey,  savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),

    );
  }
}
