import 'package:mkaweel/core/base/base_state.dart';
part of 'make_bus_cubit.dart';

@immutable
abstract class MakeBusState {}

class MakeBusLoaded extends MakeBusState {

  MakeBusLoaded({
    this.getAllDataState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , getAllDataState;
  final MakeBusState? refreshOrInit;

  MakeBusLoaded copyWith({
    BaseEmit? getAllDataState,
    BaseEmit? allWorkersEmit, 
    MakeBusState? refreshOrInit,
  }) {
    return MakeBusLoaded(
      getAllDataState: getAllDataState ?? this.getAllDataState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
