// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_project_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateProjectRes _$CreateProjectResFromJson(Map<String, dynamic> json) {
  return _CreateProjectRes.fromJson(json);
}

/// @nodoc
mixin _$CreateProjectRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateProjectResCopyWith<CreateProjectRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProjectResCopyWith<$Res> {
  factory $CreateProjectResCopyWith(
          CreateProjectRes value, $Res Function(CreateProjectRes) then) =
      _$CreateProjectResCopyWithImpl<$Res, CreateProjectRes>;
  @useResult
  $Res call({String status, String message, Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$CreateProjectResCopyWithImpl<$Res, $Val extends CreateProjectRes>
    implements $CreateProjectResCopyWith<$Res> {
  _$CreateProjectResCopyWithImpl(this._value, this._then);

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
              as Data,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateProjectResImplCopyWith<$Res>
    implements $CreateProjectResCopyWith<$Res> {
  factory _$$CreateProjectResImplCopyWith(_$CreateProjectResImpl value,
          $Res Function(_$CreateProjectResImpl) then) =
      __$$CreateProjectResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$CreateProjectResImplCopyWithImpl<$Res>
    extends _$CreateProjectResCopyWithImpl<$Res, _$CreateProjectResImpl>
    implements _$$CreateProjectResImplCopyWith<$Res> {
  __$$CreateProjectResImplCopyWithImpl(_$CreateProjectResImpl _value,
      $Res Function(_$CreateProjectResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$CreateProjectResImpl(
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
              as Data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateProjectResImpl extends _CreateProjectRes {
  const _$CreateProjectResImpl(
      {required this.status, required this.message, required this.data})
      : super._();

  factory _$CreateProjectResImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateProjectResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final Data data;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateProjectResImplCopyWith<_$CreateProjectResImpl> get copyWith =>
      __$$CreateProjectResImplCopyWithImpl<_$CreateProjectResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateProjectResImplToJson(
      this,
    );
  }
}

abstract class _CreateProjectRes extends CreateProjectRes {
  const factory _CreateProjectRes(
      {required final String status,
      required final String message,
      required final Data data}) = _$CreateProjectResImpl;
  const _CreateProjectRes._() : super._();

  factory _CreateProjectRes.fromJson(Map<String, dynamic> json) =
      _$CreateProjectResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  Data get data;
  @override
  @JsonKey(ignore: true)
  _$$CreateProjectResImplCopyWith<_$CreateProjectResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get owner_name => throw _privateConstructorUsedError;
  String get start_date => throw _privateConstructorUsedError;
  String get end_date => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get extra_details => throw _privateConstructorUsedError;
  String get contract_value => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  int get progress_percentage => throw _privateConstructorUsedError;
  List<ProjectphaseItem>? get project_phases =>
      throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {int id,
      String name,
      String owner_name,
      String start_date,
      String end_date,
      String latitude,
      String longitude,
      String? description,
      String? extra_details,
      String contract_value,
      String currency,
      int progress_percentage,
      List<ProjectphaseItem>? project_phases,
      String created_at,
      String updated_at});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

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
    Object? description = freezed,
    Object? extra_details = freezed,
    Object? contract_value = null,
    Object? currency = null,
    Object? progress_percentage = null,
    Object? project_phases = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      extra_details: freezed == extra_details
          ? _value.extra_details
          : extra_details // ignore: cast_nullable_to_non_nullable
              as String?,
      contract_value: null == contract_value
          ? _value.contract_value
          : contract_value // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      progress_percentage: null == progress_percentage
          ? _value.progress_percentage
          : progress_percentage // ignore: cast_nullable_to_non_nullable
              as int,
      project_phases: freezed == project_phases
          ? _value.project_phases
          : project_phases // ignore: cast_nullable_to_non_nullable
              as List<ProjectphaseItem>?,
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
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
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
      String? description,
      String? extra_details,
      String contract_value,
      String currency,
      int progress_percentage,
      List<ProjectphaseItem>? project_phases,
      String created_at,
      String updated_at});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
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
    Object? description = freezed,
    Object? extra_details = freezed,
    Object? contract_value = null,
    Object? currency = null,
    Object? progress_percentage = null,
    Object? project_phases = freezed,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(_$DataImpl(
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      extra_details: freezed == extra_details
          ? _value.extra_details
          : extra_details // ignore: cast_nullable_to_non_nullable
              as String?,
      contract_value: null == contract_value
          ? _value.contract_value
          : contract_value // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      progress_percentage: null == progress_percentage
          ? _value.progress_percentage
          : progress_percentage // ignore: cast_nullable_to_non_nullable
              as int,
      project_phases: freezed == project_phases
          ? _value._project_phases
          : project_phases // ignore: cast_nullable_to_non_nullable
              as List<ProjectphaseItem>?,
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
class _$DataImpl extends _Data {
  const _$DataImpl(
      {required this.id,
      required this.name,
      required this.owner_name,
      required this.start_date,
      required this.end_date,
      required this.latitude,
      required this.longitude,
      required this.description,
      required this.extra_details,
      required this.contract_value,
      required this.currency,
      required this.progress_percentage,
      required final List<ProjectphaseItem>? project_phases,
      required this.created_at,
      required this.updated_at})
      : _project_phases = project_phases,
        super._();

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

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
  final String? description;
  @override
  final String? extra_details;
  @override
  final String contract_value;
  @override
  final String currency;
  @override
  final int progress_percentage;
  final List<ProjectphaseItem>? _project_phases;
  @override
  List<ProjectphaseItem>? get project_phases {
    final value = _project_phases;
    if (value == null) return null;
    if (_project_phases is EqualUnmodifiableListView) return _project_phases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String created_at;
  @override
  final String updated_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data extends Data {
  const factory _Data(
      {required final int id,
      required final String name,
      required final String owner_name,
      required final String start_date,
      required final String end_date,
      required final String latitude,
      required final String longitude,
      required final String? description,
      required final String? extra_details,
      required final String contract_value,
      required final String currency,
      required final int progress_percentage,
      required final List<ProjectphaseItem>? project_phases,
      required final String created_at,
      required final String updated_at}) = _$DataImpl;
  const _Data._() : super._();

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

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
  String? get description;
  @override
  String? get extra_details;
  @override
  String get contract_value;
  @override
  String get currency;
  @override
  int get progress_percentage;
  @override
  List<ProjectphaseItem>? get project_phases;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
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
  String get description => throw _privateConstructorUsedError;
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
      String description,
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
    Object? description = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
      String description,
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
    Object? description = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
  final String description;
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
      required final String description,
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
  String get description;
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
