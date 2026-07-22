// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_inoices_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectInoicesRes _$ProjectInoicesResFromJson(Map<String, dynamic> json) {
  return _ProjectInoicesRes.fromJson(json);
}

/// @nodoc
mixin _$ProjectInoicesRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ProjectInoiceData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectInoicesResCopyWith<ProjectInoicesRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectInoicesResCopyWith<$Res> {
  factory $ProjectInoicesResCopyWith(
          ProjectInoicesRes value, $Res Function(ProjectInoicesRes) then) =
      _$ProjectInoicesResCopyWithImpl<$Res, ProjectInoicesRes>;
  @useResult
  $Res call({String status, String message, ProjectInoiceData data});

  $ProjectInoiceDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ProjectInoicesResCopyWithImpl<$Res, $Val extends ProjectInoicesRes>
    implements $ProjectInoicesResCopyWith<$Res> {
  _$ProjectInoicesResCopyWithImpl(this._value, this._then);

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
              as ProjectInoiceData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectInoiceDataCopyWith<$Res> get data {
    return $ProjectInoiceDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectInoicesResImplCopyWith<$Res>
    implements $ProjectInoicesResCopyWith<$Res> {
  factory _$$ProjectInoicesResImplCopyWith(_$ProjectInoicesResImpl value,
          $Res Function(_$ProjectInoicesResImpl) then) =
      __$$ProjectInoicesResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, ProjectInoiceData data});

  @override
  $ProjectInoiceDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ProjectInoicesResImplCopyWithImpl<$Res>
    extends _$ProjectInoicesResCopyWithImpl<$Res, _$ProjectInoicesResImpl>
    implements _$$ProjectInoicesResImplCopyWith<$Res> {
  __$$ProjectInoicesResImplCopyWithImpl(_$ProjectInoicesResImpl _value,
      $Res Function(_$ProjectInoicesResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$ProjectInoicesResImpl(
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
              as ProjectInoiceData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectInoicesResImpl extends _ProjectInoicesRes {
  const _$ProjectInoicesResImpl(
      {required this.status, required this.message, required this.data})
      : super._();

  factory _$ProjectInoicesResImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectInoicesResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final ProjectInoiceData data;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectInoicesResImplCopyWith<_$ProjectInoicesResImpl> get copyWith =>
      __$$ProjectInoicesResImplCopyWithImpl<_$ProjectInoicesResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectInoicesResImplToJson(
      this,
    );
  }
}

abstract class _ProjectInoicesRes extends ProjectInoicesRes {
  const factory _ProjectInoicesRes(
      {required final String status,
      required final String message,
      required final ProjectInoiceData data}) = _$ProjectInoicesResImpl;
  const _ProjectInoicesRes._() : super._();

  factory _ProjectInoicesRes.fromJson(Map<String, dynamic> json) =
      _$ProjectInoicesResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  ProjectInoiceData get data;
  @override
  @JsonKey(ignore: true)
  _$$ProjectInoicesResImplCopyWith<_$ProjectInoicesResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectInoiceData _$ProjectInoiceDataFromJson(Map<String, dynamic> json) {
  return _ProjectInoiceData.fromJson(json);
}

/// @nodoc
mixin _$ProjectInoiceData {
  List<InvoiceItem> get invoices => throw _privateConstructorUsedError;
  Budgetsummary get budget_summary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectInoiceDataCopyWith<ProjectInoiceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectInoiceDataCopyWith<$Res> {
  factory $ProjectInoiceDataCopyWith(
          ProjectInoiceData value, $Res Function(ProjectInoiceData) then) =
      _$ProjectInoiceDataCopyWithImpl<$Res, ProjectInoiceData>;
  @useResult
  $Res call({List<InvoiceItem> invoices, Budgetsummary budget_summary});

  $BudgetsummaryCopyWith<$Res> get budget_summary;
}

/// @nodoc
class _$ProjectInoiceDataCopyWithImpl<$Res, $Val extends ProjectInoiceData>
    implements $ProjectInoiceDataCopyWith<$Res> {
  _$ProjectInoiceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoices = null,
    Object? budget_summary = null,
  }) {
    return _then(_value.copyWith(
      invoices: null == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<InvoiceItem>,
      budget_summary: null == budget_summary
          ? _value.budget_summary
          : budget_summary // ignore: cast_nullable_to_non_nullable
              as Budgetsummary,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BudgetsummaryCopyWith<$Res> get budget_summary {
    return $BudgetsummaryCopyWith<$Res>(_value.budget_summary, (value) {
      return _then(_value.copyWith(budget_summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectInoiceDataImplCopyWith<$Res>
    implements $ProjectInoiceDataCopyWith<$Res> {
  factory _$$ProjectInoiceDataImplCopyWith(_$ProjectInoiceDataImpl value,
          $Res Function(_$ProjectInoiceDataImpl) then) =
      __$$ProjectInoiceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<InvoiceItem> invoices, Budgetsummary budget_summary});

  @override
  $BudgetsummaryCopyWith<$Res> get budget_summary;
}

/// @nodoc
class __$$ProjectInoiceDataImplCopyWithImpl<$Res>
    extends _$ProjectInoiceDataCopyWithImpl<$Res, _$ProjectInoiceDataImpl>
    implements _$$ProjectInoiceDataImplCopyWith<$Res> {
  __$$ProjectInoiceDataImplCopyWithImpl(_$ProjectInoiceDataImpl _value,
      $Res Function(_$ProjectInoiceDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoices = null,
    Object? budget_summary = null,
  }) {
    return _then(_$ProjectInoiceDataImpl(
      invoices: null == invoices
          ? _value._invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<InvoiceItem>,
      budget_summary: null == budget_summary
          ? _value.budget_summary
          : budget_summary // ignore: cast_nullable_to_non_nullable
              as Budgetsummary,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectInoiceDataImpl extends _ProjectInoiceData {
  const _$ProjectInoiceDataImpl(
      {required final List<InvoiceItem> invoices, required this.budget_summary})
      : _invoices = invoices,
        super._();

  factory _$ProjectInoiceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectInoiceDataImplFromJson(json);

  final List<InvoiceItem> _invoices;
  @override
  List<InvoiceItem> get invoices {
    if (_invoices is EqualUnmodifiableListView) return _invoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoices);
  }

  @override
  final Budgetsummary budget_summary;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectInoiceDataImplCopyWith<_$ProjectInoiceDataImpl> get copyWith =>
      __$$ProjectInoiceDataImplCopyWithImpl<_$ProjectInoiceDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectInoiceDataImplToJson(
      this,
    );
  }
}

abstract class _ProjectInoiceData extends ProjectInoiceData {
  const factory _ProjectInoiceData(
      {required final List<InvoiceItem> invoices,
      required final Budgetsummary budget_summary}) = _$ProjectInoiceDataImpl;
  const _ProjectInoiceData._() : super._();

  factory _ProjectInoiceData.fromJson(Map<String, dynamic> json) =
      _$ProjectInoiceDataImpl.fromJson;

  @override
  List<InvoiceItem> get invoices;
  @override
  Budgetsummary get budget_summary;
  @override
  @JsonKey(ignore: true)
  _$$ProjectInoiceDataImplCopyWith<_$ProjectInoiceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceItem _$InvoiceItemFromJson(Map<String, dynamic> json) {
  return _InvoiceItem.fromJson(json);
}

/// @nodoc
mixin _$InvoiceItem {
  int get id => throw _privateConstructorUsedError;
  int get project_id => throw _privateConstructorUsedError;
  int get category_id => throw _privateConstructorUsedError;
  String get invoice_number => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get invoice_date => throw _privateConstructorUsedError;
  Categorydetails get category_details => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceItemCopyWith<InvoiceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceItemCopyWith<$Res> {
  factory $InvoiceItemCopyWith(
          InvoiceItem value, $Res Function(InvoiceItem) then) =
      _$InvoiceItemCopyWithImpl<$Res, InvoiceItem>;
  @useResult
  $Res call(
      {int id,
      int project_id,
      int category_id,
      String invoice_number,
      int amount,
      String invoice_date,
      Categorydetails category_details,
      String? notes,
      String? attachment});

  $CategorydetailsCopyWith<$Res> get category_details;
}

/// @nodoc
class _$InvoiceItemCopyWithImpl<$Res, $Val extends InvoiceItem>
    implements $InvoiceItemCopyWith<$Res> {
  _$InvoiceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? project_id = null,
    Object? category_id = null,
    Object? invoice_number = null,
    Object? amount = null,
    Object? invoice_date = null,
    Object? category_details = null,
    Object? notes = freezed,
    Object? attachment = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      project_id: null == project_id
          ? _value.project_id
          : project_id // ignore: cast_nullable_to_non_nullable
              as int,
      category_id: null == category_id
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int,
      invoice_number: null == invoice_number
          ? _value.invoice_number
          : invoice_number // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      invoice_date: null == invoice_date
          ? _value.invoice_date
          : invoice_date // ignore: cast_nullable_to_non_nullable
              as String,
      category_details: null == category_details
          ? _value.category_details
          : category_details // ignore: cast_nullable_to_non_nullable
              as Categorydetails,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategorydetailsCopyWith<$Res> get category_details {
    return $CategorydetailsCopyWith<$Res>(_value.category_details, (value) {
      return _then(_value.copyWith(category_details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoiceItemImplCopyWith<$Res>
    implements $InvoiceItemCopyWith<$Res> {
  factory _$$InvoiceItemImplCopyWith(
          _$InvoiceItemImpl value, $Res Function(_$InvoiceItemImpl) then) =
      __$$InvoiceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int project_id,
      int category_id,
      String invoice_number,
      int amount,
      String invoice_date,
      Categorydetails category_details,
      String? notes,
      String? attachment});

  @override
  $CategorydetailsCopyWith<$Res> get category_details;
}

/// @nodoc
class __$$InvoiceItemImplCopyWithImpl<$Res>
    extends _$InvoiceItemCopyWithImpl<$Res, _$InvoiceItemImpl>
    implements _$$InvoiceItemImplCopyWith<$Res> {
  __$$InvoiceItemImplCopyWithImpl(
      _$InvoiceItemImpl _value, $Res Function(_$InvoiceItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? project_id = null,
    Object? category_id = null,
    Object? invoice_number = null,
    Object? amount = null,
    Object? invoice_date = null,
    Object? category_details = null,
    Object? notes = freezed,
    Object? attachment = freezed,
  }) {
    return _then(_$InvoiceItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      project_id: null == project_id
          ? _value.project_id
          : project_id // ignore: cast_nullable_to_non_nullable
              as int,
      category_id: null == category_id
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int,
      invoice_number: null == invoice_number
          ? _value.invoice_number
          : invoice_number // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      invoice_date: null == invoice_date
          ? _value.invoice_date
          : invoice_date // ignore: cast_nullable_to_non_nullable
              as String,
      category_details: null == category_details
          ? _value.category_details
          : category_details // ignore: cast_nullable_to_non_nullable
              as Categorydetails,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceItemImpl extends _InvoiceItem {
  const _$InvoiceItemImpl(
      {required this.id,
      required this.project_id,
      required this.category_id,
      required this.invoice_number,
      required this.amount,
      required this.invoice_date,
      required this.category_details,
      required this.notes,
      required this.attachment})
      : super._();

  factory _$InvoiceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceItemImplFromJson(json);

  @override
  final int id;
  @override
  final int project_id;
  @override
  final int category_id;
  @override
  final String invoice_number;
  @override
  final int amount;
  @override
  final String invoice_date;
  @override
  final Categorydetails category_details;
  @override
  final String? notes;
  @override
  final String? attachment;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceItemImplCopyWith<_$InvoiceItemImpl> get copyWith =>
      __$$InvoiceItemImplCopyWithImpl<_$InvoiceItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceItemImplToJson(
      this,
    );
  }
}

abstract class _InvoiceItem extends InvoiceItem {
  const factory _InvoiceItem(
      {required final int id,
      required final int project_id,
      required final int category_id,
      required final String invoice_number,
      required final int amount,
      required final String invoice_date,
      required final Categorydetails category_details,
      required final String? notes,
      required final String? attachment}) = _$InvoiceItemImpl;
  const _InvoiceItem._() : super._();

  factory _InvoiceItem.fromJson(Map<String, dynamic> json) =
      _$InvoiceItemImpl.fromJson;

  @override
  int get id;
  @override
  int get project_id;
  @override
  int get category_id;
  @override
  String get invoice_number;
  @override
  int get amount;
  @override
  String get invoice_date;
  @override
  Categorydetails get category_details;
  @override
  String? get notes;
  @override
  String? get attachment;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceItemImplCopyWith<_$InvoiceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Categorydetails _$CategorydetailsFromJson(Map<String, dynamic> json) {
  return _Categorydetails.fromJson(json);
}

/// @nodoc
mixin _$Categorydetails {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  dynamic get image_path => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategorydetailsCopyWith<Categorydetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorydetailsCopyWith<$Res> {
  factory $CategorydetailsCopyWith(
          Categorydetails value, $Res Function(Categorydetails) then) =
      _$CategorydetailsCopyWithImpl<$Res, Categorydetails>;
  @useResult
  $Res call(
      {int id,
      String name,
      dynamic image_path,
      String description,
      bool is_active,
      String type});
}

/// @nodoc
class _$CategorydetailsCopyWithImpl<$Res, $Val extends Categorydetails>
    implements $CategorydetailsCopyWith<$Res> {
  _$CategorydetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image_path = freezed,
    Object? description = null,
    Object? is_active = null,
    Object? type = null,
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
      image_path: freezed == image_path
          ? _value.image_path
          : image_path // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategorydetailsImplCopyWith<$Res>
    implements $CategorydetailsCopyWith<$Res> {
  factory _$$CategorydetailsImplCopyWith(_$CategorydetailsImpl value,
          $Res Function(_$CategorydetailsImpl) then) =
      __$$CategorydetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      dynamic image_path,
      String description,
      bool is_active,
      String type});
}

/// @nodoc
class __$$CategorydetailsImplCopyWithImpl<$Res>
    extends _$CategorydetailsCopyWithImpl<$Res, _$CategorydetailsImpl>
    implements _$$CategorydetailsImplCopyWith<$Res> {
  __$$CategorydetailsImplCopyWithImpl(
      _$CategorydetailsImpl _value, $Res Function(_$CategorydetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image_path = freezed,
    Object? description = null,
    Object? is_active = null,
    Object? type = null,
  }) {
    return _then(_$CategorydetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image_path: freezed == image_path
          ? _value.image_path
          : image_path // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategorydetailsImpl extends _Categorydetails {
  const _$CategorydetailsImpl(
      {required this.id,
      required this.name,
      required this.image_path,
      required this.description,
      required this.is_active,
      required this.type})
      : super._();

  factory _$CategorydetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategorydetailsImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final dynamic image_path;
  @override
  final String description;
  @override
  final bool is_active;
  @override
  final String type;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorydetailsImplCopyWith<_$CategorydetailsImpl> get copyWith =>
      __$$CategorydetailsImplCopyWithImpl<_$CategorydetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategorydetailsImplToJson(
      this,
    );
  }
}

abstract class _Categorydetails extends Categorydetails {
  const factory _Categorydetails(
      {required final int id,
      required final String name,
      required final dynamic image_path,
      required final String description,
      required final bool is_active,
      required final String type}) = _$CategorydetailsImpl;
  const _Categorydetails._() : super._();

  factory _Categorydetails.fromJson(Map<String, dynamic> json) =
      _$CategorydetailsImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  dynamic get image_path;
  @override
  String get description;
  @override
  bool get is_active;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$CategorydetailsImplCopyWith<_$CategorydetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Budgetsummary _$BudgetsummaryFromJson(Map<String, dynamic> json) {
  return _Budgetsummary.fromJson(json);
}

/// @nodoc
mixin _$Budgetsummary {
  int get total_budget => throw _privateConstructorUsedError;
  int get total_expenses => throw _privateConstructorUsedError;
  int get remaining_budget => throw _privateConstructorUsedError;
  double get budget_consumption_percentage =>
      throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetsummaryCopyWith<Budgetsummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetsummaryCopyWith<$Res> {
  factory $BudgetsummaryCopyWith(
          Budgetsummary value, $Res Function(Budgetsummary) then) =
      _$BudgetsummaryCopyWithImpl<$Res, Budgetsummary>;
  @useResult
  $Res call(
      {int total_budget,
      int total_expenses,
      int remaining_budget,
      double budget_consumption_percentage,
      String currency});
}

/// @nodoc
class _$BudgetsummaryCopyWithImpl<$Res, $Val extends Budgetsummary>
    implements $BudgetsummaryCopyWith<$Res> {
  _$BudgetsummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_budget = null,
    Object? total_expenses = null,
    Object? remaining_budget = null,
    Object? budget_consumption_percentage = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      total_budget: null == total_budget
          ? _value.total_budget
          : total_budget // ignore: cast_nullable_to_non_nullable
              as int,
      total_expenses: null == total_expenses
          ? _value.total_expenses
          : total_expenses // ignore: cast_nullable_to_non_nullable
              as int,
      remaining_budget: null == remaining_budget
          ? _value.remaining_budget
          : remaining_budget // ignore: cast_nullable_to_non_nullable
              as int,
      budget_consumption_percentage: null == budget_consumption_percentage
          ? _value.budget_consumption_percentage
          : budget_consumption_percentage // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetsummaryImplCopyWith<$Res>
    implements $BudgetsummaryCopyWith<$Res> {
  factory _$$BudgetsummaryImplCopyWith(
          _$BudgetsummaryImpl value, $Res Function(_$BudgetsummaryImpl) then) =
      __$$BudgetsummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total_budget,
      int total_expenses,
      int remaining_budget,
      double budget_consumption_percentage,
      String currency});
}

/// @nodoc
class __$$BudgetsummaryImplCopyWithImpl<$Res>
    extends _$BudgetsummaryCopyWithImpl<$Res, _$BudgetsummaryImpl>
    implements _$$BudgetsummaryImplCopyWith<$Res> {
  __$$BudgetsummaryImplCopyWithImpl(
      _$BudgetsummaryImpl _value, $Res Function(_$BudgetsummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_budget = null,
    Object? total_expenses = null,
    Object? remaining_budget = null,
    Object? budget_consumption_percentage = null,
    Object? currency = null,
  }) {
    return _then(_$BudgetsummaryImpl(
      total_budget: null == total_budget
          ? _value.total_budget
          : total_budget // ignore: cast_nullable_to_non_nullable
              as int,
      total_expenses: null == total_expenses
          ? _value.total_expenses
          : total_expenses // ignore: cast_nullable_to_non_nullable
              as int,
      remaining_budget: null == remaining_budget
          ? _value.remaining_budget
          : remaining_budget // ignore: cast_nullable_to_non_nullable
              as int,
      budget_consumption_percentage: null == budget_consumption_percentage
          ? _value.budget_consumption_percentage
          : budget_consumption_percentage // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetsummaryImpl extends _Budgetsummary {
  const _$BudgetsummaryImpl(
      {required this.total_budget,
      required this.total_expenses,
      required this.remaining_budget,
      required this.budget_consumption_percentage,
      required this.currency})
      : super._();

  factory _$BudgetsummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetsummaryImplFromJson(json);

  @override
  final int total_budget;
  @override
  final int total_expenses;
  @override
  final int remaining_budget;
  @override
  final double budget_consumption_percentage;
  @override
  final String currency;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetsummaryImplCopyWith<_$BudgetsummaryImpl> get copyWith =>
      __$$BudgetsummaryImplCopyWithImpl<_$BudgetsummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetsummaryImplToJson(
      this,
    );
  }
}

abstract class _Budgetsummary extends Budgetsummary {
  const factory _Budgetsummary(
      {required final int total_budget,
      required final int total_expenses,
      required final int remaining_budget,
      required final double budget_consumption_percentage,
      required final String currency}) = _$BudgetsummaryImpl;
  const _Budgetsummary._() : super._();

  factory _Budgetsummary.fromJson(Map<String, dynamic> json) =
      _$BudgetsummaryImpl.fromJson;

  @override
  int get total_budget;
  @override
  int get total_expenses;
  @override
  int get remaining_budget;
  @override
  double get budget_consumption_percentage;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$BudgetsummaryImplCopyWith<_$BudgetsummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
