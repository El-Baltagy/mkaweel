// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogoutRes _$LogoutResFromJson(Map<String, dynamic> json) {
  return _LogoutRes.fromJson(json);
}

/// @nodoc
mixin _$LogoutRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogoutResCopyWith<LogoutRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutResCopyWith<$Res> {
  factory $LogoutResCopyWith(LogoutRes value, $Res Function(LogoutRes) then) =
      _$LogoutResCopyWithImpl<$Res, LogoutRes>;
  @useResult
  $Res call({String status, String message, dynamic data});
}

/// @nodoc
class _$LogoutResCopyWithImpl<$Res, $Val extends LogoutRes>
    implements $LogoutResCopyWith<$Res> {
  _$LogoutResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogoutResImplCopyWith<$Res>
    implements $LogoutResCopyWith<$Res> {
  factory _$$LogoutResImplCopyWith(
          _$LogoutResImpl value, $Res Function(_$LogoutResImpl) then) =
      __$$LogoutResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, dynamic data});
}

/// @nodoc
class __$$LogoutResImplCopyWithImpl<$Res>
    extends _$LogoutResCopyWithImpl<$Res, _$LogoutResImpl>
    implements _$$LogoutResImplCopyWith<$Res> {
  __$$LogoutResImplCopyWithImpl(
      _$LogoutResImpl _value, $Res Function(_$LogoutResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$LogoutResImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogoutResImpl extends _LogoutRes {
  const _$LogoutResImpl(
      {required this.status, required this.message, required this.data})
      : super._();

  factory _$LogoutResImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogoutResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final dynamic data;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutResImplCopyWith<_$LogoutResImpl> get copyWith =>
      __$$LogoutResImplCopyWithImpl<_$LogoutResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogoutResImplToJson(
      this,
    );
  }
}

abstract class _LogoutRes extends LogoutRes {
  const factory _LogoutRes(
      {required final String status,
      required final String message,
      required final dynamic data}) = _$LogoutResImpl;
  const _LogoutRes._() : super._();

  factory _LogoutRes.fromJson(Map<String, dynamic> json) =
      _$LogoutResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$LogoutResImplCopyWith<_$LogoutResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
