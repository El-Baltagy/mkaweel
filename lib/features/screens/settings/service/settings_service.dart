import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/settings/data/repo/remote/settings_repo.dart';

class SettingsService extends BaseService {
  SettingsService(this._remoteRepo, this._localRepo);
  
  final SettingsRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
