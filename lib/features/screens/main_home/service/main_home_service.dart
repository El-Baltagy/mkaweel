import 'package:mkaweel/core/constants/app_typedef.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/login/data/model/login_res/login_res.dart';
import 'package:mkaweel/features/screens/main_home/data/repo/remote/main_home_repo.dart';

class MainHomeService extends BaseService {
  MainHomeService(this._remoteRepo, this._localRepo);
  
  final MainHomeRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  Future<void> getProfileDataServ(
    RequestCallbackObserver<User, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.userKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getProfileDataApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId&& tuple?.$1['sec'] == _localRepo.secondarySessionId) {
          return User.fromJson(tuple!.$2);
        }
        return null; 
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey,savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }
}
