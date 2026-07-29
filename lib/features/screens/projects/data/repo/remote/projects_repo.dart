
import 'dart:io';
import 'package:mkaweel/core/api_helper/caller_tag.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/projects/data/model/all_projects_res/all_projects_res.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:dartz/dartz.dart';
 import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_parameters.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_pj_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/delete_project_res/delete_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/get_project_data_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_inoices_res/project_inoices_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_phases_res/project_phases_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/update_phase_parameter.dart';
import 'package:mkaweel/features/screens/projects/data/model/pj_phase_update/pj_phase_update.dart';
import 'package:mkaweel/features/screens/settings/data/base_type_worker.dart';
import 'package:mkaweel/features/tesg.dart';


class ProjectsRepo extends BaseRepo {
  ProjectsRepo(this.dio);
  final DioHelper dio;

   Future<Either<Failure, AllProjectsRes>> getAllprojectsApi(
       BaseUserType? baseUserType, {
    CancelToken? cancelToken,
  }) async {
     // return right(AllProjectsRes.fromJson(jsonPj)) ;
    return handleResponse(
      onCallData: dio.getData(
        uri: baseUserType!.apiProjects,
        cancelToken: cancelToken,
      ),
      asObject: AllProjectsRes.fromJson,
    );
  }

   Future<Either<Failure, DeleteProjectRes>> deleteProjectApi(
    DeleteProjectParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.deleteData(
        uri: EndPoints.deleteProject(parameter!.id),
        cancelToken: cancelToken,
      ),
      asObject: DeleteProjectRes.fromJson,
    );
  }
  Future<Either<Failure, (CreateProjectRes, bool)>> createprojectApi(
      CreateProjectParameters? parameter, {
        CancelToken? cancelToken,
      }) async {
    try {
      final result = await handleResponse(
        onCallData: dio.postData(
          data: parameter?.toJsonBody(),
          uri: parameter!.projectId != null
              ? EndPoints.updateProject(parameter.projectId!)
              : EndPoints.createProject,
          cancelToken: cancelToken,
        ),
        asObject: CreateProjectRes.fromJson,
      );
      return result.fold(
        (failure) {
          if (failure.error is SocketException) {
            return right((CreateProjectRes.fromJson({'status': 'offline', 'message': failure.message, 'data': {}}), false));
          }
          return left(failure);
        },
        (data) => right((data, true)),
      );
    } on SocketException catch (e) {
      return right((CreateProjectRes.fromJson({'status': 'offline', 'message': e.message, 'data': {}}), false));
    }
  }

  Future<Either<Failure, CreateProjectRes>> getProjectDataApi(
      GetProjectDataParameter? parameter, {
        CancelToken? cancelToken,
      }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getProjectData(parameter!.projectId),
        cancelToken: cancelToken,
      ),
      asObject: CreateProjectRes.fromJson,
    );
  }

  Future<Either<Failure, ProjectPhasesRes>> getProjectPhasesApi(
    GetProjectDataParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getProjectPhases(parameter!.projectId),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: ProjectPhasesRes.fromJson,
    );
  }

  Future<Either<Failure, ProjectPhasesRes>> updatePhaseApi(
    UpdateProjectPhaseRequest? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.updatePhase(parameter!.phaseId.toString()),
        cancelToken: cancelToken,
        caller: callerTag(),
        data:await parameter.toFormData(parameter)
      ),
      asObject: (map) => ProjectPhasesRes(
        status: map['status']as String,
        message: map['message']as String,
        data: [ProjectphaseItem.fromJson(map['phase']as Map<String, dynamic> )],
      ),
    );
  }

  Future<Either<Failure, PjPhaseUpdate>> getPhaseUpdatesApi(
    GetProjectDataParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getPhaseUpdates(parameter!.projectId),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: PjPhaseUpdate.fromJson,
    );
  }

  Future<Either<Failure, ProjectInoicesRes>> getProjectInvoicesApi(
    DeleteProjectParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getProjectInvoices(parameter!.id),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: ProjectInoicesRes.fromJson,
    );
  }

  Future<Either<Failure, DeleteProjectRes>> deleteInvoiceApi(
    DeleteProjectParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.deleteData(
        uri: EndPoints.deleteInvoice(parameter!.id),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: DeleteProjectRes.fromJson,
    );
  }
}
