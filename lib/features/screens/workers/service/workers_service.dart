import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/workers/data/repo/remote/workers_repo.dart';

class WorkersService extends BaseService {
  WorkersService(this._remoteRepo, this._localRepo);
  
  final WorkersRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
