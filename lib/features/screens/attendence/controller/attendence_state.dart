part of 'attendence_cubit.dart';

@immutable
abstract class AttendenceState {}

class AttendenceLoaded extends AttendenceState {

  AttendenceLoaded({
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit ;
  final AttendenceState? refreshOrInit;

  AttendenceLoaded copyWith({
    BaseEmit? allWorkersEmit, 
    AttendenceState? refreshOrInit,
  }) {
    return AttendenceLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
