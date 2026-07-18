import 'package:mkaweel/core/api_helper/caller_tag.dart';
import 'package:mkaweel/core/constants/app_typedef.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/statistics_res/statistics_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/suppliers_res/suppliers_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/waste_calc_paremeter.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/waste_calc_res/waste_calc_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/repo/remote/dashboard_repo.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/weather_parameter.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/weather_res/weather_res.dart';

import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:mkaweel/core/shared/methods/location_Service.dart';
import 'package:dartz/dartz.dart';

class DashboardService extends BaseService {
  DashboardService(this._remoteRepo, this._localRepo);
  
  final DashboardRepo _remoteRepo;
  final BaseLocalRepo _localRepo;


  Future<void> calculateWastePercentageServ(
      RequestCallbackObserver<WasteCalcRes, WasteCalcParemeter> requestInfo,
      ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.calculatewastepercentageApi(
        requestInfo.parameter,
        cancelToken: token,
      ),

    );
  }

  Future<void> getSuppliersServ(
    RequestCallbackObserver<SuppliersRes, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getSuppliersKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getSuppliersApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return SuppliersRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey,  savedData:newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }

  Future<void> getStatisticsServ(
    RequestCallbackObserver<StatisticsRes, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getStatisticsKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getStatisticsApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId&&tuple?.$1['sec'] == _localRepo.secondarySessionId) {
          return StatisticsRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey,  savedData:newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }

  Future<void> getWeatherServ(
    RequestCallbackObserver<WeatherRes, WeatherParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getWeatherKeyCash;
    const latLngCacheKey = AppConstant.getLatLngKeyCash;

    return requestInfo.handleRequest(
      fetchFromClient: (token) async {
        WeatherParameter? param = requestInfo.parameter;

        if (param == null) {
          // Try to get from cache first
          final cachedLatLng = await _localRepo.readData(latLngCacheKey);
          if (cachedLatLng != null && cachedLatLng.$2.containsKey('lat') && cachedLatLng.$2.containsKey('lng')) {
            param = WeatherParameter(
              latitude: double.parse(cachedLatLng.$2['lat'].toString()),
              longitude:double.parse(cachedLatLng.$2['lng'].toString())  ,
            );
          } else {
            // Get from GPS
            final position = await LocationService().getCurrentLocation();
            if (position != null) {
              param = WeatherParameter(
                latitude: position.latitude,
                longitude: position.longitude,
              );
              // Cache it
              await _localRepo.saveData(latLngCacheKey, savedData: param.toJson());
            }
          }
        }

        if (param == null) {
          return const Left<Failure, WeatherRes>(Failure( 'Could not get location',   0));
        }

        return _remoteRepo.getWeatherApi(
          param,
          cancelToken: token,
        );
      },
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);
        // PrintHelper().loggerPrint(tuple?.$1['pr'],.info,callerTag());

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return WeatherRes.fromJson(tuple!.$2);
        }
        return null;
      },

      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey, savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }
}
