import 'package:mkaweel/core/constants/app_typedef.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/print.dart';    
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/tasks_res/tasks_res.dart';
import 'package:mkaweel/features/screens/Tasks/data/repo/remote/Tasks_repo.dart';
import 'package:mkaweel/features/screens/Tasks/ui/tasks/base_tasks_data.dart';

class TasksService extends BaseService {
  TasksService(this._remoteRepo, this._localRepo);
  
  final TasksRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  Future<void> getTasksServ(
    RequestCallbackObserver<TasksRes, BaseTasksData > requestInfo,
  ) {
    // const cacheKey = AppConstant.getTasksKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getTasksApi(
        requestInfo.parameter!,
        cancelToken: token,
      ),
      // fetchLocal: () async {
      //   final tuple = await _localRepo.readData(cacheKey);
      //
      //   if (tuple?.$1['pr'] == _localRepo.primarySessionId&&tuple?.$1['sec'] == _localRepo.secondarySessionId) {
      //     return TasksRes.fromJson(tuple!.$2);
      //   }
      //   return null;
      // },
      // saveLocal: (old, newData) async {
      //   if (newData != null) {
      //     await _localRepo.saveData(cacheKey,savedData: newData.toJson());
      //   }
      // },
      // clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }
}
