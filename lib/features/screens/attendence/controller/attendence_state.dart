part of 'attendence_cubit.dart';

@immutable
abstract class AttendenceState {}

class AttendenceLoaded extends AttendenceState {

  AttendenceLoaded({
    this.checkInOutToogleState,
    this.getCurrentAttendenceState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , getCurrentAttendenceState, checkInOutToogleState;
  final AttendenceState? refreshOrInit;

  AttendenceLoaded copyWith({
    BaseEmit? checkInOutToogleState,
    BaseEmit? getCurrentAttendenceState,
    BaseEmit? allWorkersEmit, 
    AttendenceState? refreshOrInit,
  }) {
    return AttendenceLoaded(
      checkInOutToogleState: checkInOutToogleState ?? this.checkInOutToogleState,
      getCurrentAttendenceState: getCurrentAttendenceState ?? this.getCurrentAttendenceState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
