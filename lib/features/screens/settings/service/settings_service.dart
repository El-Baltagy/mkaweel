
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/settings/data/model/logout_res/logout_res.dart';
import 'package:mkaweel/features/screens/settings/data/repo/remote/settings_repo.dart';

class SettingsService extends BaseService {
  SettingsService(this._remoteRepo, this._localRepo);
  
  final SettingsRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  Future<void> logoutServ(
    RequestCallbackObserver<LogoutRes, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.logoutKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.logoutApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final json = await _localRepo.readData(cacheKey);
        return json == null ? null : LogoutRes.fromJson(json);
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
