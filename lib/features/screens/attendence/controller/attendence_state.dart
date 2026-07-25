part of 'attendence_cubit.dart';

@immutable
abstract class AttendenceState {}

class AttendenceLoaded extends AttendenceState {

  AttendenceLoaded({
    this.getCurrentAttendenceState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , getCurrentAttendenceState;
  final AttendenceState? refreshOrInit;

  AttendenceLoaded copyWith({
    BaseEmit? getCurrentAttendenceState,
    BaseEmit? allWorkersEmit, 
    AttendenceState? refreshOrInit,
  }) {
    return AttendenceLoaded(
      getCurrentAttendenceState: getCurrentAttendenceState ?? this.getCurrentAttendenceState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
