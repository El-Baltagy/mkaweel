import 'package:mkaweel/features/screens/login/data/model/forget_password_link/forget_password_link.dart';
import 'package:mkaweel/features/screens/login/data/model/forget_password_parameter.dart';
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
      saveLocal: (old, newData) async {
        if (newData?.status=='success'  ) {
          await _localRepo.saveData(AppConstant.userKeyCash, newData!.data.user.toJson());
          await HWSecureSaver.save(AppConstant.tokenKeyCash,  newData .data.token.toString());
        }
      },

    );
  }

  Future<void> sendResetPWLinkServ(
    RequestCallbackObserver<ForgetPasswordLink, ForgetPasswordParameter> requestInfo,
  ) {
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.sendresetpwlinkApi(
        requestInfo.parameter,
        cancelToken: token,
      ),

    );
  }
}
