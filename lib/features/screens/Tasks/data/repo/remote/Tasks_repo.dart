import 'package:mkaweel/core/api_helper/caller_tag.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/tasks_res/tasks_res.dart';
import 'package:mkaweel/features/screens/Tasks/ui/tasks/base_tasks_data.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';

class TasksRepo extends BaseRepo {

  TasksRepo(this.dio);
  final DioHelper dio;

  Future<Either<Failure, TasksRes>> getTasksApi(
      BaseTasksData baseTasksData, {
    CancelToken? cancelToken,

  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri:baseTasksData.api  ,
        query: baseTasksData.query  ,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: TasksRes.fromJson,
    );
  }

  Future<Either<Failure, DeleteProjectRes>> deleteTaskApi(
    DeleteProjectParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.deleteData(
        uri: EndPoints.deleteTask(parameter!.id),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: DeleteProjectRes.fromJson,
    );
  }
}
