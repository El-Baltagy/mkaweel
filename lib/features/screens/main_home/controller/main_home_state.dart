
import 'package:flutter/material.dart';
import 'package:mkaweel/core/base/base_state.dart';

@immutable
abstract class MainHomeState {}

/// Single combined state — both slices are always present together.
/// This prevents one request's emission from wiping the other's data.
class MainHomeLoaded extends MainHomeState {

  MainHomeLoaded( {
    this.refreshOrInit, this.getProfileDataState,
});
    final MainHomeState? refreshOrInit;

    final BaseEmit? getProfileDataState;

  MainHomeLoaded copyWith({
    BaseEmit? getProfileDataState,
    MainHomeState? refreshOrInit,
  }) {
    return MainHomeLoaded(
      getProfileDataState: getProfileDataState ?? this.getProfileDataState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
     );
  }
}
