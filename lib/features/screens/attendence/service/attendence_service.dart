import 'package:mkaweel/core/constants/app_typedef.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/print.dart';    
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/attendence/data/model/attendence_res/attendence_res.dart';
import 'package:mkaweel/features/screens/attendence/data/model/check_in_out_parameter.dart';
import 'package:mkaweel/features/screens/attendence/data/repo/remote/attendence_repo.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';

class AttendenceService extends BaseService {
  AttendenceService(this._remoteRepo, this._localRepo);
  
  final AttendenceRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  Future<void> getCurrentAttendenceServ(
    RequestCallbackObserver<AttendenceRes, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getCurrentAttendenceKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getCurrentAttendenceApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId&&tuple?.$1['sec'] == _localRepo.secondarySessionId) {
          return AttendenceRes.fromJson(tuple!.$2);
        }
        return null; 
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey,savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }

  Future<void> checkInOutToogleServ(
    RequestCallbackObserver<DeleteProjectRes, CheckInOutParameter> requestInfo,
  ) {
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.checkInOutToogleApi(
        requestInfo.parameter,
        cancelToken: token,
      )
    );
  }
}
