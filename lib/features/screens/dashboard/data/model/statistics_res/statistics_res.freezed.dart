// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatisticsRes _$StatisticsResFromJson(Map<String, dynamic> json) {
  return _StatisticsRes.fromJson(json);
}

/// @nodoc
mixin _$StatisticsRes {
  String get status => throw _privateConstructorUsedError;
  StatisticData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticsResCopyWith<StatisticsRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsResCopyWith<$Res> {
  factory $StatisticsResCopyWith(
          StatisticsRes value, $Res Function(StatisticsRes) then) =
      _$StatisticsResCopyWithImpl<$Res, StatisticsRes>;
  @useResult
  $Res call({String status, StatisticData data});

  $StatisticDataCopyWith<$Res> get data;
}

/// @nodoc
class _$StatisticsResCopyWithImpl<$Res, $Val extends StatisticsRes>
    implements $StatisticsResCopyWith<$Res> {
  _$StatisticsResCopyWithImpl(this._value, this._then);

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
              as StatisticData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StatisticDataCopyWith<$Res> get data {
    return $StatisticDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatisticsResImplCopyWith<$Res>
    implements $StatisticsResCopyWith<$Res> {
  factory _$$StatisticsResImplCopyWith(
          _$StatisticsResImpl value, $Res Function(_$StatisticsResImpl) then) =
      __$$StatisticsResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, StatisticData data});

  @override
  $StatisticDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$StatisticsResImplCopyWithImpl<$Res>
    extends _$StatisticsResCopyWithImpl<$Res, _$StatisticsResImpl>
    implements _$$StatisticsResImplCopyWith<$Res> {
  __$$StatisticsResImplCopyWithImpl(
      _$StatisticsResImpl _value, $Res Function(_$StatisticsResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$StatisticsResImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as StatisticData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatisticsResImpl extends _StatisticsRes {
  const _$StatisticsResImpl({required this.status, required this.data})
      : super._();

  factory _$StatisticsResImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticsResImplFromJson(json);

  @override
  final String status;
  @override
  final StatisticData data;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsResImplCopyWith<_$StatisticsResImpl> get copyWith =>
      __$$StatisticsResImplCopyWithImpl<_$StatisticsResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticsResImplToJson(
      this,
    );
  }
}

abstract class _StatisticsRes extends StatisticsRes {
  const factory _StatisticsRes(
      {required final String status,
      required final StatisticData data}) = _$StatisticsResImpl;
  const _StatisticsRes._() : super._();

  factory _StatisticsRes.fromJson(Map<String, dynamic> json) =
      _$StatisticsResImpl.fromJson;

  @override
  String get status;
  @override
  StatisticData get data;
  @override
  @JsonKey(ignore: true)
  _$$StatisticsResImplCopyWith<_$StatisticsResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatisticData _$StatisticDataFromJson(Map<String, dynamic> json) {
  return _StatisticData.fromJson(json);
}

/// @nodoc
mixin _$StatisticData {
  int get total_projects => throw _privateConstructorUsedError;
  int get completed_projects => throw _privateConstructorUsedError;
  int get total_tasks => throw _privateConstructorUsedError;
  int get completed_tasks => throw _privateConstructorUsedError;
  int get total_workers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticDataCopyWith<StatisticData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticDataCopyWith<$Res> {
  factory $StatisticDataCopyWith(
          StatisticData value, $Res Function(StatisticData) then) =
      _$StatisticDataCopyWithImpl<$Res, StatisticData>;
  @useResult
  $Res call(
      {int total_projects,
      int completed_projects,
      int total_tasks,
      int completed_tasks,
      int total_workers});
}

/// @nodoc
class _$StatisticDataCopyWithImpl<$Res, $Val extends StatisticData>
    implements $StatisticDataCopyWith<$Res> {
  _$StatisticDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_projects = null,
    Object? completed_projects = null,
    Object? total_tasks = null,
    Object? completed_tasks = null,
    Object? total_workers = null,
  }) {
    return _then(_value.copyWith(
      total_projects: null == total_projects
          ? _value.total_projects
          : total_projects // ignore: cast_nullable_to_non_nullable
              as int,
      completed_projects: null == completed_projects
          ? _value.completed_projects
          : completed_projects // ignore: cast_nullable_to_non_nullable
              as int,
      total_tasks: null == total_tasks
          ? _value.total_tasks
          : total_tasks // ignore: cast_nullable_to_non_nullable
              as int,
      completed_tasks: null == completed_tasks
          ? _value.completed_tasks
          : completed_tasks // ignore: cast_nullable_to_non_nullable
              as int,
      total_workers: null == total_workers
          ? _value.total_workers
          : total_workers // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticDataImplCopyWith<$Res>
    implements $StatisticDataCopyWith<$Res> {
  factory _$$StatisticDataImplCopyWith(
          _$StatisticDataImpl value, $Res Function(_$StatisticDataImpl) then) =
      __$$StatisticDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total_projects,
      int completed_projects,
      int total_tasks,
      int completed_tasks,
      int total_workers});
}

/// @nodoc
class __$$StatisticDataImplCopyWithImpl<$Res>
    extends _$StatisticDataCopyWithImpl<$Res, _$StatisticDataImpl>
    implements _$$StatisticDataImplCopyWith<$Res> {
  __$$StatisticDataImplCopyWithImpl(
      _$StatisticDataImpl _value, $Res Function(_$StatisticDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_projects = null,
    Object? completed_projects = null,
    Object? total_tasks = null,
    Object? completed_tasks = null,
    Object? total_workers = null,
  }) {
    return _then(_$StatisticDataImpl(
      total_projects: null == total_projects
          ? _value.total_projects
          : total_projects // ignore: cast_nullable_to_non_nullable
              as int,
      completed_projects: null == completed_projects
          ? _value.completed_projects
          : completed_projects // ignore: cast_nullable_to_non_nullable
              as int,
      total_tasks: null == total_tasks
          ? _value.total_tasks
          : total_tasks // ignore: cast_nullable_to_non_nullable
              as int,
      completed_tasks: null == completed_tasks
          ? _value.completed_tasks
          : completed_tasks // ignore: cast_nullable_to_non_nullable
              as int,
      total_workers: null == total_workers
          ? _value.total_workers
          : total_workers // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatisticDataImpl extends _StatisticData {
  const _$StatisticDataImpl(
      {required this.total_projects,
      required this.completed_projects,
      required this.total_tasks,
      required this.completed_tasks,
      required this.total_workers})
      : super._();

  factory _$StatisticDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticDataImplFromJson(json);

  @override
  final int total_projects;
  @override
  final int completed_projects;
  @override
  final int total_tasks;
  @override
  final int completed_tasks;
  @override
  final int total_workers;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticDataImplCopyWith<_$StatisticDataImpl> get copyWith =>
      __$$StatisticDataImplCopyWithImpl<_$StatisticDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticDataImplToJson(
      this,
    );
  }
}

abstract class _StatisticData extends StatisticData {
  const factory _StatisticData(
      {required final int total_projects,
      required final int completed_projects,
      required final int total_tasks,
      required final int completed_tasks,
      required final int total_workers}) = _$StatisticDataImpl;
  const _StatisticData._() : super._();

  factory _StatisticData.fromJson(Map<String, dynamic> json) =
      _$StatisticDataImpl.fromJson;

  @override
  int get total_projects;
  @override
  int get completed_projects;
  @override
  int get total_tasks;
  @override
  int get completed_tasks;
  @override
  int get total_workers;
  @override
  @JsonKey(ignore: true)
  _$$StatisticDataImplCopyWith<_$StatisticDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
