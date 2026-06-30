// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_catogeries_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubCatogeriesData _$SubCatogeriesDataFromJson(Map<String, dynamic> json) {
  return _SubCatogeriesData.fromJson(json);
}

/// @nodoc
mixin _$SubCatogeriesData {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  List<SubCatogeryItem> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCatogeriesDataCopyWith<SubCatogeriesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCatogeriesDataCopyWith<$Res> {
  factory $SubCatogeriesDataCopyWith(
          SubCatogeriesData value, $Res Function(SubCatogeriesData) then) =
      _$SubCatogeriesDataCopyWithImpl<$Res, SubCatogeriesData>;
  @useResult
  $Res call(
      {String status,
      String message,
      String currency,
      List<SubCatogeryItem> data});
}

/// @nodoc
class _$SubCatogeriesDataCopyWithImpl<$Res, $Val extends SubCatogeriesData>
    implements $SubCatogeriesDataCopyWith<$Res> {
  _$SubCatogeriesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? currency = null,
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SubCatogeryItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubCatogeriesDataImplCopyWith<$Res>
    implements $SubCatogeriesDataCopyWith<$Res> {
  factory _$$SubCatogeriesDataImplCopyWith(_$SubCatogeriesDataImpl value,
          $Res Function(_$SubCatogeriesDataImpl) then) =
      __$$SubCatogeriesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      String message,
      String currency,
      List<SubCatogeryItem> data});
}

