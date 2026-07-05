 import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/settings/data/model/delete_account_res/delete_account_res.dart';
import 'package:mkaweel/features/screens/settings/data/model/logout_res/logout_res.dart';
import 'package:mkaweel/features/screens/settings/data/model/update_profile_parameters.dart';
import 'package:mkaweel/features/screens/settings/data/model/update_profile_res/update_profile_res.dart';
import 'package:mkaweel/features/screens/settings/data/repo/remote/settings_repo.dart';

class SettingsService extends BaseService {
  SettingsService(this._remoteRepo, this._localRepo);
  
  final SettingsRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  Future<void> logoutServ(
    RequestCallbackObserver<LogoutRes, NoParameter> requestInfo,
  ) {
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.logoutApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }

  Future<void> deleteAccountServ(
    RequestCallbackObserver<DeleteAccountRes, NoParameter> requestInfo,
  ) {
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.deleteaccountApi(
        requestInfo.parameter,
        cancelToken: token,
      ),

    );
  }

  Future<void> updateprofileServ(
    RequestCallbackObserver<UpdateProfileRes, UpdateProfileParameters> requestInfo,
  ) {
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.updateprofileApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }
}
