// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_phases_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectPhasesRes _$ProjectPhasesResFromJson(Map<String, dynamic> json) {
  return _ProjectPhasesRes.fromJson(json);
}

/// @nodoc
mixin _$ProjectPhasesRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ProjectphaseItem> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectPhasesResCopyWith<ProjectPhasesRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectPhasesResCopyWith<$Res> {
  factory $ProjectPhasesResCopyWith(
          ProjectPhasesRes value, $Res Function(ProjectPhasesRes) then) =
      _$ProjectPhasesResCopyWithImpl<$Res, ProjectPhasesRes>;
  @useResult
  $Res call({String status, String message, List<ProjectphaseItem> data});
}

/// @nodoc
class _$ProjectPhasesResCopyWithImpl<$Res, $Val extends ProjectPhasesRes>
    implements $ProjectPhasesResCopyWith<$Res> {
  _$ProjectPhasesResCopyWithImpl(this._value, this._then);

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
              as List<ProjectphaseItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectPhasesResImplCopyWith<$Res>
    implements $ProjectPhasesResCopyWith<$Res> {
  factory _$$ProjectPhasesResImplCopyWith(_$ProjectPhasesResImpl value,
          $Res Function(_$ProjectPhasesResImpl) then) =
      __$$ProjectPhasesResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, List<ProjectphaseItem> data});
}

