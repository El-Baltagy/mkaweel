// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_account_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteAccountRes _$DeleteAccountResFromJson(Map<String, dynamic> json) {
  return _DeleteAccountRes.fromJson(json);
}

/// @nodoc
mixin _$DeleteAccountRes {
  String? get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteAccountResCopyWith<DeleteAccountRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteAccountResCopyWith<$Res> {
  factory $DeleteAccountResCopyWith(
          DeleteAccountRes value, $Res Function(DeleteAccountRes) then) =
      _$DeleteAccountResCopyWithImpl<$Res, DeleteAccountRes>;
  @useResult
  $Res call({String? status, String message});
}

/// @nodoc
class _$DeleteAccountResCopyWithImpl<$Res, $Val extends DeleteAccountRes>
    implements $DeleteAccountResCopyWith<$Res> {
  _$DeleteAccountResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteAccountResImplCopyWith<$Res>
    implements $DeleteAccountResCopyWith<$Res> {
  factory _$$DeleteAccountResImplCopyWith(_$DeleteAccountResImpl value,
          $Res Function(_$DeleteAccountResImpl) then) =
      __$$DeleteAccountResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String message});
}

/// @nodoc
class __$$DeleteAccountResImplCopyWithImpl<$Res>
    extends _$DeleteAccountResCopyWithImpl<$Res, _$DeleteAccountResImpl>
    implements _$$DeleteAccountResImplCopyWith<$Res> {
  __$$DeleteAccountResImplCopyWithImpl(_$DeleteAccountResImpl _value,
      $Res Function(_$DeleteAccountResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = null,
  }) {
    return _then(_$DeleteAccountResImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteAccountResImpl extends _DeleteAccountRes {
  const _$DeleteAccountResImpl({required this.status, required this.message})
      : super._();

  factory _$DeleteAccountResImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteAccountResImplFromJson(json);

  @override
  final String? status;
  @override
  final String message;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAccountResImplCopyWith<_$DeleteAccountResImpl> get copyWith =>
      __$$DeleteAccountResImplCopyWithImpl<_$DeleteAccountResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteAccountResImplToJson(
      this,
    );
  }
}

abstract class _DeleteAccountRes extends DeleteAccountRes {
  const factory _DeleteAccountRes(
      {required final String? status,
      required final String message}) = _$DeleteAccountResImpl;
  const _DeleteAccountRes._() : super._();

  factory _DeleteAccountRes.fromJson(Map<String, dynamic> json) =
      _$DeleteAccountResImpl.fromJson;

  @override
  String? get status;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$DeleteAccountResImplCopyWith<_$DeleteAccountResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
