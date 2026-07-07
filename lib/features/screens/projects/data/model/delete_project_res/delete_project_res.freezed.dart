// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_project_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteProjectRes _$DeleteProjectResFromJson(Map<String, dynamic> json) {
  return _DeleteProjectRes.fromJson(json);
}

/// @nodoc
mixin _$DeleteProjectRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteProjectResCopyWith<DeleteProjectRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteProjectResCopyWith<$Res> {
  factory $DeleteProjectResCopyWith(
          DeleteProjectRes value, $Res Function(DeleteProjectRes) then) =
      _$DeleteProjectResCopyWithImpl<$Res, DeleteProjectRes>;
  @useResult
  $Res call({String status, String message});
}

/// @nodoc
class _$DeleteProjectResCopyWithImpl<$Res, $Val extends DeleteProjectRes>
    implements $DeleteProjectResCopyWith<$Res> {
  _$DeleteProjectResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteProjectResImplCopyWith<$Res>
    implements $DeleteProjectResCopyWith<$Res> {
  factory _$$DeleteProjectResImplCopyWith(_$DeleteProjectResImpl value,
          $Res Function(_$DeleteProjectResImpl) then) =
      __$$DeleteProjectResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message});
}

/// @nodoc
class __$$DeleteProjectResImplCopyWithImpl<$Res>
    extends _$DeleteProjectResCopyWithImpl<$Res, _$DeleteProjectResImpl>
    implements _$$DeleteProjectResImplCopyWith<$Res> {
  __$$DeleteProjectResImplCopyWithImpl(_$DeleteProjectResImpl _value,
      $Res Function(_$DeleteProjectResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$DeleteProjectResImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteProjectResImpl extends _DeleteProjectRes {
  const _$DeleteProjectResImpl({required this.status, required this.message})
      : super._();

  factory _$DeleteProjectResImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteProjectResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteProjectResImplCopyWith<_$DeleteProjectResImpl> get copyWith =>
      __$$DeleteProjectResImplCopyWithImpl<_$DeleteProjectResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteProjectResImplToJson(
      this,
    );
  }
}

abstract class _DeleteProjectRes extends DeleteProjectRes {
  const factory _DeleteProjectRes(
      {required final String status,
      required final String message}) = _$DeleteProjectResImpl;
  const _DeleteProjectRes._() : super._();

  factory _DeleteProjectRes.fromJson(Map<String, dynamic> json) =
      _$DeleteProjectResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$DeleteProjectResImplCopyWith<_$DeleteProjectResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
