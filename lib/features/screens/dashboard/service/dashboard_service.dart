import 'package:mkaweel/core/api_helper/caller_tag.dart';
import 'package:mkaweel/core/constants/app_typedef.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/create_invoice_parameter.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/ghant_data.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/ghant_res/ghant_res.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/invoice_res/invoice_res.dart';
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

    return requestInfo.handleRequest(
      fetchFromClient: (token) async {
        WeatherParameter? param = requestInfo.parameter;

           if(param==null){
             final position = await LocationService().getCurrentLocation();
             if (position != null) {
               param = WeatherParameter(
                 latitude: position.latitude,
                 longitude: position.longitude,
               );
             }
           }
        if (param == null) {
          return const Left<Failure, WeatherRes>(Failure( 'Could not get location',   0));
        }

        return _remoteRepo.getWeatherApi(
          param,
          cancelToken: token,
        );
      }
    );
  }

  Future<void> getGhantDataServ(
    RequestCallbackObserver<GhantRes, GhantParameter> requestInfo,
  ) {

    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getGhantDataApi(
        requestInfo.parameter,
        cancelToken: token,
      )
    );
  }

  Future<void> createInvoiceServ(
    RequestCallbackObserver<InvoiceRes, CreateInvoiceParameter> requestInfo,
  ) {
     return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.addEditInvoiceApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }
}
