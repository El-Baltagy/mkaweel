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
  List<DataItem> get data => throw _privateConstructorUsedError;

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
  $Res call({String status, String message, List<DataItem> data});
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
abstract class _$$SubCatogeriesDataImplCopyWith<$Res>
    implements $SubCatogeriesDataCopyWith<$Res> {
  factory _$$SubCatogeriesDataImplCopyWith(_$SubCatogeriesDataImpl value,
          $Res Function(_$SubCatogeriesDataImpl) then) =
      __$$SubCatogeriesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, List<DataItem> data});
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
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubCatogeriesDataImpl extends _SubCatogeriesData {
  const _$SubCatogeriesDataImpl(
      {required this.status,
      required this.message,
      required final List<DataItem> data})
      : _data = data,
        super._();

  factory _$SubCatogeriesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubCatogeriesDataImplFromJson(json);

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
      required final List<DataItem> data}) = _$SubCatogeriesDataImpl;
  const _SubCatogeriesData._() : super._();

  factory _SubCatogeriesData.fromJson(Map<String, dynamic> json) =
      _$SubCatogeriesDataImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  List<DataItem> get data;
  @override
  @JsonKey(ignore: true)
  _$$SubCatogeriesDataImplCopyWith<_$SubCatogeriesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataItem _$DataItemFromJson(Map<String, dynamic> json) {
  return _DataItem.fromJson(json);
}

/// @nodoc
mixin _$DataItem {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get category_id => throw _privateConstructorUsedError;
  CatogeryItem get category => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  dynamic get brand => throw _privateConstructorUsedError;
  String get origin_country => throw _privateConstructorUsedError;
  int get unit_price => throw _privateConstructorUsedError;
  int get selling_price => throw _privateConstructorUsedError;
  dynamic get image_path => throw _privateConstructorUsedError;
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
      String code,
      String name,
      int category_id,
      CatogeryItem category,
      String unit,
      dynamic brand,
      String origin_country,
      int unit_price,
      int selling_price,
      dynamic image_path,
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
              as int,
      selling_price: null == selling_price
          ? _value.selling_price
          : selling_price // ignore: cast_nullable_to_non_nullable
              as int,
      image_path: freezed == image_path
          ? _value.image_path
          : image_path // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$DataItemImplCopyWith<$Res>
    implements $DataItemCopyWith<$Res> {
  factory _$$DataItemImplCopyWith(
          _$DataItemImpl value, $Res Function(_$DataItemImpl) then) =
      __$$DataItemImplCopyWithImpl<$Res>;
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
      int unit_price,
      int selling_price,
      dynamic image_path,
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
    return _then(_$DataItemImpl(
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
              as int,
      selling_price: null == selling_price
          ? _value.selling_price
          : selling_price // ignore: cast_nullable_to_non_nullable
              as int,
      image_path: freezed == image_path
          ? _value.image_path
          : image_path // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
class _$DataItemImpl extends _DataItem {
  const _$DataItemImpl(
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

  factory _$DataItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataItemImplFromJson(json);

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
  final int unit_price;
  @override
  final int selling_price;
  @override
  final dynamic image_path;
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
      required final String code,
      required final String name,
      required final int category_id,
      required final CatogeryItem category,
      required final String unit,
      required final dynamic brand,
      required final String origin_country,
      required final int unit_price,
      required final int selling_price,
      required final dynamic image_path,
      required final String currency,
      required final int current_quantity,
      required final int minimum_quantity,
      required final int reorder_quantity,
      required final String supplier_name,
      required final String supplier_phone,
      required final String status,
      required final bool is_available,
      required final String notes,
      required final String created_at}) = _$DataItemImpl;
  const _DataItem._() : super._();

  factory _DataItem.fromJson(Map<String, dynamic> json) =
      _$DataItemImpl.fromJson;

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
  int get unit_price;
  @override
  int get selling_price;
  @override
  dynamic get image_path;
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
  _$$DataItemImplCopyWith<_$DataItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
