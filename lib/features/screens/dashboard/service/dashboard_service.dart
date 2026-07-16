import 'package:mkaweel/core/constants/app_typedef.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/suppliers_res/suppliers_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/waste_calc_paremeter.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/waste_calc_res/waste_calc_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/repo/remote/dashboard_repo.dart';

class DashboardService extends BaseService {
  DashboardService(this._remoteRepo, this._localRepo);
  
  final DashboardRepo _remoteRepo;
  final BaseLocalRepo _localRepo;


  Future<void> calculateWastePercentageServ(
      RequestCallbackObserver<WasteCalcRes, WasteCalcParemeter> requestInfo,
      ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.calculatewastepercentageApi(
        requestInfo.parameter,
        cancelToken: token,
      ),

    );
  }

  Future<void> getSuppliersServ(
    RequestCallbackObserver<SuppliersRes, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getSuppliersKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getSuppliersApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return SuppliersRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey,  savedData:newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }

  Future<void> getStatisticsServ(
    RequestCallbackObserver<StatisticsRes, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getStatisticsKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getStatisticsApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final json = await _localRepo.readData(cacheKey);
        return json == null ? null : StatisticsRes.fromJson(json);
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
