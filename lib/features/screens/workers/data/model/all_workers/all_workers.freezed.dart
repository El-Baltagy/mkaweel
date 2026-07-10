// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_workers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllWorkers _$AllWorkersFromJson(Map<String, dynamic> json) {
  return _AllWorkers.fromJson(json);
}

/// @nodoc
mixin _$AllWorkers {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<WorkerItem> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllWorkersCopyWith<AllWorkers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllWorkersCopyWith<$Res> {
  factory $AllWorkersCopyWith(
          AllWorkers value, $Res Function(AllWorkers) then) =
      _$AllWorkersCopyWithImpl<$Res, AllWorkers>;
  @useResult
  $Res call({String status, String message, List<WorkerItem> data});
}

/// @nodoc
class _$AllWorkersCopyWithImpl<$Res, $Val extends AllWorkers>
    implements $AllWorkersCopyWith<$Res> {
  _$AllWorkersCopyWithImpl(this._value, this._then);

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
              as List<WorkerItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllWorkersImplCopyWith<$Res>
    implements $AllWorkersCopyWith<$Res> {
  factory _$$AllWorkersImplCopyWith(
          _$AllWorkersImpl value, $Res Function(_$AllWorkersImpl) then) =
      __$$AllWorkersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, List<WorkerItem> data});
}

