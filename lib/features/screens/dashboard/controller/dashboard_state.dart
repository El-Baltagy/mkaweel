
import 'package:flutter/material.dart';
import 'package:mkaweel/core/base/base_state.dart';

@immutable
 abstract class DashboardState {}


/// Single combined state — both slices are always present together.
/// This prevents one request's emission from wiping the other's data.
class DashboardLoaded extends DashboardState {
  final BaseEmit? wasteCalcEmit , getSuppliersState;
  final DashboardState? refreshOrInit;

  DashboardLoaded({
    this.getSuppliersState,
    this.wasteCalcEmit,
    this.refreshOrInit,
  });

  DashboardLoaded copyWith({
    BaseEmit? getSuppliersState,
    BaseEmit? wasteCalcEmit,
    DashboardState? refreshOrInit,
  }) {
    return DashboardLoaded(
      getSuppliersState: getSuppliersState ?? this.getSuppliersState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
      wasteCalcEmit: wasteCalcEmit ?? this.wasteCalcEmit,
    );
  }
}
