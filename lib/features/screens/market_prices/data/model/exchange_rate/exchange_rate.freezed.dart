// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExchangeRate _$ExchangeRateFromJson(Map<String, dynamic> json) {
  return _ExchangeRate.fromJson(json);
}

/// @nodoc
mixin _$ExchangeRate {
  String get status => throw _privateConstructorUsedError;
  RateData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExchangeRateCopyWith<ExchangeRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeRateCopyWith<$Res> {
  factory $ExchangeRateCopyWith(
          ExchangeRate value, $Res Function(ExchangeRate) then) =
      _$ExchangeRateCopyWithImpl<$Res, ExchangeRate>;
  @useResult
  $Res call({String status, RateData data});

  $RateDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ExchangeRateCopyWithImpl<$Res, $Val extends ExchangeRate>
    implements $ExchangeRateCopyWith<$Res> {
  _$ExchangeRateCopyWithImpl(this._value, this._then);

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
              as RateData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RateDataCopyWith<$Res> get data {
    return $RateDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExchangeRateImplCopyWith<$Res>
    implements $ExchangeRateCopyWith<$Res> {
  factory _$$ExchangeRateImplCopyWith(
          _$ExchangeRateImpl value, $Res Function(_$ExchangeRateImpl) then) =
      __$$ExchangeRateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, RateData data});

  @override
  $RateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ExchangeRateImplCopyWithImpl<$Res>
    extends _$ExchangeRateCopyWithImpl<$Res, _$ExchangeRateImpl>
    implements _$$ExchangeRateImplCopyWith<$Res> {
  __$$ExchangeRateImplCopyWithImpl(
      _$ExchangeRateImpl _value, $Res Function(_$ExchangeRateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$ExchangeRateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RateData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExchangeRateImpl extends _ExchangeRate {
  const _$ExchangeRateImpl({required this.status, required this.data})
      : super._();

  factory _$ExchangeRateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExchangeRateImplFromJson(json);

  @override
  final String status;
  @override
  final RateData data;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeRateImplCopyWith<_$ExchangeRateImpl> get copyWith =>
      __$$ExchangeRateImplCopyWithImpl<_$ExchangeRateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExchangeRateImplToJson(
      this,
    );
  }
}

abstract class _ExchangeRate extends ExchangeRate {
  const factory _ExchangeRate(
      {required final String status,
      required final RateData data}) = _$ExchangeRateImpl;
  const _ExchangeRate._() : super._();

  factory _ExchangeRate.fromJson(Map<String, dynamic> json) =
      _$ExchangeRateImpl.fromJson;

  @override
  String get status;
  @override
  RateData get data;
  @override
  @JsonKey(ignore: true)
  _$$ExchangeRateImplCopyWith<_$ExchangeRateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RateData _$RateDataFromJson(Map<String, dynamic> json) {
  return _RateData.fromJson(json);
}

/// @nodoc
mixin _$RateData {
  USD get USD => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateDataCopyWith<RateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateDataCopyWith<$Res> {
  factory $RateDataCopyWith(RateData value, $Res Function(RateData) then) =
      _$RateDataCopyWithImpl<$Res, RateData>;
  @useResult
  $Res call({USD USD});

  $USDCopyWith<$Res> get USD;
}

/// @nodoc
class _$RateDataCopyWithImpl<$Res, $Val extends RateData>
    implements $RateDataCopyWith<$Res> {
  _$RateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? USD = null,
  }) {
    return _then(_value.copyWith(
      USD: null == USD
          ? _value.USD
          : USD // ignore: cast_nullable_to_non_nullable
              as USD,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $USDCopyWith<$Res> get USD {
    return $USDCopyWith<$Res>(_value.USD, (value) {
      return _then(_value.copyWith(USD: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RateDataImplCopyWith<$Res>
    implements $RateDataCopyWith<$Res> {
  factory _$$RateDataImplCopyWith(
          _$RateDataImpl value, $Res Function(_$RateDataImpl) then) =
      __$$RateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({USD USD});

  @override
  $USDCopyWith<$Res> get USD;
}

/// @nodoc
class __$$RateDataImplCopyWithImpl<$Res>
    extends _$RateDataCopyWithImpl<$Res, _$RateDataImpl>
    implements _$$RateDataImplCopyWith<$Res> {
  __$$RateDataImplCopyWithImpl(
      _$RateDataImpl _value, $Res Function(_$RateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? USD = null,
  }) {
    return _then(_$RateDataImpl(
      USD: null == USD
          ? _value.USD
          : USD // ignore: cast_nullable_to_non_nullable
              as USD,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RateDataImpl extends _RateData {
  const _$RateDataImpl({required this.USD}) : super._();

  factory _$RateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RateDataImplFromJson(json);

  @override
  final USD USD;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RateDataImplCopyWith<_$RateDataImpl> get copyWith =>
      __$$RateDataImplCopyWithImpl<_$RateDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RateDataImplToJson(
      this,
    );
  }
}

abstract class _RateData extends RateData {
  const factory _RateData({required final USD USD}) = _$RateDataImpl;
  const _RateData._() : super._();

  factory _RateData.fromJson(Map<String, dynamic> json) =
      _$RateDataImpl.fromJson;

  @override
  USD get USD;
  @override
  @JsonKey(ignore: true)
  _$$RateDataImplCopyWith<_$RateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

USD _$USDFromJson(Map<String, dynamic> json) {
  return _USD.fromJson(json);
}

/// @nodoc
mixin _$USD {
  double get rateSyp => throw _privateConstructorUsedError;
  double get rateTry => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $USDCopyWith<USD> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $USDCopyWith<$Res> {
  factory $USDCopyWith(USD value, $Res Function(USD) then) =
      _$USDCopyWithImpl<$Res, USD>;
  @useResult
  $Res call({double rateSyp, double rateTry, String updatedAt});
}

/// @nodoc
class _$USDCopyWithImpl<$Res, $Val extends USD> implements $USDCopyWith<$Res> {
  _$USDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rateSyp = null,
    Object? rateTry = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      rateSyp: null == rateSyp
          ? _value.rateSyp
          : rateSyp // ignore: cast_nullable_to_non_nullable
              as double,
      rateTry: null == rateTry
          ? _value.rateTry
          : rateTry // ignore: cast_nullable_to_non_nullable
              as double,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$USDImplCopyWith<$Res> implements $USDCopyWith<$Res> {
  factory _$$USDImplCopyWith(_$USDImpl value, $Res Function(_$USDImpl) then) =
      __$$USDImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double rateSyp, double rateTry, String updatedAt});
}

/// @nodoc
class __$$USDImplCopyWithImpl<$Res> extends _$USDCopyWithImpl<$Res, _$USDImpl>
    implements _$$USDImplCopyWith<$Res> {
  __$$USDImplCopyWithImpl(_$USDImpl _value, $Res Function(_$USDImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rateSyp = null,
    Object? rateTry = null,
    Object? updatedAt = null,
  }) {
    return _then(_$USDImpl(
      rateSyp: null == rateSyp
          ? _value.rateSyp
          : rateSyp // ignore: cast_nullable_to_non_nullable
              as double,
      rateTry: null == rateTry
          ? _value.rateTry
          : rateTry // ignore: cast_nullable_to_non_nullable
              as double,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$USDImpl extends _USD {
  const _$USDImpl(
      {required this.rateSyp, required this.rateTry, required this.updatedAt})
      : super._();

  factory _$USDImpl.fromJson(Map<String, dynamic> json) =>
      _$$USDImplFromJson(json);

  @override
  final double rateSyp;
  @override
  final double rateTry;
  @override
  final String updatedAt;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$USDImplCopyWith<_$USDImpl> get copyWith =>
      __$$USDImplCopyWithImpl<_$USDImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$USDImplToJson(
      this,
    );
  }
}

abstract class _USD extends USD {
  const factory _USD(
      {required final double rateSyp,
      required final double rateTry,
      required final String updatedAt}) = _$USDImpl;
  const _USD._() : super._();

  factory _USD.fromJson(Map<String, dynamic> json) = _$USDImpl.fromJson;

  @override
  double get rateSyp;
  @override
  double get rateTry;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$USDImplCopyWith<_$USDImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
