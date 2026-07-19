// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pj_phase_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PjPhaseUpdate _$PjPhaseUpdateFromJson(Map<String, dynamic> json) {
  return _PjPhaseUpdate.fromJson(json);
}

/// @nodoc
mixin _$PjPhaseUpdate {
  String get status => throw _privateConstructorUsedError;
  PhaseUpdateData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PjPhaseUpdateCopyWith<PjPhaseUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PjPhaseUpdateCopyWith<$Res> {
  factory $PjPhaseUpdateCopyWith(
          PjPhaseUpdate value, $Res Function(PjPhaseUpdate) then) =
      _$PjPhaseUpdateCopyWithImpl<$Res, PjPhaseUpdate>;
  @useResult
  $Res call({String status, PhaseUpdateData data});

  $PhaseUpdateDataCopyWith<$Res> get data;
}

/// @nodoc
class _$PjPhaseUpdateCopyWithImpl<$Res, $Val extends PjPhaseUpdate>
    implements $PjPhaseUpdateCopyWith<$Res> {
  _$PjPhaseUpdateCopyWithImpl(this._value, this._then);

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
              as PhaseUpdateData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PhaseUpdateDataCopyWith<$Res> get data {
    return $PhaseUpdateDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PjPhaseUpdateImplCopyWith<$Res>
    implements $PjPhaseUpdateCopyWith<$Res> {
  factory _$$PjPhaseUpdateImplCopyWith(
          _$PjPhaseUpdateImpl value, $Res Function(_$PjPhaseUpdateImpl) then) =
      __$$PjPhaseUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, PhaseUpdateData data});

  @override
  $PhaseUpdateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PjPhaseUpdateImplCopyWithImpl<$Res>
    extends _$PjPhaseUpdateCopyWithImpl<$Res, _$PjPhaseUpdateImpl>
    implements _$$PjPhaseUpdateImplCopyWith<$Res> {
  __$$PjPhaseUpdateImplCopyWithImpl(
      _$PjPhaseUpdateImpl _value, $Res Function(_$PjPhaseUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$PjPhaseUpdateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PhaseUpdateData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PjPhaseUpdateImpl extends _PjPhaseUpdate {
  const _$PjPhaseUpdateImpl({required this.status, required this.data})
      : super._();

  factory _$PjPhaseUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PjPhaseUpdateImplFromJson(json);

  @override
  final String status;
  @override
  final PhaseUpdateData data;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PjPhaseUpdateImplCopyWith<_$PjPhaseUpdateImpl> get copyWith =>
      __$$PjPhaseUpdateImplCopyWithImpl<_$PjPhaseUpdateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PjPhaseUpdateImplToJson(
      this,
    );
  }
}

abstract class _PjPhaseUpdate extends PjPhaseUpdate {
  const factory _PjPhaseUpdate(
      {required final String status,
      required final PhaseUpdateData data}) = _$PjPhaseUpdateImpl;
  const _PjPhaseUpdate._() : super._();

  factory _PjPhaseUpdate.fromJson(Map<String, dynamic> json) =
      _$PjPhaseUpdateImpl.fromJson;

  @override
  String get status;
  @override
  PhaseUpdateData get data;
  @override
  @JsonKey(ignore: true)
  _$$PjPhaseUpdateImplCopyWith<_$PjPhaseUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhaseUpdateData _$PhaseUpdateDataFromJson(Map<String, dynamic> json) {
  return _PhaseUpdateData.fromJson(json);
}

/// @nodoc
mixin _$PhaseUpdateData {
  List<ProgressupdateItem> get progress_updates =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhaseUpdateDataCopyWith<PhaseUpdateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhaseUpdateDataCopyWith<$Res> {
  factory $PhaseUpdateDataCopyWith(
          PhaseUpdateData value, $Res Function(PhaseUpdateData) then) =
      _$PhaseUpdateDataCopyWithImpl<$Res, PhaseUpdateData>;
  @useResult
  $Res call({List<ProgressupdateItem> progress_updates});
}

/// @nodoc
class _$PhaseUpdateDataCopyWithImpl<$Res, $Val extends PhaseUpdateData>
    implements $PhaseUpdateDataCopyWith<$Res> {
  _$PhaseUpdateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress_updates = null,
  }) {
    return _then(_value.copyWith(
      progress_updates: null == progress_updates
          ? _value.progress_updates
          : progress_updates // ignore: cast_nullable_to_non_nullable
              as List<ProgressupdateItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhaseUpdateDataImplCopyWith<$Res>
    implements $PhaseUpdateDataCopyWith<$Res> {
  factory _$$PhaseUpdateDataImplCopyWith(_$PhaseUpdateDataImpl value,
          $Res Function(_$PhaseUpdateDataImpl) then) =
      __$$PhaseUpdateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProgressupdateItem> progress_updates});
}

/// @nodoc
class __$$PhaseUpdateDataImplCopyWithImpl<$Res>
    extends _$PhaseUpdateDataCopyWithImpl<$Res, _$PhaseUpdateDataImpl>
    implements _$$PhaseUpdateDataImplCopyWith<$Res> {
  __$$PhaseUpdateDataImplCopyWithImpl(
      _$PhaseUpdateDataImpl _value, $Res Function(_$PhaseUpdateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress_updates = null,
  }) {
    return _then(_$PhaseUpdateDataImpl(
      progress_updates: null == progress_updates
          ? _value._progress_updates
          : progress_updates // ignore: cast_nullable_to_non_nullable
              as List<ProgressupdateItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhaseUpdateDataImpl extends _PhaseUpdateData {
  const _$PhaseUpdateDataImpl(
      {required final List<ProgressupdateItem> progress_updates})
      : _progress_updates = progress_updates,
        super._();

  factory _$PhaseUpdateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhaseUpdateDataImplFromJson(json);

  final List<ProgressupdateItem> _progress_updates;
  @override
  List<ProgressupdateItem> get progress_updates {
    if (_progress_updates is EqualUnmodifiableListView)
      return _progress_updates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_progress_updates);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhaseUpdateDataImplCopyWith<_$PhaseUpdateDataImpl> get copyWith =>
      __$$PhaseUpdateDataImplCopyWithImpl<_$PhaseUpdateDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhaseUpdateDataImplToJson(
      this,
    );
  }
}

abstract class _PhaseUpdateData extends PhaseUpdateData {
  const factory _PhaseUpdateData(
          {required final List<ProgressupdateItem> progress_updates}) =
      _$PhaseUpdateDataImpl;
  const _PhaseUpdateData._() : super._();

  factory _PhaseUpdateData.fromJson(Map<String, dynamic> json) =
      _$PhaseUpdateDataImpl.fromJson;

  @override
  List<ProgressupdateItem> get progress_updates;
  @override
  @JsonKey(ignore: true)
  _$$PhaseUpdateDataImplCopyWith<_$PhaseUpdateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProgressupdateItem _$ProgressupdateItemFromJson(Map<String, dynamic> json) {
  return _ProgressupdateItem.fromJson(json);
}

/// @nodoc
mixin _$ProgressupdateItem {
  int get id => throw _privateConstructorUsedError;
  int get progress_percentage => throw _privateConstructorUsedError;
  String get update_date => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  String get creator_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressupdateItemCopyWith<ProgressupdateItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressupdateItemCopyWith<$Res> {
  factory $ProgressupdateItemCopyWith(
          ProgressupdateItem value, $Res Function(ProgressupdateItem) then) =
      _$ProgressupdateItemCopyWithImpl<$Res, ProgressupdateItem>;
  @useResult
  $Res call(
      {int id,
      int progress_percentage,
      String update_date,
      String notes,
      List<String> photos,
      String creator_name});
}

/// @nodoc
class _$ProgressupdateItemCopyWithImpl<$Res, $Val extends ProgressupdateItem>
    implements $ProgressupdateItemCopyWith<$Res> {
  _$ProgressupdateItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? progress_percentage = null,
    Object? update_date = null,
    Object? notes = null,
    Object? photos = null,
    Object? creator_name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      progress_percentage: null == progress_percentage
          ? _value.progress_percentage
          : progress_percentage // ignore: cast_nullable_to_non_nullable
              as int,
      update_date: null == update_date
          ? _value.update_date
          : update_date // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      creator_name: null == creator_name
          ? _value.creator_name
          : creator_name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressupdateItemImplCopyWith<$Res>
    implements $ProgressupdateItemCopyWith<$Res> {
  factory _$$ProgressupdateItemImplCopyWith(_$ProgressupdateItemImpl value,
          $Res Function(_$ProgressupdateItemImpl) then) =
      __$$ProgressupdateItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int progress_percentage,
      String update_date,
      String notes,
      List<String> photos,
      String creator_name});
}

/// @nodoc
class __$$ProgressupdateItemImplCopyWithImpl<$Res>
    extends _$ProgressupdateItemCopyWithImpl<$Res, _$ProgressupdateItemImpl>
    implements _$$ProgressupdateItemImplCopyWith<$Res> {
  __$$ProgressupdateItemImplCopyWithImpl(_$ProgressupdateItemImpl _value,
      $Res Function(_$ProgressupdateItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? progress_percentage = null,
    Object? update_date = null,
    Object? notes = null,
    Object? photos = null,
    Object? creator_name = null,
  }) {
    return _then(_$ProgressupdateItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      progress_percentage: null == progress_percentage
          ? _value.progress_percentage
          : progress_percentage // ignore: cast_nullable_to_non_nullable
              as int,
      update_date: null == update_date
          ? _value.update_date
          : update_date // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      creator_name: null == creator_name
          ? _value.creator_name
          : creator_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressupdateItemImpl extends _ProgressupdateItem {
  const _$ProgressupdateItemImpl(
      {required this.id,
      required this.progress_percentage,
      required this.update_date,
      required this.notes,
      required final List<String> photos,
      required this.creator_name})
      : _photos = photos,
        super._();

  factory _$ProgressupdateItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressupdateItemImplFromJson(json);

  @override
  final int id;
  @override
  final int progress_percentage;
  @override
  final String update_date;
  @override
  final String notes;
  final List<String> _photos;
  @override
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  final String creator_name;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressupdateItemImplCopyWith<_$ProgressupdateItemImpl> get copyWith =>
      __$$ProgressupdateItemImplCopyWithImpl<_$ProgressupdateItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressupdateItemImplToJson(
      this,
    );
  }
}

abstract class _ProgressupdateItem extends ProgressupdateItem {
  const factory _ProgressupdateItem(
      {required final int id,
      required final int progress_percentage,
      required final String update_date,
      required final String notes,
      required final List<String> photos,
      required final String creator_name}) = _$ProgressupdateItemImpl;
  const _ProgressupdateItem._() : super._();

  factory _ProgressupdateItem.fromJson(Map<String, dynamic> json) =
      _$ProgressupdateItemImpl.fromJson;

  @override
  int get id;
  @override
  int get progress_percentage;
  @override
  String get update_date;
  @override
  String get notes;
  @override
  List<String> get photos;
  @override
  String get creator_name;
  @override
  @JsonKey(ignore: true)
  _$$ProgressupdateItemImplCopyWith<_$ProgressupdateItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
