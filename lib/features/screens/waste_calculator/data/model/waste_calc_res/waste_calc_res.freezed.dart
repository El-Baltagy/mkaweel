// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waste_calc_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WasteCalcRes _$WasteCalcResFromJson(Map<String, dynamic> json) {
  return _WasteCalcRes.fromJson(json);
}

/// @nodoc
mixin _$WasteCalcRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<WasteCalcItem> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WasteCalcResCopyWith<WasteCalcRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WasteCalcResCopyWith<$Res> {
  factory $WasteCalcResCopyWith(
          WasteCalcRes value, $Res Function(WasteCalcRes) then) =
      _$WasteCalcResCopyWithImpl<$Res, WasteCalcRes>;
  @useResult
  $Res call({String status, String message, List<WasteCalcItem> data});
}

/// @nodoc
class _$WasteCalcResCopyWithImpl<$Res, $Val extends WasteCalcRes>
    implements $WasteCalcResCopyWith<$Res> {
  _$WasteCalcResCopyWithImpl(this._value, this._then);

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
              as List<WasteCalcItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WasteCalcResImplCopyWith<$Res>
    implements $WasteCalcResCopyWith<$Res> {
  factory _$$WasteCalcResImplCopyWith(
          _$WasteCalcResImpl value, $Res Function(_$WasteCalcResImpl) then) =
      __$$WasteCalcResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, List<WasteCalcItem> data});
}

