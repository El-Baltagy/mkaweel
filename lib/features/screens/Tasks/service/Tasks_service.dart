import 'package:mkaweel/core/shared/methods/print.dart';    
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/Tasks/data/repo/remote/Tasks_repo.dart';

class TasksService extends BaseService {
  TasksService(this._remoteRepo, this._localRepo);
  
  final TasksRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
