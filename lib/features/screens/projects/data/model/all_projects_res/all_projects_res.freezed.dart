// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_projects_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllProjectsRes _$AllProjectsResFromJson(Map<String, dynamic> json) {
  return _AllProjectsRes.fromJson(json);
}

/// @nodoc
mixin _$AllProjectsRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ProjectInfoData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllProjectsResCopyWith<AllProjectsRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllProjectsResCopyWith<$Res> {
  factory $AllProjectsResCopyWith(
          AllProjectsRes value, $Res Function(AllProjectsRes) then) =
      _$AllProjectsResCopyWithImpl<$Res, AllProjectsRes>;
  @useResult
  $Res call({String status, String message, List<ProjectInfoData> data});
}

/// @nodoc
class _$AllProjectsResCopyWithImpl<$Res, $Val extends AllProjectsRes>
    implements $AllProjectsResCopyWith<$Res> {
  _$AllProjectsResCopyWithImpl(this._value, this._then);

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
              as List<ProjectInfoData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllProjectsResImplCopyWith<$Res>
    implements $AllProjectsResCopyWith<$Res> {
  factory _$$AllProjectsResImplCopyWith(_$AllProjectsResImpl value,
          $Res Function(_$AllProjectsResImpl) then) =
      __$$AllProjectsResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, List<ProjectInfoData> data});
}

/// @nodoc
class __$$AllProjectsResImplCopyWithImpl<$Res>
    extends _$AllProjectsResCopyWithImpl<$Res, _$AllProjectsResImpl>
    implements _$$AllProjectsResImplCopyWith<$Res> {
  __$$AllProjectsResImplCopyWithImpl(
      _$AllProjectsResImpl _value, $Res Function(_$AllProjectsResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$AllProjectsResImpl(
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
              as List<ProjectInfoData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllProjectsResImpl extends _AllProjectsRes {
  const _$AllProjectsResImpl(
      {required this.status,
      required this.message,
      required final List<ProjectInfoData> data})
      : _data = data,
        super._();

  factory _$AllProjectsResImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllProjectsResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  final List<ProjectInfoData> _data;
  @override
  List<ProjectInfoData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllProjectsResImplCopyWith<_$AllProjectsResImpl> get copyWith =>
      __$$AllProjectsResImplCopyWithImpl<_$AllProjectsResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllProjectsResImplToJson(
      this,
    );
  }
}

abstract class _AllProjectsRes extends AllProjectsRes {
  const factory _AllProjectsRes(
      {required final String status,
      required final String message,
      required final List<ProjectInfoData> data}) = _$AllProjectsResImpl;
  const _AllProjectsRes._() : super._();

  factory _AllProjectsRes.fromJson(Map<String, dynamic> json) =
      _$AllProjectsResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  List<ProjectInfoData> get data;
  @override
  @JsonKey(ignore: true)
  _$$AllProjectsResImplCopyWith<_$AllProjectsResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
