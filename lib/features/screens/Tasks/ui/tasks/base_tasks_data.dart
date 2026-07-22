// import 'package:mkaweel/core/constants/app_api.dart';
//
// abstract class BaseTasksData {
//     String getApi();
//     Map<String,dynamic>? getQuery();
// }
//
// class AdminTodayTasksData extends BaseTasksData{
//   factory AdminTodayTasksData  ()=>  instance;
//   AdminTodayTasksData._();
//   static final AdminTodayTasksData instance = AdminTodayTasksData._();
//   @override
//   String getApi()=>EndPoints.getAdminTasks;
//
//   @override
//   Map<String, dynamic> getQuery() =>{
//     "type":"today"
//   };
// }
// class AdminAllTasksData extends BaseTasksData{
//   @override
//   String getApi()=>EndPoints.getAdminTasks;
//   @override
//   Map<String, dynamic> getQuery() =>{
//     "type":"all"
//   };
// }
//
// class AdminProjectTasksData extends BaseTasksData{
//   AdminProjectTasksData(this.projectID);
//   final String projectID;
//   @override
//   String getApi()=>EndPoints.getProjectTasks(projectID);
//   @override
//   Map<String, dynamic>? getQuery() =>null;
// }
// class WorkerTasksData extends BaseTasksData{
//   @override
//   String getApi()=>EndPoints.getWorkerTasks;
//   @override
//   Map<String, dynamic>? getQuery() =>null;
// }
import 'package:mkaweel/core/constants/app_api.dart';

abstract class BaseTasksData {
  const BaseTasksData();

  String get api;

  Map<String, dynamic>? get query;
}

enum AdminTaskType {
  today,
  all,
}

class AdminTasksData extends BaseTasksData {
  const AdminTasksData(this.type);

  final AdminTaskType type;

  static const today = AdminTasksData(AdminTaskType.today);
  static const all = AdminTasksData(AdminTaskType.all);

  @override
  String get api => EndPoints.getAdminTasks;

  @override
  Map<String, dynamic> get query => {
    'type': type.name,
  };
}


class AdminProjectTasksData extends BaseTasksData {
  const AdminProjectTasksData(this.projectId);

  final String projectId;

  @override
  String get api => EndPoints.getProjectTasks(projectId);

  @override
  Map<String, dynamic>? get query => null;
}

class WorkerTasksData extends BaseTasksData {
  const WorkerTasksData._();

  static const instance = WorkerTasksData._();

  @override
  String get api => EndPoints.getWorkerTasks;

  @override
  Map<String, dynamic>? get query => null;
}