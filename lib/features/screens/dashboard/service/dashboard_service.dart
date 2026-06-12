import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/dashboard/data/repo/remote/dashboard_repo.dart';

class DashboardService extends BaseService {
  DashboardService(this._remoteRepo, this._localRepo);
  
  final DashboardRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
