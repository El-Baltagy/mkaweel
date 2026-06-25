
import 'package:mkaweel/core/constants/app_typedef.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/login/data/model/login_parameters.dart';
import 'package:mkaweel/features/screens/login/data/model/login_res/login_res.dart';
import 'package:mkaweel/features/screens/login/data/repo/remote/login_repo.dart';
import 'package:token_saver/secure_token_manager.dart';

class LoginService extends BaseService {
  LoginService(this._remoteRepo, this._localRepo);
  
  final LoginRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  Future<void> loginServ(
    RequestCallbackObserver<LoginRes, LoginParameters> requestInfo,
  ) {
      return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.loginApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
       // clearLocal: () => _localRepo.clearData(cacheKey),
      // fetchLocal: () async {
      //   final json = await _localRepo.readData(cacheKey);
      //   return json == null ? null : LoginRes.fromJson(json);
      // },
      saveLocal: (old, newData) async {
        if (newData?.message=='success'  ) {
          await _localRepo.saveData(AppConstant.userKeyCash, newData!.data.user.toJson());
          await HWSecureSaver.save(AppConstant.tokenKeyCash,  newData .data.token.toString());
        }
      },

    );
  }
}
