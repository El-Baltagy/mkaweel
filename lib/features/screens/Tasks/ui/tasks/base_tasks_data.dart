import 'package:mkaweel/core/constants/app_api.dart';

abstract class BaseTasksData {
    String getApi();
    Map<String,dynamic>? getQuery();
}

class AdminTodayTasksData extends BaseTasksData{
  factory AdminTodayTasksData  ()=>  instance;
  AdminTodayTasksData._();
  static final AdminTodayTasksData instance = AdminTodayTasksData._();
  @override
  String getApi()=>EndPoints.getAdminTasks;

  @override
  Map<String, dynamic> getQuery() =>{
    "type":"today"
  };
}
class AdminAllTasksData extends BaseTasksData{
  factory AdminAllTasksData  ()=>  instance;
  AdminAllTasksData._();
  static final AdminAllTasksData instance = AdminAllTasksData._();
  @override
  String getApi()=>EndPoints.getAdminTasks;
  @override
  Map<String, dynamic> getQuery() =>{
    "type":"all"
  };
}

class AdminProjectTasksData extends BaseTasksData{
  AdminProjectTasksData(this.projectID);
  final String projectID;
  @override
  String getApi()=>EndPoints.getProjectTasks(projectID);
  @override
  Map<String, dynamic>? getQuery() =>null;
}
class WorkerTasksData extends BaseTasksData{
  @override
  String getApi()=>EndPoints.getWorkerTasks;
  @override
  Map<String, dynamic>? getQuery() =>null;
}
