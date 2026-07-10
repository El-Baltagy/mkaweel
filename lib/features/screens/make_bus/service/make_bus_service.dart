import 'package:mkaweel/features/screens/make_bus/data/model/get_all_data/get_all_data_req_param.dart';
import 'package:mkaweel/features/screens/make_bus/data/model/get_all_data/get_all_data.dart';
import 'package:mkaweel/core/constants/app_typedef.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/print.dart';    
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/make_bus/data/repo/remote/make_bus_repo.dart';
import 'package:mkaweel/features/screens/market_prices/data/model/catogeries_res/catogeries_res.dart';

class MakeBusService extends BaseService {
  MakeBusService(this._remoteRepo, this._localRepo);
  
  final MakeBusRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  Future<void> getAllDataServ(
    RequestCallbackObserver<CatogeriesRes, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getAllDataKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getAllDataApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final json = await _localRepo.readData(cacheKey);
        return json == null ? null : CatogeriesRes.fromJson(json);
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
