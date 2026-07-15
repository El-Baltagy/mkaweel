import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
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
}
