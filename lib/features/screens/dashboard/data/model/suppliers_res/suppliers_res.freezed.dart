// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suppliers_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuppliersRes _$SuppliersResFromJson(Map<String, dynamic> json) {
  return _SuppliersRes.fromJson(json);
}

/// @nodoc
mixin _$SuppliersRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<DataItem> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuppliersResCopyWith<SuppliersRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuppliersResCopyWith<$Res> {
  factory $SuppliersResCopyWith(
          SuppliersRes value, $Res Function(SuppliersRes) then) =
      _$SuppliersResCopyWithImpl<$Res, SuppliersRes>;
  @useResult
  $Res call({String status, String message, List<DataItem> data});
}

/// @nodoc
class _$SuppliersResCopyWithImpl<$Res, $Val extends SuppliersRes>
    implements $SuppliersResCopyWith<$Res> {
  _$SuppliersResCopyWithImpl(this._value, this._then);

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
              as List<DataItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuppliersResImplCopyWith<$Res>
    implements $SuppliersResCopyWith<$Res> {
  factory _$$SuppliersResImplCopyWith(
          _$SuppliersResImpl value, $Res Function(_$SuppliersResImpl) then) =
      __$$SuppliersResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, List<DataItem> data});
}

/// @nodoc
class __$$SuppliersResImplCopyWithImpl<$Res>
    extends _$SuppliersResCopyWithImpl<$Res, _$SuppliersResImpl>
    implements _$$SuppliersResImplCopyWith<$Res> {
  __$$SuppliersResImplCopyWithImpl(
      _$SuppliersResImpl _value, $Res Function(_$SuppliersResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$SuppliersResImpl(
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
              as List<DataItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuppliersResImpl extends _SuppliersRes {
  const _$SuppliersResImpl(
      {required this.status,
      required this.message,
      required final List<DataItem> data})
      : _data = data,
        super._();

  factory _$SuppliersResImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuppliersResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  final List<DataItem> _data;
  @override
  List<DataItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuppliersResImplCopyWith<_$SuppliersResImpl> get copyWith =>
      __$$SuppliersResImplCopyWithImpl<_$SuppliersResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuppliersResImplToJson(
      this,
    );
  }
}

abstract class _SuppliersRes extends SuppliersRes {
  const factory _SuppliersRes(
      {required final String status,
      required final String message,
      required final List<DataItem> data}) = _$SuppliersResImpl;
  const _SuppliersRes._() : super._();

  factory _SuppliersRes.fromJson(Map<String, dynamic> json) =
      _$SuppliersResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  List<DataItem> get data;
  @override
  @JsonKey(ignore: true)
  _$$SuppliersResImplCopyWith<_$SuppliersResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataItem _$DataItemFromJson(Map<String, dynamic> json) {
  return _DataItem.fromJson(json);
}

/// @nodoc
mixin _$DataItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get company_name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get tax_number => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataItemCopyWith<DataItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataItemCopyWith<$Res> {
  factory $DataItemCopyWith(DataItem value, $Res Function(DataItem) then) =
      _$DataItemCopyWithImpl<$Res, DataItem>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? company_name,
      String? phone,
      String? mobile,
      String? email,
      String? address,
      String? tax_number,
      String? notes,
      String? status});
}

/// @nodoc
class _$DataItemCopyWithImpl<$Res, $Val extends DataItem>
    implements $DataItemCopyWith<$Res> {
  _$DataItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? company_name = freezed,
    Object? phone = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? tax_number = freezed,
    Object? notes = freezed,
    Object? status = freezed,
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
      company_name: freezed == company_name
          ? _value.company_name
          : company_name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      tax_number: freezed == tax_number
          ? _value.tax_number
          : tax_number // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataItemImplCopyWith<$Res>
    implements $DataItemCopyWith<$Res> {
  factory _$$DataItemImplCopyWith(
          _$DataItemImpl value, $Res Function(_$DataItemImpl) then) =
      __$$DataItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? company_name,
      String? phone,
      String? mobile,
      String? email,
      String? address,
      String? tax_number,
      String? notes,
      String? status});
}

/// @nodoc
class __$$DataItemImplCopyWithImpl<$Res>
    extends _$DataItemCopyWithImpl<$Res, _$DataItemImpl>
    implements _$$DataItemImplCopyWith<$Res> {
  __$$DataItemImplCopyWithImpl(
      _$DataItemImpl _value, $Res Function(_$DataItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? company_name = freezed,
    Object? phone = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? tax_number = freezed,
    Object? notes = freezed,
    Object? status = freezed,
  }) {
    return _then(_$DataItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      company_name: freezed == company_name
          ? _value.company_name
          : company_name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      tax_number: freezed == tax_number
          ? _value.tax_number
          : tax_number // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataItemImpl extends _DataItem {
  const _$DataItemImpl(
      {required this.id,
      required this.name,
      required this.company_name,
      required this.phone,
      required this.mobile,
      required this.email,
      required this.address,
      required this.tax_number,
      required this.notes,
      required this.status})
      : super._();

  factory _$DataItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? company_name;
  @override
  final String? phone;
  @override
  final String? mobile;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? tax_number;
  @override
  final String? notes;
  @override
  final String? status;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataItemImplCopyWith<_$DataItemImpl> get copyWith =>
      __$$DataItemImplCopyWithImpl<_$DataItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataItemImplToJson(
      this,
    );
  }
}

abstract class _DataItem extends DataItem {
  const factory _DataItem(
      {required final int id,
      required final String name,
      required final String? company_name,
      required final String? phone,
      required final String? mobile,
      required final String? email,
      required final String? address,
      required final String? tax_number,
      required final String? notes,
      required final String? status}) = _$DataItemImpl;
  const _DataItem._() : super._();

  factory _DataItem.fromJson(Map<String, dynamic> json) =
      _$DataItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get company_name;
  @override
  String? get phone;
  @override
  String? get mobile;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String? get tax_number;
  @override
  String? get notes;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$DataItemImplCopyWith<_$DataItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
