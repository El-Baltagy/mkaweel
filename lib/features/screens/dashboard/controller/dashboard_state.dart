
import 'package:flutter/material.dart';
import 'package:mkaweel/core/base/base_state.dart';

@immutable
import 'package:flutter/material.dart';
import 'package:mkaweel/core/base/base_state.dart';

@immutable
 abstract class DashboardState {}


/// Single combined state — both slices are always present together.
/// This prevents one request's emission from wiping the other's data.
class DashboardLoaded extends DashboardState {

  DashboardLoaded({
    this.getGhantDataState,
    this.getStatisticsState,
    this.getSuppliersState,
    this.wasteCalcEmit,
    this.getWeatherState,
    this.refreshOrInit,
  });
  final BaseEmit? wasteCalcEmit , getSuppliersState, getStatisticsState, getWeatherState;
    BaseEmit?  getGhantDataState;
  final DashboardState? refreshOrInit;

  DashboardLoaded copyWith({
    BaseEmit? getGhantDataState,
    BaseEmit? getStatisticsState,
    BaseEmit? getSuppliersState,
    BaseEmit? wasteCalcEmit,
    BaseEmit? getWeatherState,
    DashboardState? refreshOrInit,
  }) {
    return DashboardLoaded(
      getGhantDataState: getGhantDataState ?? this.getGhantDataState,
      getStatisticsState: getStatisticsState ?? this.getStatisticsState,
      getSuppliersState: getSuppliersState ?? this.getSuppliersState,
      getWeatherState: getWeatherState ?? this.getWeatherState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
      wasteCalcEmit: wasteCalcEmit ?? this.wasteCalcEmit,
    );
  }
}
