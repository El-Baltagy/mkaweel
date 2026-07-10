
 import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/workers/data/model/all_workers/all_workers.dart';
import 'package:mkaweel/features/screens/workers/data/repo/remote/workers_repo.dart';

class WorkersService extends BaseService {
  WorkersService(this._remoteRepo, this._localRepo);
  
  final WorkersRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  Future<void> getWorkersServ(
    RequestCallbackObserver<AllWorkers, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getWorkersKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getWorkersApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      // fetchLocal: () async {
      //   final json = await _localRepo.readData(cacheKey);
      //   return json == null ? null : AllWorkers.fromJson(json);
      // },
      // saveLocal: (old, newData) async {
      //   if (newData != null) {
      //     await _localRepo.saveData(cacheKey, newData.toJson());
      //   }
      // },
      // clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }
}
