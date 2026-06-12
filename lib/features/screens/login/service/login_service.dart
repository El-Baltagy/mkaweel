import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/login/data/repo/remote/login_repo.dart';

class LoginService extends BaseService {
  LoginService(this._remoteRepo, this._localRepo);
  
  final LoginRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
