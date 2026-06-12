import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/projects/data/repo/remote/projects_repo.dart';

class ProjectsService extends BaseService {
  ProjectsService(this._remoteRepo, this._localRepo);
  
  final ProjectsRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
