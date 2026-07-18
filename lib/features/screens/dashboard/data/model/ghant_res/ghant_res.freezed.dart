// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ghant_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GhantRes _$GhantResFromJson(Map<String, dynamic> json) {
  return _GhantRes.fromJson(json);
}

/// @nodoc
mixin _$GhantRes {
  String get status => throw _privateConstructorUsedError;
  GhantData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GhantResCopyWith<GhantRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GhantResCopyWith<$Res> {
  factory $GhantResCopyWith(GhantRes value, $Res Function(GhantRes) then) =
      _$GhantResCopyWithImpl<$Res, GhantRes>;
  @useResult
  $Res call({String status, GhantData data});

  $GhantDataCopyWith<$Res> get data;
}

/// @nodoc
class _$GhantResCopyWithImpl<$Res, $Val extends GhantRes>
    implements $GhantResCopyWith<$Res> {
  _$GhantResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GhantData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GhantDataCopyWith<$Res> get data {
    return $GhantDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GhantResImplCopyWith<$Res>
    implements $GhantResCopyWith<$Res> {
  factory _$$GhantResImplCopyWith(
          _$GhantResImpl value, $Res Function(_$GhantResImpl) then) =
      __$$GhantResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, GhantData data});

  @override
  $GhantDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$GhantResImplCopyWithImpl<$Res>
    extends _$GhantResCopyWithImpl<$Res, _$GhantResImpl>
    implements _$$GhantResImplCopyWith<$Res> {
  __$$GhantResImplCopyWithImpl(
      _$GhantResImpl _value, $Res Function(_$GhantResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$GhantResImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GhantData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GhantResImpl extends _GhantRes {
  const _$GhantResImpl({required this.status, required this.data}) : super._();

  factory _$GhantResImpl.fromJson(Map<String, dynamic> json) =>
      _$$GhantResImplFromJson(json);

  @override
  final String status;
  @override
  final GhantData data;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GhantResImplCopyWith<_$GhantResImpl> get copyWith =>
      __$$GhantResImplCopyWithImpl<_$GhantResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GhantResImplToJson(
      this,
    );
  }
}

abstract class _GhantRes extends GhantRes {
  const factory _GhantRes(
      {required final String status,
      required final GhantData data}) = _$GhantResImpl;
  const _GhantRes._() : super._();

  factory _GhantRes.fromJson(Map<String, dynamic> json) =
      _$GhantResImpl.fromJson;

  @override
  String get status;
  @override
  GhantData get data;
  @override
  @JsonKey(ignore: true)
  _$$GhantResImplCopyWith<_$GhantResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GhantData _$GhantDataFromJson(Map<String, dynamic> json) {
  return _GhantData.fromJson(json);
}

/// @nodoc
mixin _$GhantData {
  Selectedproject get selected_project => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GhantDataCopyWith<GhantData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GhantDataCopyWith<$Res> {
  factory $GhantDataCopyWith(GhantData value, $Res Function(GhantData) then) =
      _$GhantDataCopyWithImpl<$Res, GhantData>;
  @useResult
  $Res call({Selectedproject selected_project});

  $SelectedprojectCopyWith<$Res> get selected_project;
}

/// @nodoc
class _$GhantDataCopyWithImpl<$Res, $Val extends GhantData>
    implements $GhantDataCopyWith<$Res> {
  _$GhantDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected_project = null,
  }) {
    return _then(_value.copyWith(
      selected_project: null == selected_project
          ? _value.selected_project
          : selected_project // ignore: cast_nullable_to_non_nullable
              as Selectedproject,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectedprojectCopyWith<$Res> get selected_project {
    return $SelectedprojectCopyWith<$Res>(_value.selected_project, (value) {
      return _then(_value.copyWith(selected_project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GhantDataImplCopyWith<$Res>
    implements $GhantDataCopyWith<$Res> {
  factory _$$GhantDataImplCopyWith(
          _$GhantDataImpl value, $Res Function(_$GhantDataImpl) then) =
      __$$GhantDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Selectedproject selected_project});

  @override
  $SelectedprojectCopyWith<$Res> get selected_project;
}

/// @nodoc
class __$$GhantDataImplCopyWithImpl<$Res>
    extends _$GhantDataCopyWithImpl<$Res, _$GhantDataImpl>
    implements _$$GhantDataImplCopyWith<$Res> {
  __$$GhantDataImplCopyWithImpl(
      _$GhantDataImpl _value, $Res Function(_$GhantDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected_project = null,
  }) {
    return _then(_$GhantDataImpl(
      selected_project: null == selected_project
          ? _value.selected_project
          : selected_project // ignore: cast_nullable_to_non_nullable
              as Selectedproject,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GhantDataImpl extends _GhantData {
  const _$GhantDataImpl({required this.selected_project}) : super._();

  factory _$GhantDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GhantDataImplFromJson(json);

  @override
  final Selectedproject selected_project;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GhantDataImplCopyWith<_$GhantDataImpl> get copyWith =>
      __$$GhantDataImplCopyWithImpl<_$GhantDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GhantDataImplToJson(
      this,
    );
  }
}

abstract class _GhantData extends GhantData {
  const factory _GhantData({required final Selectedproject selected_project}) =
      _$GhantDataImpl;
  const _GhantData._() : super._();

  factory _GhantData.fromJson(Map<String, dynamic> json) =
      _$GhantDataImpl.fromJson;

  @override
  Selectedproject get selected_project;
  @override
  @JsonKey(ignore: true)
  _$$GhantDataImplCopyWith<_$GhantDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Selectedproject _$SelectedprojectFromJson(Map<String, dynamic> json) {
  return _Selectedproject.fromJson(json);
}

/// @nodoc
mixin _$Selectedproject {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get progress_percentage => throw _privateConstructorUsedError;
  List<PhaseItem> get phases => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectedprojectCopyWith<Selectedproject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedprojectCopyWith<$Res> {
  factory $SelectedprojectCopyWith(
          Selectedproject value, $Res Function(Selectedproject) then) =
      _$SelectedprojectCopyWithImpl<$Res, Selectedproject>;
  @useResult
  $Res call(
      {int id,
      String name,
      double progress_percentage,
      List<PhaseItem> phases});
}

/// @nodoc
class _$SelectedprojectCopyWithImpl<$Res, $Val extends Selectedproject>
    implements $SelectedprojectCopyWith<$Res> {
  _$SelectedprojectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? progress_percentage = null,
    Object? phases = null,
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
      progress_percentage: null == progress_percentage
          ? _value.progress_percentage
          : progress_percentage // ignore: cast_nullable_to_non_nullable
              as double,
      phases: null == phases
          ? _value.phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<PhaseItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedprojectImplCopyWith<$Res>
    implements $SelectedprojectCopyWith<$Res> {
  factory _$$SelectedprojectImplCopyWith(_$SelectedprojectImpl value,
          $Res Function(_$SelectedprojectImpl) then) =
      __$$SelectedprojectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      double progress_percentage,
      List<PhaseItem> phases});
}

/// @nodoc
class __$$SelectedprojectImplCopyWithImpl<$Res>
    extends _$SelectedprojectCopyWithImpl<$Res, _$SelectedprojectImpl>
    implements _$$SelectedprojectImplCopyWith<$Res> {
  __$$SelectedprojectImplCopyWithImpl(
      _$SelectedprojectImpl _value, $Res Function(_$SelectedprojectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? progress_percentage = null,
    Object? phases = null,
  }) {
    return _then(_$SelectedprojectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      progress_percentage: null == progress_percentage
          ? _value.progress_percentage
          : progress_percentage // ignore: cast_nullable_to_non_nullable
              as double,
      phases: null == phases
          ? _value._phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<PhaseItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedprojectImpl extends _Selectedproject {
  const _$SelectedprojectImpl(
      {required this.id,
      required this.name,
      required this.progress_percentage,
      required final List<PhaseItem> phases})
      : _phases = phases,
        super._();

  factory _$SelectedprojectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedprojectImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double progress_percentage;
  final List<PhaseItem> _phases;
  @override
  List<PhaseItem> get phases {
    if (_phases is EqualUnmodifiableListView) return _phases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phases);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedprojectImplCopyWith<_$SelectedprojectImpl> get copyWith =>
      __$$SelectedprojectImplCopyWithImpl<_$SelectedprojectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedprojectImplToJson(
      this,
    );
  }
}

abstract class _Selectedproject extends Selectedproject {
  const factory _Selectedproject(
      {required final int id,
      required final String name,
      required final double progress_percentage,
      required final List<PhaseItem> phases}) = _$SelectedprojectImpl;
  const _Selectedproject._() : super._();

  factory _Selectedproject.fromJson(Map<String, dynamic> json) =
      _$SelectedprojectImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get progress_percentage;
  @override
  List<PhaseItem> get phases;
  @override
  @JsonKey(ignore: true)
  _$$SelectedprojectImplCopyWith<_$SelectedprojectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhaseItem _$PhaseItemFromJson(Map<String, dynamic> json) {
  return _PhaseItem.fromJson(json);
}

/// @nodoc
mixin _$PhaseItem {
  int get phase_id => throw _privateConstructorUsedError;
  String get phase_name => throw _privateConstructorUsedError;
  int get progress_percentage => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhaseItemCopyWith<PhaseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhaseItemCopyWith<$Res> {
  factory $PhaseItemCopyWith(PhaseItem value, $Res Function(PhaseItem) then) =
      _$PhaseItemCopyWithImpl<$Res, PhaseItem>;
  @useResult
  $Res call(
      {int phase_id,
      String phase_name,
      int progress_percentage,
      String status});
}

/// @nodoc
class _$PhaseItemCopyWithImpl<$Res, $Val extends PhaseItem>
    implements $PhaseItemCopyWith<$Res> {
  _$PhaseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase_id = null,
    Object? phase_name = null,
    Object? progress_percentage = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      phase_id: null == phase_id
          ? _value.phase_id
          : phase_id // ignore: cast_nullable_to_non_nullable
              as int,
      phase_name: null == phase_name
          ? _value.phase_name
          : phase_name // ignore: cast_nullable_to_non_nullable
              as String,
      progress_percentage: null == progress_percentage
          ? _value.progress_percentage
          : progress_percentage // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhaseItemImplCopyWith<$Res>
    implements $PhaseItemCopyWith<$Res> {
  factory _$$PhaseItemImplCopyWith(
          _$PhaseItemImpl value, $Res Function(_$PhaseItemImpl) then) =
      __$$PhaseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int phase_id,
      String phase_name,
      int progress_percentage,
      String status});
}

/// @nodoc
class __$$PhaseItemImplCopyWithImpl<$Res>
    extends _$PhaseItemCopyWithImpl<$Res, _$PhaseItemImpl>
    implements _$$PhaseItemImplCopyWith<$Res> {
  __$$PhaseItemImplCopyWithImpl(
      _$PhaseItemImpl _value, $Res Function(_$PhaseItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase_id = null,
    Object? phase_name = null,
    Object? progress_percentage = null,
    Object? status = null,
  }) {
    return _then(_$PhaseItemImpl(
      phase_id: null == phase_id
          ? _value.phase_id
          : phase_id // ignore: cast_nullable_to_non_nullable
              as int,
      phase_name: null == phase_name
          ? _value.phase_name
          : phase_name // ignore: cast_nullable_to_non_nullable
              as String,
      progress_percentage: null == progress_percentage
          ? _value.progress_percentage
          : progress_percentage // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhaseItemImpl extends _PhaseItem {
  const _$PhaseItemImpl(
      {required this.phase_id,
      required this.phase_name,
      required this.progress_percentage,
      required this.status})
      : super._();

  factory _$PhaseItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhaseItemImplFromJson(json);

  @override
  final int phase_id;
  @override
  final String phase_name;
  @override
  final int progress_percentage;
  @override
  final String status;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhaseItemImplCopyWith<_$PhaseItemImpl> get copyWith =>
      __$$PhaseItemImplCopyWithImpl<_$PhaseItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhaseItemImplToJson(
      this,
    );
  }
}

abstract class _PhaseItem extends PhaseItem {
  const factory _PhaseItem(
      {required final int phase_id,
      required final String phase_name,
      required final int progress_percentage,
      required final String status}) = _$PhaseItemImpl;
  const _PhaseItem._() : super._();

  factory _PhaseItem.fromJson(Map<String, dynamic> json) =
      _$PhaseItemImpl.fromJson;

  @override
  int get phase_id;
  @override
  String get phase_name;
  @override
  int get progress_percentage;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$PhaseItemImplCopyWith<_$PhaseItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
