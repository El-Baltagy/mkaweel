// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TasksRes _$TasksResFromJson(Map<String, dynamic> json) {
  return _TasksRes.fromJson(json);
}

/// @nodoc
mixin _$TasksRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<TaskItem> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TasksResCopyWith<TasksRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksResCopyWith<$Res> {
  factory $TasksResCopyWith(TasksRes value, $Res Function(TasksRes) then) =
      _$TasksResCopyWithImpl<$Res, TasksRes>;
  @useResult
  $Res call({String status, String message, List<TaskItem> data});
}

/// @nodoc
class _$TasksResCopyWithImpl<$Res, $Val extends TasksRes>
    implements $TasksResCopyWith<$Res> {
  _$TasksResCopyWithImpl(this._value, this._then);

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
              as List<TaskItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TasksResImplCopyWith<$Res>
    implements $TasksResCopyWith<$Res> {
  factory _$$TasksResImplCopyWith(
          _$TasksResImpl value, $Res Function(_$TasksResImpl) then) =
      __$$TasksResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, List<TaskItem> data});
}

/// @nodoc
class __$$TasksResImplCopyWithImpl<$Res>
    extends _$TasksResCopyWithImpl<$Res, _$TasksResImpl>
    implements _$$TasksResImplCopyWith<$Res> {
  __$$TasksResImplCopyWithImpl(
      _$TasksResImpl _value, $Res Function(_$TasksResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$TasksResImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TaskItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TasksResImpl extends _TasksRes {
  const _$TasksResImpl(
      {required this.status,
      required this.message,
      required final List<TaskItem> data})
      : _data = data,
        super._();

  factory _$TasksResImpl.fromJson(Map<String, dynamic> json) =>
      _$$TasksResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  final List<TaskItem> _data;
  @override
  List<TaskItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksResImplCopyWith<_$TasksResImpl> get copyWith =>
      __$$TasksResImplCopyWithImpl<_$TasksResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TasksResImplToJson(
      this,
    );
  }
}

abstract class _TasksRes extends TasksRes {
  const factory _TasksRes(
      {required final String status,
      required final String message,
      required final List<TaskItem> data}) = _$TasksResImpl;
  const _TasksRes._() : super._();

  factory _TasksRes.fromJson(Map<String, dynamic> json) =
      _$TasksResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  List<TaskItem> get data;
  @override
  @JsonKey(ignore: true)
  _$$TasksResImplCopyWith<_$TasksResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskItem _$TaskItemFromJson(Map<String, dynamic> json) {
  return _TaskItem.fromJson(json);
}

/// @nodoc
mixin _$TaskItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get due_date => throw _privateConstructorUsedError;
  ProjectInfoData get project => throw _privateConstructorUsedError;
  Worker get worker => throw _privateConstructorUsedError;
  ProjectphaseItem get project_phase => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskItemCopyWith<TaskItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskItemCopyWith<$Res> {
  factory $TaskItemCopyWith(TaskItem value, $Res Function(TaskItem) then) =
      _$TaskItemCopyWithImpl<$Res, TaskItem>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String status,
      String due_date,
      ProjectInfoData project,
      Worker worker,
      ProjectphaseItem project_phase});

  $ProjectInfoDataCopyWith<$Res> get project;
  $WorkerCopyWith<$Res> get worker;
  $ProjectphaseItemCopyWith<$Res> get project_phase;
}

/// @nodoc
class _$TaskItemCopyWithImpl<$Res, $Val extends TaskItem>
    implements $TaskItemCopyWith<$Res> {
  _$TaskItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? status = null,
    Object? due_date = null,
    Object? project = null,
    Object? worker = null,
    Object? project_phase = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      due_date: null == due_date
          ? _value.due_date
          : due_date // ignore: cast_nullable_to_non_nullable
              as String,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectInfoData,
      worker: null == worker
          ? _value.worker
          : worker // ignore: cast_nullable_to_non_nullable
              as Worker,
      project_phase: null == project_phase
          ? _value.project_phase
          : project_phase // ignore: cast_nullable_to_non_nullable
              as ProjectphaseItem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectInfoDataCopyWith<$Res> get project {
    return $ProjectInfoDataCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkerCopyWith<$Res> get worker {
    return $WorkerCopyWith<$Res>(_value.worker, (value) {
      return _then(_value.copyWith(worker: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectphaseItemCopyWith<$Res> get project_phase {
    return $ProjectphaseItemCopyWith<$Res>(_value.project_phase, (value) {
      return _then(_value.copyWith(project_phase: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskItemImplCopyWith<$Res>
    implements $TaskItemCopyWith<$Res> {
  factory _$$TaskItemImplCopyWith(
          _$TaskItemImpl value, $Res Function(_$TaskItemImpl) then) =
      __$$TaskItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String status,
      String due_date,
      ProjectInfoData project,
      Worker worker,
      ProjectphaseItem project_phase});

  @override
  $ProjectInfoDataCopyWith<$Res> get project;
  @override
  $WorkerCopyWith<$Res> get worker;
  @override
  $ProjectphaseItemCopyWith<$Res> get project_phase;
}

/// @nodoc
class __$$TaskItemImplCopyWithImpl<$Res>
    extends _$TaskItemCopyWithImpl<$Res, _$TaskItemImpl>
    implements _$$TaskItemImplCopyWith<$Res> {
  __$$TaskItemImplCopyWithImpl(
      _$TaskItemImpl _value, $Res Function(_$TaskItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? status = null,
    Object? due_date = null,
    Object? project = null,
    Object? worker = null,
    Object? project_phase = null,
  }) {
    return _then(_$TaskItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      due_date: null == due_date
          ? _value.due_date
          : due_date // ignore: cast_nullable_to_non_nullable
              as String,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectInfoData,
      worker: null == worker
          ? _value.worker
          : worker // ignore: cast_nullable_to_non_nullable
              as Worker,
      project_phase: null == project_phase
          ? _value.project_phase
          : project_phase // ignore: cast_nullable_to_non_nullable
              as ProjectphaseItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskItemImpl extends _TaskItem {
  const _$TaskItemImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.status,
      required this.due_date,
      required this.project,
      required this.worker,
      required this.project_phase})
      : super._();

  factory _$TaskItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String status;
  @override
  final String due_date;
  @override
  final ProjectInfoData project;
  @override
  final Worker worker;
  @override
  final ProjectphaseItem project_phase;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskItemImplCopyWith<_$TaskItemImpl> get copyWith =>
      __$$TaskItemImplCopyWithImpl<_$TaskItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskItemImplToJson(
      this,
    );
  }
}

abstract class _TaskItem extends TaskItem {
  const factory _TaskItem(
      {required final int id,
      required final String name,
      required final String description,
      required final String status,
      required final String due_date,
      required final ProjectInfoData project,
      required final Worker worker,
      required final ProjectphaseItem project_phase}) = _$TaskItemImpl;
  const _TaskItem._() : super._();

  factory _TaskItem.fromJson(Map<String, dynamic> json) =
      _$TaskItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get status;
  @override
  String get due_date;
  @override
  ProjectInfoData get project;
  @override
  Worker get worker;
  @override
  ProjectphaseItem get project_phase;
  @override
  @JsonKey(ignore: true)
  _$$TaskItemImplCopyWith<_$TaskItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Worker _$WorkerFromJson(Map<String, dynamic> json) {
  return _Worker.fromJson(json);
}

/// @nodoc
mixin _$Worker {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get specialization => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkerCopyWith<Worker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerCopyWith<$Res> {
  factory $WorkerCopyWith(Worker value, $Res Function(Worker) then) =
      _$WorkerCopyWithImpl<$Res, Worker>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String dob,
      String phone,
      String specialization,
      String role,
      String avatar,
      String created_at,
      String updated_at});
}

/// @nodoc
class _$WorkerCopyWithImpl<$Res, $Val extends Worker>
    implements $WorkerCopyWith<$Res> {
  _$WorkerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? dob = null,
    Object? phone = null,
    Object? specialization = null,
    Object? role = null,
    Object? avatar = null,
    Object? created_at = null,
    Object? updated_at = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      specialization: null == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkerImplCopyWith<$Res> implements $WorkerCopyWith<$Res> {
  factory _$$WorkerImplCopyWith(
          _$WorkerImpl value, $Res Function(_$WorkerImpl) then) =
      __$$WorkerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String dob,
      String phone,
      String specialization,
      String role,
      String avatar,
      String created_at,
      String updated_at});
}

/// @nodoc
class __$$WorkerImplCopyWithImpl<$Res>
    extends _$WorkerCopyWithImpl<$Res, _$WorkerImpl>
    implements _$$WorkerImplCopyWith<$Res> {
  __$$WorkerImplCopyWithImpl(
      _$WorkerImpl _value, $Res Function(_$WorkerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? dob = null,
    Object? phone = null,
    Object? specialization = null,
    Object? role = null,
    Object? avatar = null,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(_$WorkerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      specialization: null == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkerImpl extends _Worker {
  const _$WorkerImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.dob,
      required this.phone,
      required this.specialization,
      required this.role,
      required this.avatar,
      required this.created_at,
      required this.updated_at})
      : super._();

  factory _$WorkerImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkerImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String dob;
  @override
  final String phone;
  @override
  final String specialization;
  @override
  final String role;
  @override
  final String avatar;
  @override
  final String created_at;
  @override
  final String updated_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
      __$$WorkerImplCopyWithImpl<_$WorkerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkerImplToJson(
      this,
    );
  }
}

abstract class _Worker extends Worker {
  const factory _Worker(
      {required final int id,
      required final String name,
      required final String email,
      required final String dob,
      required final String phone,
      required final String specialization,
      required final String role,
      required final String avatar,
      required final String created_at,
      required final String updated_at}) = _$WorkerImpl;
  const _Worker._() : super._();

  factory _Worker.fromJson(Map<String, dynamic> json) = _$WorkerImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get dob;
  @override
  String get phone;
  @override
  String get specialization;
  @override
  String get role;
  @override
  String get avatar;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  @JsonKey(ignore: true)
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