/// @nodoc
class __$$SubCatogeriesDataImplCopyWithImpl<$Res>
    extends _$SubCatogeriesDataCopyWithImpl<$Res, _$SubCatogeriesDataImpl>
    implements _$$SubCatogeriesDataImplCopyWith<$Res> {
  __$$SubCatogeriesDataImplCopyWithImpl(_$SubCatogeriesDataImpl _value,
      $Res Function(_$SubCatogeriesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? currency = null,
    Object? data = null,
  }) {
    return _then(_$SubCatogeriesDataImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SubCatogeryItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubCatogeriesDataImpl extends _SubCatogeriesData {
  const _$SubCatogeriesDataImpl(
      {required this.status,
      required this.message,
      required this.currency,
      required final List<SubCatogeryItem> data})
      : _data = data,
        super._();

  factory _$SubCatogeriesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubCatogeriesDataImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final String currency;
  final List<SubCatogeryItem> _data;
  @override
  List<SubCatogeryItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubCatogeriesDataImplCopyWith<_$SubCatogeriesDataImpl> get copyWith =>
      __$$SubCatogeriesDataImplCopyWithImpl<_$SubCatogeriesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubCatogeriesDataImplToJson(
      this,
    );
  }
}

abstract class _SubCatogeriesData extends SubCatogeriesData {
  const factory _SubCatogeriesData(
      {required final String status,
      required final String message,
      required final String currency,
      required final List<SubCatogeryItem> data}) = _$SubCatogeriesDataImpl;
  const _SubCatogeriesData._() : super._();

  factory _SubCatogeriesData.fromJson(Map<String, dynamic> json) =
      _$SubCatogeriesDataImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  String get currency;
  @override
  List<SubCatogeryItem> get data;
  @override
  @JsonKey(ignore: true)
  _$$SubCatogeriesDataImplCopyWith<_$SubCatogeriesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubCatogeryItem _$SubCatogeryItemFromJson(Map<String, dynamic> json) {
  return _SubCatogeryItem.fromJson(json);
}

/// @nodoc
mixin _$SubCatogeryItem {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get category_id => throw _privateConstructorUsedError;
  CatogeryItem get category => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  dynamic get brand => throw _privateConstructorUsedError;
  String get origin_country => throw _privateConstructorUsedError;
  double get unit_price => throw _privateConstructorUsedError;
  double get selling_price => throw _privateConstructorUsedError;
  String? get image_path => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  int get current_quantity => throw _privateConstructorUsedError;
  int get minimum_quantity => throw _privateConstructorUsedError;
  int get reorder_quantity => throw _privateConstructorUsedError;
  String get supplier_name => throw _privateConstructorUsedError;
  String get supplier_phone => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get is_available => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCatogeryItemCopyWith<SubCatogeryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCatogeryItemCopyWith<$Res> {
  factory $SubCatogeryItemCopyWith(
          SubCatogeryItem value, $Res Function(SubCatogeryItem) then) =
      _$SubCatogeryItemCopyWithImpl<$Res, SubCatogeryItem>;
  @useResult
  $Res call(
      {int id,
      String code,
      String name,
      int category_id,
      CatogeryItem category,
      String unit,
      dynamic brand,
      String origin_country,
      double unit_price,
      double selling_price,
      String? image_path,
      String currency,
      int current_quantity,
      int minimum_quantity,
      int reorder_quantity,
      String supplier_name,
      String supplier_phone,
      String status,
      bool is_available,
      String notes,
      String created_at});

  $CatogeryItemCopyWith<$Res> get category;
}

/// @nodoc
class _$SubCatogeryItemCopyWithImpl<$Res, $Val extends SubCatogeryItem>
    implements $SubCatogeryItemCopyWith<$Res> {
  _$SubCatogeryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? category_id = null,
    Object? category = null,
    Object? unit = null,
    Object? brand = freezed,
    Object? origin_country = null,
    Object? unit_price = null,
    Object? selling_price = null,
    Object? image_path = freezed,
    Object? currency = null,
    Object? current_quantity = null,
    Object? minimum_quantity = null,
    Object? reorder_quantity = null,
    Object? supplier_name = null,
    Object? supplier_phone = null,
    Object? status = null,
    Object? is_available = null,
    Object? notes = null,
    Object? created_at = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category_id: null == category_id
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CatogeryItem,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as dynamic,
      origin_country: null == origin_country
          ? _value.origin_country
          : origin_country // ignore: cast_nullable_to_non_nullable
              as String,
      unit_price: null == unit_price
          ? _value.unit_price
          : unit_price // ignore: cast_nullable_to_non_nullable
              as double,
      selling_price: null == selling_price
          ? _value.selling_price
          : selling_price // ignore: cast_nullable_to_non_nullable
              as double,
      image_path: freezed == image_path
          ? _value.image_path
          : image_path // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      current_quantity: null == current_quantity
          ? _value.current_quantity
          : current_quantity // ignore: cast_nullable_to_non_nullable
              as int,
      minimum_quantity: null == minimum_quantity
          ? _value.minimum_quantity
          : minimum_quantity // ignore: cast_nullable_to_non_nullable
              as int,
      reorder_quantity: null == reorder_quantity
          ? _value.reorder_quantity
          : reorder_quantity // ignore: cast_nullable_to_non_nullable
              as int,
      supplier_name: null == supplier_name
          ? _value.supplier_name
          : supplier_name // ignore: cast_nullable_to_non_nullable
              as String,
      supplier_phone: null == supplier_phone
          ? _value.supplier_phone
          : supplier_phone // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      is_available: null == is_available
          ? _value.is_available
          : is_available // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CatogeryItemCopyWith<$Res> get category {
    return $CatogeryItemCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubCatogeryItemImplCopyWith<$Res>
    implements $SubCatogeryItemCopyWith<$Res> {
  factory _$$SubCatogeryItemImplCopyWith(_$SubCatogeryItemImpl value,
          $Res Function(_$SubCatogeryItemImpl) then) =
      __$$SubCatogeryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      String name,
      int category_id,
      CatogeryItem category,
      String unit,
      dynamic brand,
      String origin_country,
      double unit_price,
      double selling_price,
      String? image_path,
      String currency,
      int current_quantity,
      int minimum_quantity,
      int reorder_quantity,
      String supplier_name,
      String supplier_phone,
      String status,
      bool is_available,
      String notes,
      String created_at});

  @override
  $CatogeryItemCopyWith<$Res> get category;
}

/// @nodoc
class __$$SubCatogeryItemImplCopyWithImpl<$Res>
    extends _$SubCatogeryItemCopyWithImpl<$Res, _$SubCatogeryItemImpl>
    implements _$$SubCatogeryItemImplCopyWith<$Res> {
  __$$SubCatogeryItemImplCopyWithImpl(
      _$SubCatogeryItemImpl _value, $Res Function(_$SubCatogeryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? category_id = null,
    Object? category = null,
    Object? unit = null,
    Object? brand = freezed,
    Object? origin_country = null,
    Object? unit_price = null,
    Object? selling_price = null,
    Object? image_path = freezed,
    Object? currency = null,
    Object? current_quantity = null,
    Object? minimum_quantity = null,
    Object? reorder_quantity = null,
    Object? supplier_name = null,
    Object? supplier_phone = null,
    Object? status = null,
    Object? is_available = null,
    Object? notes = null,
    Object? created_at = null,
  }) {
    return _then(_$SubCatogeryItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category_id: null == category_id
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CatogeryItem,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as dynamic,
      origin_country: null == origin_country
          ? _value.origin_country
          : origin_country // ignore: cast_nullable_to_non_nullable
              as String,
      unit_price: null == unit_price
          ? _value.unit_price
          : unit_price // ignore: cast_nullable_to_non_nullable
              as double,
      selling_price: null == selling_price
          ? _value.selling_price
          : selling_price // ignore: cast_nullable_to_non_nullable
              as double,
      image_path: freezed == image_path
          ? _value.image_path
          : image_path // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      current_quantity: null == current_quantity
          ? _value.current_quantity
          : current_quantity // ignore: cast_nullable_to_non_nullable
              as int,
      minimum_quantity: null == minimum_quantity
          ? _value.minimum_quantity
          : minimum_quantity // ignore: cast_nullable_to_non_nullable
              as int,
      reorder_quantity: null == reorder_quantity
          ? _value.reorder_quantity
          : reorder_quantity // ignore: cast_nullable_to_non_nullable
              as int,
      supplier_name: null == supplier_name
          ? _value.supplier_name
          : supplier_name // ignore: cast_nullable_to_non_nullable
              as String,
      supplier_phone: null == supplier_phone
          ? _value.supplier_phone
          : supplier_phone // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      is_available: null == is_available
          ? _value.is_available
          : is_available // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubCatogeryItemImpl extends _SubCatogeryItem {
  const _$SubCatogeryItemImpl(
      {required this.id,
      required this.code,
      required this.name,
      required this.category_id,
      required this.category,
      required this.unit,
      required this.brand,
      required this.origin_country,
      required this.unit_price,
      required this.selling_price,
      required this.image_path,
      required this.currency,
      required this.current_quantity,
      required this.minimum_quantity,
      required this.reorder_quantity,
      required this.supplier_name,
      required this.supplier_phone,
      required this.status,
      required this.is_available,
      required this.notes,
      required this.created_at})
      : super._();

  factory _$SubCatogeryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubCatogeryItemImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String name;
  @override
  final int category_id;
  @override
  final CatogeryItem category;
  @override
  final String unit;
  @override
  final dynamic brand;
  @override
  final String origin_country;
  @override
  final double unit_price;
  @override
  final double selling_price;
  @override
  final String? image_path;
  @override
  final String currency;
  @override
  final int current_quantity;
  @override
  final int minimum_quantity;
  @override
  final int reorder_quantity;
  @override
  final String supplier_name;
  @override
  final String supplier_phone;
  @override
  final String status;
  @override
  final bool is_available;
  @override
  final String notes;
  @override
  final String created_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubCatogeryItemImplCopyWith<_$SubCatogeryItemImpl> get copyWith =>
      __$$SubCatogeryItemImplCopyWithImpl<_$SubCatogeryItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubCatogeryItemImplToJson(
      this,
    );
  }
}

abstract class _SubCatogeryItem extends SubCatogeryItem {
  const factory _SubCatogeryItem(
      {required final int id,
      required final String code,
      required final String name,
      required final int category_id,
      required final CatogeryItem category,
      required final String unit,
      required final dynamic brand,
      required final String origin_country,
      required final double unit_price,
      required final double selling_price,
      required final String? image_path,
      required final String currency,
      required final int current_quantity,
      required final int minimum_quantity,
      required final int reorder_quantity,
      required final String supplier_name,
      required final String supplier_phone,
      required final String status,
      required final bool is_available,
      required final String notes,
      required final String created_at}) = _$SubCatogeryItemImpl;
  const _SubCatogeryItem._() : super._();

  factory _SubCatogeryItem.fromJson(Map<String, dynamic> json) =
      _$SubCatogeryItemImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  String get name;
  @override
  int get category_id;
  @override
  CatogeryItem get category;
  @override
  String get unit;
  @override
  dynamic get brand;
  @override
  String get origin_country;
  @override
  double get unit_price;
  @override
  double get selling_price;
  @override
  String? get image_path;
  @override
  String get currency;
  @override
  int get current_quantity;
  @override
  int get minimum_quantity;
  @override
  int get reorder_quantity;
  @override
  String get supplier_name;
  @override
  String get supplier_phone;
  @override
  String get status;
  @override
  bool get is_available;
  @override
  String get notes;
  @override
  String get created_at;
  @override
  @JsonKey(ignore: true)
  _$$SubCatogeryItemImplCopyWith<_$SubCatogeryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
