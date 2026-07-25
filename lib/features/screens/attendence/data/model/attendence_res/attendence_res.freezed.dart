// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendence_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendenceRes _$AttendenceResFromJson(Map<String, dynamic> json) {
  return _AttendenceRes.fromJson(json);
}

/// @nodoc
mixin _$AttendenceRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AttendenceData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendenceResCopyWith<AttendenceRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendenceResCopyWith<$Res> {
  factory $AttendenceResCopyWith(
          AttendenceRes value, $Res Function(AttendenceRes) then) =
      _$AttendenceResCopyWithImpl<$Res, AttendenceRes>;
  @useResult
  $Res call({String status, String message, AttendenceData data});

  $AttendenceDataCopyWith<$Res> get data;
}

/// @nodoc
class _$AttendenceResCopyWithImpl<$Res, $Val extends AttendenceRes>
    implements $AttendenceResCopyWith<$Res> {
  _$AttendenceResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AttendenceData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AttendenceDataCopyWith<$Res> get data {
    return $AttendenceDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendenceResImplCopyWith<$Res>
    implements $AttendenceResCopyWith<$Res> {
  factory _$$AttendenceResImplCopyWith(
          _$AttendenceResImpl value, $Res Function(_$AttendenceResImpl) then) =
      __$$AttendenceResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, AttendenceData data});

  @override
  $AttendenceDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$AttendenceResImplCopyWithImpl<$Res>
    extends _$AttendenceResCopyWithImpl<$Res, _$AttendenceResImpl>
    implements _$$AttendenceResImplCopyWith<$Res> {
  __$$AttendenceResImplCopyWithImpl(
      _$AttendenceResImpl _value, $Res Function(_$AttendenceResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$AttendenceResImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AttendenceData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendenceResImpl extends _AttendenceRes {
  const _$AttendenceResImpl(
      {required this.status, required this.message, required this.data})
      : super._();

  factory _$AttendenceResImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendenceResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final AttendenceData data;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendenceResImplCopyWith<_$AttendenceResImpl> get copyWith =>
      __$$AttendenceResImplCopyWithImpl<_$AttendenceResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendenceResImplToJson(
      this,
    );
  }
}

abstract class _AttendenceRes extends AttendenceRes {
  const factory _AttendenceRes(
      {required final String status,
      required final String message,
      required final AttendenceData data}) = _$AttendenceResImpl;
  const _AttendenceRes._() : super._();

  factory _AttendenceRes.fromJson(Map<String, dynamic> json) =
      _$AttendenceResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  AttendenceData get data;
  @override
  @JsonKey(ignore: true)
  _$$AttendenceResImplCopyWith<_$AttendenceResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AttendenceData _$AttendenceDataFromJson(Map<String, dynamic> json) {
  return _AttendenceData.fromJson(json);
}

/// @nodoc
mixin _$AttendenceData {
  int get worker_id => throw _privateConstructorUsedError;
  String get worker_name => throw _privateConstructorUsedError;
  bool get is_checked_in => throw _privateConstructorUsedError;
  bool get is_checked_in_this_project => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  Currentattendance get current_attendance =>
      throw _privateConstructorUsedError;
  Lastattendance get last_attendance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendenceDataCopyWith<AttendenceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendenceDataCopyWith<$Res> {
  factory $AttendenceDataCopyWith(
          AttendenceData value, $Res Function(AttendenceData) then) =
      _$AttendenceDataCopyWithImpl<$Res, AttendenceData>;
  @useResult
  $Res call(
      {int worker_id,
      String worker_name,
      bool is_checked_in,
      bool is_checked_in_this_project,
      String status,
      Currentattendance current_attendance,
      Lastattendance last_attendance});

  $CurrentattendanceCopyWith<$Res> get current_attendance;
  $LastattendanceCopyWith<$Res> get last_attendance;
}

/// @nodoc
class _$AttendenceDataCopyWithImpl<$Res, $Val extends AttendenceData>
    implements $AttendenceDataCopyWith<$Res> {
  _$AttendenceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? worker_id = null,
    Object? worker_name = null,
    Object? is_checked_in = null,
    Object? is_checked_in_this_project = null,
    Object? status = null,
    Object? current_attendance = null,
    Object? last_attendance = null,
  }) {
    return _then(_value.copyWith(
      worker_id: null == worker_id
          ? _value.worker_id
          : worker_id // ignore: cast_nullable_to_non_nullable
              as int,
      worker_name: null == worker_name
          ? _value.worker_name
          : worker_name // ignore: cast_nullable_to_non_nullable
              as String,
      is_checked_in: null == is_checked_in
          ? _value.is_checked_in
          : is_checked_in // ignore: cast_nullable_to_non_nullable
              as bool,
      is_checked_in_this_project: null == is_checked_in_this_project
          ? _value.is_checked_in_this_project
          : is_checked_in_this_project // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      current_attendance: null == current_attendance
          ? _value.current_attendance
          : current_attendance // ignore: cast_nullable_to_non_nullable
              as Currentattendance,
      last_attendance: null == last_attendance
          ? _value.last_attendance
          : last_attendance // ignore: cast_nullable_to_non_nullable
              as Lastattendance,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentattendanceCopyWith<$Res> get current_attendance {
    return $CurrentattendanceCopyWith<$Res>(_value.current_attendance, (value) {
      return _then(_value.copyWith(current_attendance: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LastattendanceCopyWith<$Res> get last_attendance {
    return $LastattendanceCopyWith<$Res>(_value.last_attendance, (value) {
      return _then(_value.copyWith(last_attendance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendenceDataImplCopyWith<$Res>
    implements $AttendenceDataCopyWith<$Res> {
  factory _$$AttendenceDataImplCopyWith(_$AttendenceDataImpl value,
          $Res Function(_$AttendenceDataImpl) then) =
      __$$AttendenceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int worker_id,
      String worker_name,
      bool is_checked_in,
      bool is_checked_in_this_project,
      String status,
      Currentattendance current_attendance,
      Lastattendance last_attendance});

  @override
  $CurrentattendanceCopyWith<$Res> get current_attendance;
  @override
  $LastattendanceCopyWith<$Res> get last_attendance;
}

/// @nodoc
class __$$AttendenceDataImplCopyWithImpl<$Res>
    extends _$AttendenceDataCopyWithImpl<$Res, _$AttendenceDataImpl>
    implements _$$AttendenceDataImplCopyWith<$Res> {
  __$$AttendenceDataImplCopyWithImpl(
      _$AttendenceDataImpl _value, $Res Function(_$AttendenceDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? worker_id = null,
    Object? worker_name = null,
    Object? is_checked_in = null,
    Object? is_checked_in_this_project = null,
    Object? status = null,
    Object? current_attendance = null,
    Object? last_attendance = null,
  }) {
    return _then(_$AttendenceDataImpl(
      worker_id: null == worker_id
          ? _value.worker_id
          : worker_id // ignore: cast_nullable_to_non_nullable
              as int,
      worker_name: null == worker_name
          ? _value.worker_name
          : worker_name // ignore: cast_nullable_to_non_nullable
              as String,
      is_checked_in: null == is_checked_in
          ? _value.is_checked_in
          : is_checked_in // ignore: cast_nullable_to_non_nullable
              as bool,
      is_checked_in_this_project: null == is_checked_in_this_project
          ? _value.is_checked_in_this_project
          : is_checked_in_this_project // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      current_attendance: null == current_attendance
          ? _value.current_attendance
          : current_attendance // ignore: cast_nullable_to_non_nullable
              as Currentattendance,
      last_attendance: null == last_attendance
          ? _value.last_attendance
          : last_attendance // ignore: cast_nullable_to_non_nullable
              as Lastattendance,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendenceDataImpl extends _AttendenceData {
  const _$AttendenceDataImpl(
      {required this.worker_id,
      required this.worker_name,
      required this.is_checked_in,
      required this.is_checked_in_this_project,
      required this.status,
      required this.current_attendance,
      required this.last_attendance})
      : super._();

  factory _$AttendenceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendenceDataImplFromJson(json);

  @override
  final int worker_id;
  @override
  final String worker_name;
  @override
  final bool is_checked_in;
  @override
  final bool is_checked_in_this_project;
  @override
  final String status;
  @override
  final Currentattendance current_attendance;
  @override
  final Lastattendance last_attendance;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendenceDataImplCopyWith<_$AttendenceDataImpl> get copyWith =>
      __$$AttendenceDataImplCopyWithImpl<_$AttendenceDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendenceDataImplToJson(
      this,
    );
  }
}

abstract class _AttendenceData extends AttendenceData {
  const factory _AttendenceData(
      {required final int worker_id,
      required final String worker_name,
      required final bool is_checked_in,
      required final bool is_checked_in_this_project,
      required final String status,
      required final Currentattendance current_attendance,
      required final Lastattendance last_attendance}) = _$AttendenceDataImpl;
  const _AttendenceData._() : super._();

  factory _AttendenceData.fromJson(Map<String, dynamic> json) =
      _$AttendenceDataImpl.fromJson;

  @override
  int get worker_id;
  @override
  String get worker_name;
  @override
  bool get is_checked_in;
  @override
  bool get is_checked_in_this_project;
  @override
  String get status;
  @override
  Currentattendance get current_attendance;
  @override
  Lastattendance get last_attendance;
  @override
  @JsonKey(ignore: true)
  _$$AttendenceDataImplCopyWith<_$AttendenceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Currentattendance _$CurrentattendanceFromJson(Map<String, dynamic> json) {
  return _Currentattendance.fromJson(json);
}

/// @nodoc
mixin _$Currentattendance {
  int get id => throw _privateConstructorUsedError;
  int get worker_id => throw _privateConstructorUsedError;
  int get project_id => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get check_in_time => throw _privateConstructorUsedError;
  String? get check_out_time => throw _privateConstructorUsedError;
  String? get check_in_latitude => throw _privateConstructorUsedError;
  String? get check_in_longitude => throw _privateConstructorUsedError;
  String? get check_out_latitude => throw _privateConstructorUsedError;
  String? get check_out_longitude => throw _privateConstructorUsedError;
  String? get work_done => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;
  Project get project => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentattendanceCopyWith<Currentattendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentattendanceCopyWith<$Res> {
  factory $CurrentattendanceCopyWith(
          Currentattendance value, $Res Function(Currentattendance) then) =
      _$CurrentattendanceCopyWithImpl<$Res, Currentattendance>;
  @useResult
  $Res call(
      {int id,
      int worker_id,
      int project_id,
      String? date,
      String? check_in_time,
      String? check_out_time,
      String? check_in_latitude,
      String? check_in_longitude,
      String? check_out_latitude,
      String? check_out_longitude,
      String? work_done,
      String created_at,
      String updated_at,
      Project project});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$CurrentattendanceCopyWithImpl<$Res, $Val extends Currentattendance>
    implements $CurrentattendanceCopyWith<$Res> {
  _$CurrentattendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? worker_id = null,
    Object? project_id = null,
    Object? date = freezed,
    Object? check_in_time = freezed,
    Object? check_out_time = freezed,
    Object? check_in_latitude = freezed,
    Object? check_in_longitude = freezed,
    Object? check_out_latitude = freezed,
    Object? check_out_longitude = freezed,
    Object? work_done = freezed,
    Object? created_at = null,
    Object? updated_at = null,
    Object? project = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      worker_id: null == worker_id
          ? _value.worker_id
          : worker_id // ignore: cast_nullable_to_non_nullable
              as int,
      project_id: null == project_id
          ? _value.project_id
          : project_id // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      check_in_time: freezed == check_in_time
          ? _value.check_in_time
          : check_in_time // ignore: cast_nullable_to_non_nullable
              as String?,
      check_out_time: freezed == check_out_time
          ? _value.check_out_time
          : check_out_time // ignore: cast_nullable_to_non_nullable
              as String?,
      check_in_latitude: freezed == check_in_latitude
          ? _value.check_in_latitude
          : check_in_latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      check_in_longitude: freezed == check_in_longitude
          ? _value.check_in_longitude
          : check_in_longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      check_out_latitude: freezed == check_out_latitude
          ? _value.check_out_latitude
          : check_out_latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      check_out_longitude: freezed == check_out_longitude
          ? _value.check_out_longitude
          : check_out_longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      work_done: freezed == work_done
          ? _value.work_done
          : work_done // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrentattendanceImplCopyWith<$Res>
    implements $CurrentattendanceCopyWith<$Res> {
  factory _$$CurrentattendanceImplCopyWith(_$CurrentattendanceImpl value,
          $Res Function(_$CurrentattendanceImpl) then) =
      __$$CurrentattendanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int worker_id,
      int project_id,
      String? date,
      String? check_in_time,
      String? check_out_time,
      String? check_in_latitude,
      String? check_in_longitude,
      String? check_out_latitude,
      String? check_out_longitude,
      String? work_done,
      String created_at,
      String updated_at,
      Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$CurrentattendanceImplCopyWithImpl<$Res>
    extends _$CurrentattendanceCopyWithImpl<$Res, _$CurrentattendanceImpl>
    implements _$$CurrentattendanceImplCopyWith<$Res> {
  __$$CurrentattendanceImplCopyWithImpl(_$CurrentattendanceImpl _value,
      $Res Function(_$CurrentattendanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? worker_id = null,
    Object? project_id = null,
    Object? date = freezed,
    Object? check_in_time = freezed,
    Object? check_out_time = freezed,
    Object? check_in_latitude = freezed,
    Object? check_in_longitude = freezed,
    Object? check_out_latitude = freezed,
    Object? check_out_longitude = freezed,
    Object? work_done = freezed,
    Object? created_at = null,
    Object? updated_at = null,
    Object? project = null,
  }) {
    return _then(_$CurrentattendanceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      worker_id: null == worker_id
          ? _value.worker_id
          : worker_id // ignore: cast_nullable_to_non_nullable
              as int,
      project_id: null == project_id
          ? _value.project_id
          : project_id // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      check_in_time: freezed == check_in_time
          ? _value.check_in_time
          : check_in_time // ignore: cast_nullable_to_non_nullable
              as String?,
      check_out_time: freezed == check_out_time
          ? _value.check_out_time
          : check_out_time // ignore: cast_nullable_to_non_nullable
              as String?,
      check_in_latitude: freezed == check_in_latitude
          ? _value.check_in_latitude
          : check_in_latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      check_in_longitude: freezed == check_in_longitude
          ? _value.check_in_longitude
          : check_in_longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      check_out_latitude: freezed == check_out_latitude
          ? _value.check_out_latitude
          : check_out_latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      check_out_longitude: freezed == check_out_longitude
          ? _value.check_out_longitude
          : check_out_longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      work_done: freezed == work_done
          ? _value.work_done
          : work_done // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentattendanceImpl extends _Currentattendance {
  const _$CurrentattendanceImpl(
      {required this.id,
      required this.worker_id,
      required this.project_id,
      required this.date,
      required this.check_in_time,
      required this.check_out_time,
      required this.check_in_latitude,
      required this.check_in_longitude,
      required this.check_out_latitude,
      required this.check_out_longitude,
      required this.work_done,
      required this.created_at,
      required this.updated_at,
      required this.project})
      : super._();

  factory _$CurrentattendanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentattendanceImplFromJson(json);

  @override
  final int id;
  @override
  final int worker_id;
  @override
  final int project_id;
  @override
  final String? date;
  @override
  final String? check_in_time;
  @override
  final String? check_out_time;
  @override
  final String? check_in_latitude;
  @override
  final String? check_in_longitude;
  @override
  final String? check_out_latitude;
  @override
  final String? check_out_longitude;
  @override
  final String? work_done;
  @override
  final String created_at;
  @override
  final String updated_at;
  @override
  final Project project;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentattendanceImplCopyWith<_$CurrentattendanceImpl> get copyWith =>
      __$$CurrentattendanceImplCopyWithImpl<_$CurrentattendanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentattendanceImplToJson(
      this,
    );
  }
}

abstract class _Currentattendance extends Currentattendance {
  const factory _Currentattendance(
      {required final int id,
      required final int worker_id,
      required final int project_id,
      required final String? date,
      required final String? check_in_time,
      required final String? check_out_time,
      required final String? check_in_latitude,
      required final String? check_in_longitude,
      required final String? check_out_latitude,
      required final String? check_out_longitude,
      required final String? work_done,
      required final String created_at,
      required final String updated_at,
      required final Project project}) = _$CurrentattendanceImpl;
  const _Currentattendance._() : super._();

  factory _Currentattendance.fromJson(Map<String, dynamic> json) =
      _$CurrentattendanceImpl.fromJson;

  @override
  int get id;
  @override
  int get worker_id;
  @override
  int get project_id;
  @override
  String? get date;
  @override
  String? get check_in_time;
  @override
  String? get check_out_time;
  @override
  String? get check_in_latitude;
  @override
  String? get check_in_longitude;
  @override
  String? get check_out_latitude;
  @override
  String? get check_out_longitude;
  @override
  String? get work_done;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  _$$CurrentattendanceImplCopyWith<_$CurrentattendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get owner_name => throw _privateConstructorUsedError;
  String get start_date => throw _privateConstructorUsedError;
  String get end_date => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  dynamic get location => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get extra_details => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get contract_value => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;
  double get progress_percentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {int id,
      String name,
      String owner_name,
      String start_date,
      String end_date,
      String latitude,
      String longitude,
      dynamic location,
      String description,
      String extra_details,
      String currency,
      String contract_value,
      String created_at,
      String updated_at,
      double progress_percentage});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? owner_name = null,
    Object? start_date = null,
    Object? end_date = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? location = freezed,
    Object? description = null,
    Object? extra_details = null,
    Object? currency = null,
    Object? contract_value = null,
    Object? created_at = null,
    Object? updated_at = null,
    Object? progress_percentage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner_name: null == owner_name
          ? _value.owner_name
          : owner_name // ignore: cast_nullable_to_non_nullable
              as String,
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      extra_details: null == extra_details
          ? _value.extra_details
          : extra_details // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      contract_value: null == contract_value
          ? _value.contract_value
          : contract_value // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      progress_percentage: null == progress_percentage
          ? _value.progress_percentage
          : progress_percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
          _$ProjectImpl value, $Res Function(_$ProjectImpl) then) =
      __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String owner_name,
      String start_date,
      String end_date,
      String latitude,
      String longitude,
      dynamic location,
      String description,
      String extra_details,
      String currency,
      String contract_value,
      String created_at,
      String updated_at,
      double progress_percentage});
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? owner_name = null,
    Object? start_date = null,
    Object? end_date = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? location = freezed,
    Object? description = null,
    Object? extra_details = null,
    Object? currency = null,
    Object? contract_value = null,
    Object? created_at = null,
    Object? updated_at = null,
    Object? progress_percentage = null,
  }) {
    return _then(_$ProjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner_name: null == owner_name
          ? _value.owner_name
          : owner_name // ignore: cast_nullable_to_non_nullable
              as String,
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      extra_details: null == extra_details
          ? _value.extra_details
          : extra_details // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      contract_value: null == contract_value
          ? _value.contract_value
          : contract_value // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      progress_percentage: null == progress_percentage
          ? _value.progress_percentage
          : progress_percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl extends _Project {
  const _$ProjectImpl(
      {required this.id,
      required this.name,
      required this.owner_name,
      required this.start_date,
      required this.end_date,
      required this.latitude,
      required this.longitude,
      required this.location,
      required this.description,
      required this.extra_details,
      required this.currency,
      required this.contract_value,
      required this.created_at,
      required this.updated_at,
      required this.progress_percentage})
      : super._();

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String owner_name;
  @override
  final String start_date;
  @override
  final String end_date;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final dynamic location;
  @override
  final String description;
  @override
  final String extra_details;
  @override
  final String currency;
  @override
  final String contract_value;
  @override
  final String created_at;
  @override
  final String updated_at;
  @override
  final double progress_percentage;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(
      this,
    );
  }
}

abstract class _Project extends Project {
  const factory _Project(
      {required final int id,
      required final String name,
      required final String owner_name,
      required final String start_date,
      required final String end_date,
      required final String latitude,
      required final String longitude,
      required final dynamic location,
      required final String description,
      required final String extra_details,
      required final String currency,
      required final String contract_value,
      required final String created_at,
      required final String updated_at,
      required final double progress_percentage}) = _$ProjectImpl;
  const _Project._() : super._();

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get owner_name;
  @override
  String get start_date;
  @override
  String get end_date;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  dynamic get location;
  @override
  String get description;
  @override
  String get extra_details;
  @override
  String get currency;
  @override
  String get contract_value;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  double get progress_percentage;
  @override
  @JsonKey(ignore: true)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Lastattendance _$LastattendanceFromJson(Map<String, dynamic> json) {
  return _Lastattendance.fromJson(json);
}

/// @nodoc
mixin _$Lastattendance {
  int get id => throw _privateConstructorUsedError;
  int get worker_id => throw _privateConstructorUsedError;
  int get project_id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get check_in_time => throw _privateConstructorUsedError;
  String get check_out_time => throw _privateConstructorUsedError;
  String get check_in_latitude => throw _privateConstructorUsedError;
  String get check_in_longitude => throw _privateConstructorUsedError;
  String get check_out_latitude => throw _privateConstructorUsedError;
  String get check_out_longitude => throw _privateConstructorUsedError;
  String get work_done => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;
  Project get project => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastattendanceCopyWith<Lastattendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastattendanceCopyWith<$Res> {
  factory $LastattendanceCopyWith(
          Lastattendance value, $Res Function(Lastattendance) then) =
      _$LastattendanceCopyWithImpl<$Res, Lastattendance>;
  @useResult
  $Res call(
      {int id,
      int worker_id,
      int project_id,
      String date,
      String check_in_time,
      String check_out_time,
      String check_in_latitude,
      String check_in_longitude,
      String check_out_latitude,
      String check_out_longitude,
      String work_done,
      String created_at,
      String updated_at,
      Project project});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$LastattendanceCopyWithImpl<$Res, $Val extends Lastattendance>
    implements $LastattendanceCopyWith<$Res> {
  _$LastattendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? worker_id = null,
    Object? project_id = null,
    Object? date = null,
    Object? check_in_time = null,
    Object? check_out_time = null,
    Object? check_in_latitude = null,
    Object? check_in_longitude = null,
    Object? check_out_latitude = null,
    Object? check_out_longitude = null,
    Object? work_done = null,
    Object? created_at = null,
    Object? updated_at = null,
    Object? project = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      worker_id: null == worker_id
          ? _value.worker_id
          : worker_id // ignore: cast_nullable_to_non_nullable
              as int,
      project_id: null == project_id
          ? _value.project_id
          : project_id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      check_in_time: null == check_in_time
          ? _value.check_in_time
          : check_in_time // ignore: cast_nullable_to_non_nullable
              as String,
      check_out_time: null == check_out_time
          ? _value.check_out_time
          : check_out_time // ignore: cast_nullable_to_non_nullable
              as String,
      check_in_latitude: null == check_in_latitude
          ? _value.check_in_latitude
          : check_in_latitude // ignore: cast_nullable_to_non_nullable
              as String,
      check_in_longitude: null == check_in_longitude
          ? _value.check_in_longitude
          : check_in_longitude // ignore: cast_nullable_to_non_nullable
              as String,
      check_out_latitude: null == check_out_latitude
          ? _value.check_out_latitude
          : check_out_latitude // ignore: cast_nullable_to_non_nullable
              as String,
      check_out_longitude: null == check_out_longitude
          ? _value.check_out_longitude
          : check_out_longitude // ignore: cast_nullable_to_non_nullable
              as String,
      work_done: null == work_done
          ? _value.work_done
          : work_done // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LastattendanceImplCopyWith<$Res>
    implements $LastattendanceCopyWith<$Res> {
  factory _$$LastattendanceImplCopyWith(_$LastattendanceImpl value,
          $Res Function(_$LastattendanceImpl) then) =
      __$$LastattendanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int worker_id,
      int project_id,
      String date,
      String check_in_time,
      String check_out_time,
      String check_in_latitude,
      String check_in_longitude,
      String check_out_latitude,
      String check_out_longitude,
      String work_done,
      String created_at,
      String updated_at,
      Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$LastattendanceImplCopyWithImpl<$Res>
    extends _$LastattendanceCopyWithImpl<$Res, _$LastattendanceImpl>
    implements _$$LastattendanceImplCopyWith<$Res> {
  __$$LastattendanceImplCopyWithImpl(
      _$LastattendanceImpl _value, $Res Function(_$LastattendanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? worker_id = null,
    Object? project_id = null,
    Object? date = null,
    Object? check_in_time = null,
    Object? check_out_time = null,
    Object? check_in_latitude = null,
    Object? check_in_longitude = null,
    Object? check_out_latitude = null,
    Object? check_out_longitude = null,
    Object? work_done = null,
    Object? created_at = null,
    Object? updated_at = null,
    Object? project = null,
  }) {
    return _then(_$LastattendanceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      worker_id: null == worker_id
          ? _value.worker_id
          : worker_id // ignore: cast_nullable_to_non_nullable
              as int,
      project_id: null == project_id
          ? _value.project_id
          : project_id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      check_in_time: null == check_in_time
          ? _value.check_in_time
          : check_in_time // ignore: cast_nullable_to_non_nullable
              as String,
      check_out_time: null == check_out_time
          ? _value.check_out_time
          : check_out_time // ignore: cast_nullable_to_non_nullable
              as String,
      check_in_latitude: null == check_in_latitude
          ? _value.check_in_latitude
          : check_in_latitude // ignore: cast_nullable_to_non_nullable
              as String,
      check_in_longitude: null == check_in_longitude
          ? _value.check_in_longitude
          : check_in_longitude // ignore: cast_nullable_to_non_nullable
              as String,
      check_out_latitude: null == check_out_latitude
          ? _value.check_out_latitude
          : check_out_latitude // ignore: cast_nullable_to_non_nullable
              as String,
      check_out_longitude: null == check_out_longitude
          ? _value.check_out_longitude
          : check_out_longitude // ignore: cast_nullable_to_non_nullable
              as String,
      work_done: null == work_done
          ? _value.work_done
          : work_done // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LastattendanceImpl extends _Lastattendance {
  const _$LastattendanceImpl(
      {required this.id,
      required this.worker_id,
      required this.project_id,
      required this.date,
      required this.check_in_time,
      required this.check_out_time,
      required this.check_in_latitude,
      required this.check_in_longitude,
      required this.check_out_latitude,
      required this.check_out_longitude,
      required this.work_done,
      required this.created_at,
      required this.updated_at,
      required this.project})
      : super._();

  factory _$LastattendanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$LastattendanceImplFromJson(json);

  @override
  final int id;
  @override
  final int worker_id;
  @override
  final int project_id;
  @override
  final String date;
  @override
  final String check_in_time;
  @override
  final String check_out_time;
  @override
  final String check_in_latitude;
  @override
  final String check_in_longitude;
  @override
  final String check_out_latitude;
  @override
  final String check_out_longitude;
  @override
  final String work_done;
  @override
  final String created_at;
  @override
  final String updated_at;
  @override
  final Project project;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LastattendanceImplCopyWith<_$LastattendanceImpl> get copyWith =>
      __$$LastattendanceImplCopyWithImpl<_$LastattendanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LastattendanceImplToJson(
      this,
    );
  }
}

abstract class _Lastattendance extends Lastattendance {
  const factory _Lastattendance(
      {required final int id,
      required final int worker_id,
      required final int project_id,
      required final String date,
      required final String check_in_time,
      required final String check_out_time,
      required final String check_in_latitude,
      required final String check_in_longitude,
      required final String check_out_latitude,
      required final String check_out_longitude,
      required final String work_done,
      required final String created_at,
      required final String updated_at,
      required final Project project}) = _$LastattendanceImpl;
  const _Lastattendance._() : super._();

  factory _Lastattendance.fromJson(Map<String, dynamic> json) =
      _$LastattendanceImpl.fromJson;

  @override
  int get id;
  @override
  int get worker_id;
  @override
  int get project_id;
  @override
  String get date;
  @override
  String get check_in_time;
  @override
  String get check_out_time;
  @override
  String get check_in_latitude;
  @override
  String get check_in_longitude;
  @override
  String get check_out_latitude;
  @override
  String get check_out_longitude;
  @override
  String get work_done;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  _$$LastattendanceImplCopyWith<_$LastattendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