/// @nodoc
class __$$AllWorkersImplCopyWithImpl<$Res>
    extends _$AllWorkersCopyWithImpl<$Res, _$AllWorkersImpl>
    implements _$$AllWorkersImplCopyWith<$Res> {
  __$$AllWorkersImplCopyWithImpl(
      _$AllWorkersImpl _value, $Res Function(_$AllWorkersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$AllWorkersImpl(
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
              as List<WorkerItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllWorkersImpl extends _AllWorkers {
  const _$AllWorkersImpl(
      {required this.status,
      required this.message,
      required final List<WorkerItem> data})
      : _data = data,
        super._();

  factory _$AllWorkersImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllWorkersImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  final List<WorkerItem> _data;
  @override
  List<WorkerItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllWorkersImplCopyWith<_$AllWorkersImpl> get copyWith =>
      __$$AllWorkersImplCopyWithImpl<_$AllWorkersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllWorkersImplToJson(
      this,
    );
  }
}

abstract class _AllWorkers extends AllWorkers {
  const factory _AllWorkers(
      {required final String status,
      required final String message,
      required final List<WorkerItem> data}) = _$AllWorkersImpl;
  const _AllWorkers._() : super._();

  factory _AllWorkers.fromJson(Map<String, dynamic> json) =
      _$AllWorkersImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  List<WorkerItem> get data;
  @override
  @JsonKey(ignore: true)
  _$$AllWorkersImplCopyWith<_$AllWorkersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkerItem _$WorkerItemFromJson(Map<String, dynamic> json) {
  return _WorkerItem.fromJson(json);
}

/// @nodoc
mixin _$WorkerItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get specialization => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  List<ProjectItem> get projects => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkerItemCopyWith<WorkerItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerItemCopyWith<$Res> {
  factory $WorkerItemCopyWith(
          WorkerItem value, $Res Function(WorkerItem) then) =
      _$WorkerItemCopyWithImpl<$Res, WorkerItem>;
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
      List<ProjectItem> projects,
      String created_at,
      String updated_at});
}

/// @nodoc
class _$WorkerItemCopyWithImpl<$Res, $Val extends WorkerItem>
    implements $WorkerItemCopyWith<$Res> {
  _$WorkerItemCopyWithImpl(this._value, this._then);

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
    Object? projects = null,
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
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectItem>,
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
abstract class _$$WorkerItemImplCopyWith<$Res>
    implements $WorkerItemCopyWith<$Res> {
  factory _$$WorkerItemImplCopyWith(
          _$WorkerItemImpl value, $Res Function(_$WorkerItemImpl) then) =
      __$$WorkerItemImplCopyWithImpl<$Res>;
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
      List<ProjectItem> projects,
      String created_at,
      String updated_at});
}

/// @nodoc
class __$$WorkerItemImplCopyWithImpl<$Res>
    extends _$WorkerItemCopyWithImpl<$Res, _$WorkerItemImpl>
    implements _$$WorkerItemImplCopyWith<$Res> {
  __$$WorkerItemImplCopyWithImpl(
      _$WorkerItemImpl _value, $Res Function(_$WorkerItemImpl) _then)
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
    Object? projects = null,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(_$WorkerItemImpl(
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
      projects: null == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectItem>,
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
class _$WorkerItemImpl extends _WorkerItem {
  const _$WorkerItemImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.dob,
      required this.phone,
      required this.specialization,
      required this.role,
      required this.avatar,
      required final List<ProjectItem> projects,
      required this.created_at,
      required this.updated_at})
      : _projects = projects,
        super._();

  factory _$WorkerItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkerItemImplFromJson(json);

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
  final List<ProjectItem> _projects;
  @override
  List<ProjectItem> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  final String created_at;
  @override
  final String updated_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerItemImplCopyWith<_$WorkerItemImpl> get copyWith =>
      __$$WorkerItemImplCopyWithImpl<_$WorkerItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkerItemImplToJson(
      this,
    );
  }
}

abstract class _WorkerItem extends WorkerItem {
  const factory _WorkerItem(
      {required final int id,
      required final String name,
      required final String email,
      required final String dob,
      required final String phone,
      required final String specialization,
      required final String role,
      required final String avatar,
      required final List<ProjectItem> projects,
      required final String created_at,
      required final String updated_at}) = _$WorkerItemImpl;
  const _WorkerItem._() : super._();

  factory _WorkerItem.fromJson(Map<String, dynamic> json) =
      _$WorkerItemImpl.fromJson;

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
  List<ProjectItem> get projects;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  @JsonKey(ignore: true)
  _$$WorkerItemImplCopyWith<_$WorkerItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectItem _$ProjectItemFromJson(Map<String, dynamic> json) {
  return _ProjectItem.fromJson(json);
}

/// @nodoc
mixin _$ProjectItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectItemCopyWith<ProjectItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectItemCopyWith<$Res> {
  factory $ProjectItemCopyWith(
          ProjectItem value, $Res Function(ProjectItem) then) =
      _$ProjectItemCopyWithImpl<$Res, ProjectItem>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$ProjectItemCopyWithImpl<$Res, $Val extends ProjectItem>
    implements $ProjectItemCopyWith<$Res> {
  _$ProjectItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectItemImplCopyWith<$Res>
    implements $ProjectItemCopyWith<$Res> {
  factory _$$ProjectItemImplCopyWith(
          _$ProjectItemImpl value, $Res Function(_$ProjectItemImpl) then) =
      __$$ProjectItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$ProjectItemImplCopyWithImpl<$Res>
    extends _$ProjectItemCopyWithImpl<$Res, _$ProjectItemImpl>
    implements _$$ProjectItemImplCopyWith<$Res> {
  __$$ProjectItemImplCopyWithImpl(
      _$ProjectItemImpl _value, $Res Function(_$ProjectItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$ProjectItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectItemImpl extends _ProjectItem {
  const _$ProjectItemImpl({required this.id, required this.name}) : super._();

  factory _$ProjectItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectItemImplCopyWith<_$ProjectItemImpl> get copyWith =>
      __$$ProjectItemImplCopyWithImpl<_$ProjectItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectItemImplToJson(
      this,
    );
  }
}

abstract class _ProjectItem extends ProjectItem {
  const factory _ProjectItem(
      {required final int id, required final String name}) = _$ProjectItemImpl;
  const _ProjectItem._() : super._();

  factory _ProjectItem.fromJson(Map<String, dynamic> json) =
      _$ProjectItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ProjectItemImplCopyWith<_$ProjectItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