/// @nodoc
class __$$ProjectPhasesResImplCopyWithImpl<$Res>
    extends _$ProjectPhasesResCopyWithImpl<$Res, _$ProjectPhasesResImpl>
    implements _$$ProjectPhasesResImplCopyWith<$Res> {
  __$$ProjectPhasesResImplCopyWithImpl(_$ProjectPhasesResImpl _value,
      $Res Function(_$ProjectPhasesResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$ProjectPhasesResImpl(
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
              as List<ProjectphaseItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectPhasesResImpl extends _ProjectPhasesRes {
  const _$ProjectPhasesResImpl(
      {required this.status,
      required this.message,
      required final List<ProjectphaseItem> data})
      : _data = data,
        super._();

  factory _$ProjectPhasesResImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectPhasesResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  final List<ProjectphaseItem> _data;
  @override
  List<ProjectphaseItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectPhasesResImplCopyWith<_$ProjectPhasesResImpl> get copyWith =>
      __$$ProjectPhasesResImplCopyWithImpl<_$ProjectPhasesResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectPhasesResImplToJson(
      this,
    );
  }
}

abstract class _ProjectPhasesRes extends ProjectPhasesRes {
  const factory _ProjectPhasesRes(
      {required final String status,
      required final String message,
      required final List<ProjectphaseItem> data}) = _$ProjectPhasesResImpl;
  const _ProjectPhasesRes._() : super._();

  factory _ProjectPhasesRes.fromJson(Map<String, dynamic> json) =
      _$ProjectPhasesResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  List<ProjectphaseItem> get data;
  @override
  @JsonKey(ignore: true)
  _$$ProjectPhasesResImplCopyWith<_$ProjectPhasesResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectphaseItem _$ProjectphaseItemFromJson(Map<String, dynamic> json) {
  return _ProjectphaseItem.fromJson(json);
}

/// @nodoc
mixin _$ProjectphaseItem {
  int get id => throw _privateConstructorUsedError;
  int get project_id => throw _privateConstructorUsedError;
  int get phase_id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get planned_start_date => throw _privateConstructorUsedError;
  String? get planned_end_date => throw _privateConstructorUsedError;
  String? get actual_start_date => throw _privateConstructorUsedError;
  String? get actual_end_date => throw _privateConstructorUsedError;
  int get progress_percentage => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectphaseItemCopyWith<ProjectphaseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectphaseItemCopyWith<$Res> {
  factory $ProjectphaseItemCopyWith(
          ProjectphaseItem value, $Res Function(ProjectphaseItem) then) =
      _$ProjectphaseItemCopyWithImpl<$Res, ProjectphaseItem>;
  @useResult
  $Res call(
      {int id,
      int project_id,
      int phase_id,
      String name,
      String? description,
      String? planned_start_date,
      String? planned_end_date,
      String? actual_start_date,
      String? actual_end_date,
      int progress_percentage,
      String status,
      String? notes,
      String created_at,
      String updated_at});
}

/// @nodoc
class _$ProjectphaseItemCopyWithImpl<$Res, $Val extends ProjectphaseItem>
    implements $ProjectphaseItemCopyWith<$Res> {
  _$ProjectphaseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? project_id = null,
    Object? phase_id = null,
    Object? name = null,
    Object? description = freezed,
    Object? planned_start_date = freezed,
    Object? planned_end_date = freezed,
    Object? actual_start_date = freezed,
    Object? actual_end_date = freezed,
    Object? progress_percentage = null,
    Object? status = null,
    Object? notes = freezed,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      project_id: null == project_id
          ? _value.project_id
          : project_id // ignore: cast_nullable_to_non_nullable
              as int,
      phase_id: null == phase_id
          ? _value.phase_id
          : phase_id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      planned_start_date: freezed == planned_start_date
          ? _value.planned_start_date
          : planned_start_date // ignore: cast_nullable_to_non_nullable
              as String?,
      planned_end_date: freezed == planned_end_date
          ? _value.planned_end_date
          : planned_end_date // ignore: cast_nullable_to_non_nullable
              as String?,
      actual_start_date: freezed == actual_start_date
          ? _value.actual_start_date
          : actual_start_date // ignore: cast_nullable_to_non_nullable
              as String?,
      actual_end_date: freezed == actual_end_date
          ? _value.actual_end_date
          : actual_end_date // ignore: cast_nullable_to_non_nullable
              as String?,
      progress_percentage: null == progress_percentage
          ? _value.progress_percentage
          : progress_percentage // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$ProjectphaseItemImplCopyWith<$Res>
    implements $ProjectphaseItemCopyWith<$Res> {
  factory _$$ProjectphaseItemImplCopyWith(_$ProjectphaseItemImpl value,
          $Res Function(_$ProjectphaseItemImpl) then) =
      __$$ProjectphaseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int project_id,
      int phase_id,
      String name,
      String? description,
      String? planned_start_date,
      String? planned_end_date,
      String? actual_start_date,
      String? actual_end_date,
      int progress_percentage,
      String status,
      String? notes,
      String created_at,
      String updated_at});
}

/// @nodoc
class __$$ProjectphaseItemImplCopyWithImpl<$Res>
    extends _$ProjectphaseItemCopyWithImpl<$Res, _$ProjectphaseItemImpl>
    implements _$$ProjectphaseItemImplCopyWith<$Res> {
  __$$ProjectphaseItemImplCopyWithImpl(_$ProjectphaseItemImpl _value,
      $Res Function(_$ProjectphaseItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? project_id = null,
    Object? phase_id = null,
    Object? name = null,
    Object? description = freezed,
    Object? planned_start_date = freezed,
    Object? planned_end_date = freezed,
    Object? actual_start_date = freezed,
    Object? actual_end_date = freezed,
    Object? progress_percentage = null,
    Object? status = null,
    Object? notes = freezed,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(_$ProjectphaseItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      project_id: null == project_id
          ? _value.project_id
          : project_id // ignore: cast_nullable_to_non_nullable
              as int,
      phase_id: null == phase_id
          ? _value.phase_id
          : phase_id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      planned_start_date: freezed == planned_start_date
          ? _value.planned_start_date
          : planned_start_date // ignore: cast_nullable_to_non_nullable
              as String?,
      planned_end_date: freezed == planned_end_date
          ? _value.planned_end_date
          : planned_end_date // ignore: cast_nullable_to_non_nullable
              as String?,
      actual_start_date: freezed == actual_start_date
          ? _value.actual_start_date
          : actual_start_date // ignore: cast_nullable_to_non_nullable
              as String?,
      actual_end_date: freezed == actual_end_date
          ? _value.actual_end_date
          : actual_end_date // ignore: cast_nullable_to_non_nullable
              as String?,
      progress_percentage: null == progress_percentage
          ? _value.progress_percentage
          : progress_percentage // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$ProjectphaseItemImpl extends _ProjectphaseItem {
  const _$ProjectphaseItemImpl(
      {required this.id,
      required this.project_id,
      required this.phase_id,
      required this.name,
      required this.description,
      required this.planned_start_date,
      required this.planned_end_date,
      required this.actual_start_date,
      required this.actual_end_date,
      required this.progress_percentage,
      required this.status,
      required this.notes,
      required this.created_at,
      required this.updated_at})
      : super._();

  factory _$ProjectphaseItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectphaseItemImplFromJson(json);

  @override
  final int id;
  @override
  final int project_id;
  @override
  final int phase_id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? planned_start_date;
  @override
  final String? planned_end_date;
  @override
  final String? actual_start_date;
  @override
  final String? actual_end_date;
  @override
  final int progress_percentage;
  @override
  final String status;
  @override
  final String? notes;
  @override
  final String created_at;
  @override
  final String updated_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectphaseItemImplCopyWith<_$ProjectphaseItemImpl> get copyWith =>
      __$$ProjectphaseItemImplCopyWithImpl<_$ProjectphaseItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectphaseItemImplToJson(
      this,
    );
  }
}

abstract class _ProjectphaseItem extends ProjectphaseItem {
  const factory _ProjectphaseItem(
      {required final int id,
      required final int project_id,
      required final int phase_id,
      required final String name,
      required final String? description,
      required final String? planned_start_date,
      required final String? planned_end_date,
      required final String? actual_start_date,
      required final String? actual_end_date,
      required final int progress_percentage,
      required final String status,
      required final String? notes,
      required final String created_at,
      required final String updated_at}) = _$ProjectphaseItemImpl;
  const _ProjectphaseItem._() : super._();

  factory _ProjectphaseItem.fromJson(Map<String, dynamic> json) =
      _$ProjectphaseItemImpl.fromJson;

  @override
  int get id;
  @override
  int get project_id;
  @override
  int get phase_id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get planned_start_date;
  @override
  String? get planned_end_date;
  @override
  String? get actual_start_date;
  @override
  String? get actual_end_date;
  @override
  int get progress_percentage;
  @override
  String get status;
  @override
  String? get notes;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  @JsonKey(ignore: true)
  _$$ProjectphaseItemImplCopyWith<_$ProjectphaseItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
