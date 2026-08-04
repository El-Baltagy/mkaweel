import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/base/base_cubit.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/internet/connected_bloc.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/storage/hive_storage.dart';
import 'package:mkaweel/core/shared/methods/location_Service.dart';
import 'package:mkaweel/features/screens/login/data/model/login_res/login_res.dart';
import 'package:mkaweel/features/screens/main_home/service/main_home_service.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_parameters.dart';
import 'package:mkaweel/features/screens/projects/service/projects_service.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
 import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/location_selection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/main.dart';
import 'package:mkaweel/core/app/app.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/features/screens/Tasks/controller/Tasks_cubit.dart';
import 'package:mkaweel/features/screens/Tasks/ui/tasks/base_tasks_data.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/tasks_res/tasks_res.dart';
import 'package:mkaweel/features/screens/Tasks/data/model/add_edit_update_task_parameter.dart';

class OfflineSyncService {
  OfflineSyncService._();
  static final OfflineSyncService _instance = OfflineSyncService._();
  factory OfflineSyncService() => _instance;

  final ValueNotifier<bool> isSyncingNotifier = ValueNotifier<bool>(false);

  void init() {
    ConnectivityService.connectivityStream.listen((hasInternet) {
      if (hasInternet) {
        _syncOfflineProjectRequests();
        _syncOfflineTasks();
      }
    });
  }

  Future<void> syncNow() async {
    final hasInternet = await ConnectivityService.validateInternetConnection();
    if (hasInternet) {
      await _syncOfflineProjectRequests();
      await _syncOfflineTasks();
    }
  }

  Future<void> _syncOfflineProjectRequests() async {
    if (isSyncingNotifier.value) return;

    final offlineRequestsJson = HiveStorage().readData<List<String>>('offline_project_requests');
    if (offlineRequestsJson == null || offlineRequestsJson.isEmpty) return;

    // Check the user's role before proceeding with sync.
    // A Completer is used to capture the async callback result so we can
    // properly guard the rest of this method with an early return.
    final mainHomeService = AppLocator().call()<MainHomeService>();
    final isAdminCompleter = Completer<bool>();

    await mainHomeService.getProfileDataServ(RequestCallbackObserver<User, NoParameter>(
      parameter: NoParameter(),
      onLoadCallback: () {},
      baseRequestBackType: Init(),
      onRightCallback: (data) {
        isAdminCompleter.complete(data?.role == 'admin');
      },
      onLeftCallback: (failure) {
        isAdminCompleter.complete(false);
      },
    ));

    final isAdmin = await isAdminCompleter.future;
    if (!isAdmin) return;

    isSyncingNotifier.value = true;
    List<String> failedRequests = [];

    for (String requestJson in offlineRequestsJson) {
      try {
        final Map<String, dynamic> requestMap = jsonDecode(requestJson) as Map<String, dynamic>;
        final CreateProjectParameters parameter = CreateProjectParameters.fromJson(requestMap);

        String locationAddress = parameter.location;

        if (locationAddress.isEmpty && parameter.latitude.isNotEmpty && parameter.longitude.isNotEmpty) {
          final lat = double.tryParse(parameter.latitude);
          final lng = double.tryParse(parameter.longitude);
          if (lat != null && lng != null) {
            final addressModel = await LocationService().reverseGeocode(LatLng(lat, lng));
            if (addressModel != null) {
              locationAddress = addressModel.toString();
            }
          }
        }

        final updatedParameter = CreateProjectParameters(
          name: parameter.name,
          owner_name: parameter.owner_name,
          start_date: parameter.start_date,
          end_date: parameter.end_date,
          latitude: parameter.latitude,
          longitude: parameter.longitude,
          contract_value: parameter.contract_value,
          currency: parameter.currency,
          extra_details: parameter.extra_details,
          description: parameter.description,
          projectId: parameter.projectId,
          location: locationAddress,
        );

        final projectsService = AppLocator().call()<ProjectsService>();


        bool success = false;
        
        await projectsService.createProjectServ(
          RequestCallbackObserver<(CreateProjectRes,bool), CreateProjectParameters>(
            parameter: updatedParameter,
            onLoadCallback: () {},
            onRightCallback: (data) {
              success = true;
            },
            onLeftCallback: (failure) {
              if (failure.error is SocketException) {
                 success = false; 
              } else {
                 success = true; 
              }
            },
          ),
        );
        
        if (!success) {
          failedRequests.add(requestJson);
        }
      } catch (e) {
      }
    }

    if (failedRequests.isEmpty) {
      await HiveStorage().deleteData('offline_project_requests');
    } else {
      await HiveStorage().writeData('offline_project_requests', failedRequests);
    }
    
    isSyncingNotifier.value = false;
  }

  Future<void> _syncOfflineTasks() async {
    final offlineRequestsJson = HiveStorage().readData<List<String>>('offline_task_requests');
    if (offlineRequestsJson == null || offlineRequestsJson.isEmpty) return;

    final context = navigatorKey.currentContext;
    if (context == null) return;

    final cachedTasks = offlineRequestsJson.map((req) {
      final map = jsonDecode(req) as Map<String, dynamic>;
      return AddEditTaskRequest.fromJson(map);
    }).toList();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'offline_tasks_ready_to_sync'.tr(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text('please_complete_the_following_tasks_to_sync'.tr()),
                const SizedBox(height: 15),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cachedTasks.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (ctx, index) {
                    final taskReq = cachedTasks[index];
                    return ListTile(
                      title: Text(taskReq.name ?? 'no_name'.tr()),
                      subtitle: Text(taskReq.description ?? ''),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.pop(ctx);

                        final dummyTask = TaskItem.fromJson({
                          "id": -(DateTime.now().millisecondsSinceEpoch.remainder(100000)),
                          "name": taskReq.name ?? '',
                          "description": taskReq.description ?? '',
                          "status": taskReq.status ?? 'Pending',
                          "due_date": taskReq.dueDate ?? '',
                          "project": {
                            "id": -1,
                            "name": "",
                            "owner_name": "",
                            "start_date": "",
                            "end_date": "",
                            "latitude": null,
                            "longitude": null,
                            "description": null,
                            "location": null,
                            "extra_details": null,
                            "contract_value": null,
                            "currency": null,
                            "progress_percentage": 0,
                            "project_phases": null,
                            "created_at": "",
                            "updated_at": ""
                          },
                          "worker": null,
                          "project_phase": null
                        });

                        final tasksCubit = AppLocator().call()<TasksCubit>();
                        appRouter.push(AddEditTasksRoute(args: AddEditTasksRouteArgs(
                          dummyTask,
                          tasksCubit,
                          const AdminTasksData(AdminTaskType.today)
                        )));
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