/// @nodoc
class __$$WasteCalcResImplCopyWithImpl<$Res>
    extends _$WasteCalcResCopyWithImpl<$Res, _$WasteCalcResImpl>
    implements _$$WasteCalcResImplCopyWith<$Res> {
  __$$WasteCalcResImplCopyWithImpl(
      _$WasteCalcResImpl _value, $Res Function(_$WasteCalcResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$WasteCalcResImpl(
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
              as List<WasteCalcItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WasteCalcResImpl extends _WasteCalcRes {
  const _$WasteCalcResImpl(
      {required this.status,
      required this.message,
      required final List<WasteCalcItem> data})
      : _data = data,
        super._();

  factory _$WasteCalcResImpl.fromJson(Map<String, dynamic> json) =>
      _$$WasteCalcResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  final List<WasteCalcItem> _data;
  @override
  List<WasteCalcItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WasteCalcResImplCopyWith<_$WasteCalcResImpl> get copyWith =>
      __$$WasteCalcResImplCopyWithImpl<_$WasteCalcResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WasteCalcResImplToJson(
      this,
    );
  }
}

abstract class _WasteCalcRes extends WasteCalcRes {
  const factory _WasteCalcRes(
      {required final String status,
      required final String message,
      required final List<WasteCalcItem> data}) = _$WasteCalcResImpl;
  const _WasteCalcRes._() : super._();

  factory _WasteCalcRes.fromJson(Map<String, dynamic> json) =
      _$WasteCalcResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  List<WasteCalcItem> get data;
  @override
  @JsonKey(ignore: true)
  _$$WasteCalcResImplCopyWith<_$WasteCalcResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WasteCalcItem _$WasteCalcItemFromJson(Map<String, dynamic> json) {
  return _WasteCalcItem.fromJson(json);
}

/// @nodoc
mixin _$WasteCalcItem {
  int get material_id => throw _privateConstructorUsedError;
  String get material_code => throw _privateConstructorUsedError;
  String get material_name => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  double get waste_percentage => throw _privateConstructorUsedError;
  double get required_quantity => throw _privateConstructorUsedError;
  double get waste_quantity => throw _privateConstructorUsedError;
  double get purchase_quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WasteCalcItemCopyWith<WasteCalcItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WasteCalcItemCopyWith<$Res> {
  factory $WasteCalcItemCopyWith(
          WasteCalcItem value, $Res Function(WasteCalcItem) then) =
      _$WasteCalcItemCopyWithImpl<$Res, WasteCalcItem>;
  @useResult
  $Res call(
      {int material_id,
      String material_code,
      String material_name,
      String unit,
      double waste_percentage,
      double required_quantity,
      double waste_quantity,
      double purchase_quantity});
}

/// @nodoc
class _$WasteCalcItemCopyWithImpl<$Res, $Val extends WasteCalcItem>
    implements $WasteCalcItemCopyWith<$Res> {
  _$WasteCalcItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material_id = null,
    Object? material_code = null,
    Object? material_name = null,
    Object? unit = null,
    Object? waste_percentage = null,
    Object? required_quantity = null,
    Object? waste_quantity = null,
    Object? purchase_quantity = null,
  }) {
    return _then(_value.copyWith(
      material_id: null == material_id
          ? _value.material_id
          : material_id // ignore: cast_nullable_to_non_nullable
              as int,
      material_code: null == material_code
          ? _value.material_code
          : material_code // ignore: cast_nullable_to_non_nullable
              as String,
      material_name: null == material_name
          ? _value.material_name
          : material_name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      waste_percentage: null == waste_percentage
          ? _value.waste_percentage
          : waste_percentage // ignore: cast_nullable_to_non_nullable
              as double,
      required_quantity: null == required_quantity
          ? _value.required_quantity
          : required_quantity // ignore: cast_nullable_to_non_nullable
              as double,
      waste_quantity: null == waste_quantity
          ? _value.waste_quantity
          : waste_quantity // ignore: cast_nullable_to_non_nullable
              as double,
      purchase_quantity: null == purchase_quantity
          ? _value.purchase_quantity
          : purchase_quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WasteCalcItemImplCopyWith<$Res>
    implements $WasteCalcItemCopyWith<$Res> {
  factory _$$WasteCalcItemImplCopyWith(
          _$WasteCalcItemImpl value, $Res Function(_$WasteCalcItemImpl) then) =
      __$$WasteCalcItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int material_id,
      String material_code,
      String material_name,
      String unit,
      double waste_percentage,
      double required_quantity,
      double waste_quantity,
      double purchase_quantity});
}

/// @nodoc
class __$$WasteCalcItemImplCopyWithImpl<$Res>
    extends _$WasteCalcItemCopyWithImpl<$Res, _$WasteCalcItemImpl>
    implements _$$WasteCalcItemImplCopyWith<$Res> {
  __$$WasteCalcItemImplCopyWithImpl(
      _$WasteCalcItemImpl _value, $Res Function(_$WasteCalcItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material_id = null,
    Object? material_code = null,
    Object? material_name = null,
    Object? unit = null,
    Object? waste_percentage = null,
    Object? required_quantity = null,
    Object? waste_quantity = null,
    Object? purchase_quantity = null,
  }) {
    return _then(_$WasteCalcItemImpl(
      material_id: null == material_id
          ? _value.material_id
          : material_id // ignore: cast_nullable_to_non_nullable
              as int,
      material_code: null == material_code
          ? _value.material_code
          : material_code // ignore: cast_nullable_to_non_nullable
              as String,
      material_name: null == material_name
          ? _value.material_name
          : material_name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      waste_percentage: null == waste_percentage
          ? _value.waste_percentage
          : waste_percentage // ignore: cast_nullable_to_non_nullable
              as double,
      required_quantity: null == required_quantity
          ? _value.required_quantity
          : required_quantity // ignore: cast_nullable_to_non_nullable
              as double,
      waste_quantity: null == waste_quantity
          ? _value.waste_quantity
          : waste_quantity // ignore: cast_nullable_to_non_nullable
              as double,
      purchase_quantity: null == purchase_quantity
          ? _value.purchase_quantity
          : purchase_quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WasteCalcItemImpl extends _WasteCalcItem {
  const _$WasteCalcItemImpl(
      {required this.material_id,
      required this.material_code,
      required this.material_name,
      required this.unit,
      required this.waste_percentage,
      required this.required_quantity,
      required this.waste_quantity,
      required this.purchase_quantity})
      : super._();

  factory _$WasteCalcItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WasteCalcItemImplFromJson(json);

  @override
  final int material_id;
  @override
  final String material_code;
  @override
  final String material_name;
  @override
  final String unit;
  @override
  final double waste_percentage;
  @override
  final double required_quantity;
  @override
  final double waste_quantity;
  @override
  final double purchase_quantity;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WasteCalcItemImplCopyWith<_$WasteCalcItemImpl> get copyWith =>
      __$$WasteCalcItemImplCopyWithImpl<_$WasteCalcItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WasteCalcItemImplToJson(
      this,
    );
  }
}

abstract class _WasteCalcItem extends WasteCalcItem {
  const factory _WasteCalcItem(
      {required final int material_id,
      required final String material_code,
      required final String material_name,
      required final String unit,
      required final double waste_percentage,
      required final double required_quantity,
      required final double waste_quantity,
      required final double purchase_quantity}) = _$WasteCalcItemImpl;
  const _WasteCalcItem._() : super._();

  factory _WasteCalcItem.fromJson(Map<String, dynamic> json) =
      _$WasteCalcItemImpl.fromJson;

  @override
  int get material_id;
  @override
  String get material_code;
  @override
  String get material_name;
  @override
  String get unit;
  @override
  double get waste_percentage;
  @override
  double get required_quantity;
  @override
  double get waste_quantity;
  @override
  double get purchase_quantity;
  @override
  @JsonKey(ignore: true)
  _$$WasteCalcItemImplCopyWith<_$WasteCalcItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
