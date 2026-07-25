import 'package:mkaweel/core/shared/methods/print.dart';    
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/attendence/data/repo/remote/attendence_repo.dart';

class AttendenceService extends BaseService {
  AttendenceService(this._remoteRepo, this._localRepo);
  
  final AttendenceRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
