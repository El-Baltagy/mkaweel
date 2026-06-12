import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/create_project/data/repo/remote/create_project_repo.dart';

class CreateProjectService extends BaseService {
  CreateProjectService(this._remoteRepo, this._localRepo);
  
  final CreateProjectRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
