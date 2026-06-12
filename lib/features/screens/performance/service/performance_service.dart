import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/performance/data/repo/remote/performance_repo.dart';

class PerformanceService extends BaseService {
  PerformanceService(this._remoteRepo, this._localRepo);
  
  final PerformanceRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
