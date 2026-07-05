// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateProfileRes _$UpdateProfileResFromJson(Map<String, dynamic> json) {
  return _UpdateProfileRes.fromJson(json);
}

/// @nodoc
mixin _$UpdateProfileRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateProfileResCopyWith<UpdateProfileRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileResCopyWith<$Res> {
  factory $UpdateProfileResCopyWith(
          UpdateProfileRes value, $Res Function(UpdateProfileRes) then) =
      _$UpdateProfileResCopyWithImpl<$Res, UpdateProfileRes>;
  @useResult
  $Res call({String status, String message, Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$UpdateProfileResCopyWithImpl<$Res, $Val extends UpdateProfileRes>
    implements $UpdateProfileResCopyWith<$Res> {
  _$UpdateProfileResCopyWithImpl(this._value, this._then);

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
abstract class _$$UpdateProfileResImplCopyWith<$Res>
    implements $UpdateProfileResCopyWith<$Res> {
  factory _$$UpdateProfileResImplCopyWith(_$UpdateProfileResImpl value,
          $Res Function(_$UpdateProfileResImpl) then) =
      __$$UpdateProfileResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$UpdateProfileResImplCopyWithImpl<$Res>
    extends _$UpdateProfileResCopyWithImpl<$Res, _$UpdateProfileResImpl>
    implements _$$UpdateProfileResImplCopyWith<$Res> {
  __$$UpdateProfileResImplCopyWithImpl(_$UpdateProfileResImpl _value,
      $Res Function(_$UpdateProfileResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$UpdateProfileResImpl(
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
class _$UpdateProfileResImpl extends _UpdateProfileRes {
  const _$UpdateProfileResImpl(
      {required this.status, required this.message, required this.data})
      : super._();

  factory _$UpdateProfileResImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateProfileResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final Data data;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileResImplCopyWith<_$UpdateProfileResImpl> get copyWith =>
      __$$UpdateProfileResImplCopyWithImpl<_$UpdateProfileResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateProfileResImplToJson(
      this,
    );
  }
}

abstract class _UpdateProfileRes extends UpdateProfileRes {
  const factory _UpdateProfileRes(
      {required final String status,
      required final String message,
      required final Data data}) = _$UpdateProfileResImpl;
  const _UpdateProfileRes._() : super._();

  factory _UpdateProfileRes.fromJson(Map<String, dynamic> json) =
      _$UpdateProfileResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  Data get data;
  @override
  @JsonKey(ignore: true)
  _$$UpdateProfileResImplCopyWith<_$UpdateProfileResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
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
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user});

  @override
  $UserCopyWith<$Res> get user;
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
    Object? user = null,
  }) {
    return _then(_$DataImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl extends _Data {
  const _$DataImpl({required this.user}) : super._();

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  final User user;

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
  const factory _Data({required final User user}) = _$DataImpl;
  const _Data._() : super._();

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
