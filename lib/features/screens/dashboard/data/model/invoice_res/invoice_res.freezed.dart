// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceRes _$InvoiceResFromJson(Map<String, dynamic> json) {
  return _InvoiceRes.fromJson(json);
}

/// @nodoc
mixin _$InvoiceRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  InvoiceData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceResCopyWith<InvoiceRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceResCopyWith<$Res> {
  factory $InvoiceResCopyWith(
          InvoiceRes value, $Res Function(InvoiceRes) then) =
      _$InvoiceResCopyWithImpl<$Res, InvoiceRes>;
  @useResult
  $Res call({String status, String message, InvoiceData data});

  $InvoiceDataCopyWith<$Res> get data;
}

/// @nodoc
class _$InvoiceResCopyWithImpl<$Res, $Val extends InvoiceRes>
    implements $InvoiceResCopyWith<$Res> {
  _$InvoiceResCopyWithImpl(this._value, this._then);

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
              as InvoiceData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InvoiceDataCopyWith<$Res> get data {
    return $InvoiceDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoiceResImplCopyWith<$Res>
    implements $InvoiceResCopyWith<$Res> {
  factory _$$InvoiceResImplCopyWith(
          _$InvoiceResImpl value, $Res Function(_$InvoiceResImpl) then) =
      __$$InvoiceResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, InvoiceData data});

  @override
  $InvoiceDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$InvoiceResImplCopyWithImpl<$Res>
    extends _$InvoiceResCopyWithImpl<$Res, _$InvoiceResImpl>
    implements _$$InvoiceResImplCopyWith<$Res> {
  __$$InvoiceResImplCopyWithImpl(
      _$InvoiceResImpl _value, $Res Function(_$InvoiceResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$InvoiceResImpl(
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
              as InvoiceData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceResImpl extends _InvoiceRes {
  const _$InvoiceResImpl(
      {required this.status, required this.message, required this.data})
      : super._();

  factory _$InvoiceResImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final InvoiceData data;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceResImplCopyWith<_$InvoiceResImpl> get copyWith =>
      __$$InvoiceResImplCopyWithImpl<_$InvoiceResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceResImplToJson(
      this,
    );
  }
}

abstract class _InvoiceRes extends InvoiceRes {
  const factory _InvoiceRes(
      {required final String status,
      required final String message,
      required final InvoiceData data}) = _$InvoiceResImpl;
  const _InvoiceRes._() : super._();

  factory _InvoiceRes.fromJson(Map<String, dynamic> json) =
      _$InvoiceResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  InvoiceData get data;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceResImplCopyWith<_$InvoiceResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceData _$InvoiceDataFromJson(Map<String, dynamic> json) {
  return _InvoiceData.fromJson(json);
}

/// @nodoc
mixin _$InvoiceData {
  Invoice get invoice => throw _privateConstructorUsedError;
  Budgetsummary get budget_summary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceDataCopyWith<InvoiceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDataCopyWith<$Res> {
  factory $InvoiceDataCopyWith(
          InvoiceData value, $Res Function(InvoiceData) then) =
      _$InvoiceDataCopyWithImpl<$Res, InvoiceData>;
  @useResult
  $Res call({Invoice invoice, Budgetsummary budget_summary});

  $InvoiceCopyWith<$Res> get invoice;
  $BudgetsummaryCopyWith<$Res> get budget_summary;
}

/// @nodoc
class _$InvoiceDataCopyWithImpl<$Res, $Val extends InvoiceData>
    implements $InvoiceDataCopyWith<$Res> {
  _$InvoiceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoice = null,
    Object? budget_summary = null,
  }) {
    return _then(_value.copyWith(
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as Invoice,
      budget_summary: null == budget_summary
          ? _value.budget_summary
          : budget_summary // ignore: cast_nullable_to_non_nullable
              as Budgetsummary,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InvoiceCopyWith<$Res> get invoice {
    return $InvoiceCopyWith<$Res>(_value.invoice, (value) {
      return _then(_value.copyWith(invoice: value) as $Val);
    });
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
abstract class _$$InvoiceDataImplCopyWith<$Res>
    implements $InvoiceDataCopyWith<$Res> {
  factory _$$InvoiceDataImplCopyWith(
          _$InvoiceDataImpl value, $Res Function(_$InvoiceDataImpl) then) =
      __$$InvoiceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Invoice invoice, Budgetsummary budget_summary});

  @override
  $InvoiceCopyWith<$Res> get invoice;
  @override
  $BudgetsummaryCopyWith<$Res> get budget_summary;
}

/// @nodoc
class __$$InvoiceDataImplCopyWithImpl<$Res>
    extends _$InvoiceDataCopyWithImpl<$Res, _$InvoiceDataImpl>
    implements _$$InvoiceDataImplCopyWith<$Res> {
  __$$InvoiceDataImplCopyWithImpl(
      _$InvoiceDataImpl _value, $Res Function(_$InvoiceDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoice = null,
    Object? budget_summary = null,
  }) {
    return _then(_$InvoiceDataImpl(
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as Invoice,
      budget_summary: null == budget_summary
          ? _value.budget_summary
          : budget_summary // ignore: cast_nullable_to_non_nullable
              as Budgetsummary,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceDataImpl extends _InvoiceData {
  const _$InvoiceDataImpl({required this.invoice, required this.budget_summary})
      : super._();

  factory _$InvoiceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceDataImplFromJson(json);

  @override
  final Invoice invoice;
  @override
  final Budgetsummary budget_summary;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceDataImplCopyWith<_$InvoiceDataImpl> get copyWith =>
      __$$InvoiceDataImplCopyWithImpl<_$InvoiceDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceDataImplToJson(
      this,
    );
  }
}

abstract class _InvoiceData extends InvoiceData {
  const factory _InvoiceData(
      {required final Invoice invoice,
      required final Budgetsummary budget_summary}) = _$InvoiceDataImpl;
  const _InvoiceData._() : super._();

  factory _InvoiceData.fromJson(Map<String, dynamic> json) =
      _$InvoiceDataImpl.fromJson;

  @override
  Invoice get invoice;
  @override
  Budgetsummary get budget_summary;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceDataImplCopyWith<_$InvoiceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return _Invoice.fromJson(json);
}

/// @nodoc
mixin _$Invoice {
  int get id => throw _privateConstructorUsedError;
  int get project_id => throw _privateConstructorUsedError;
  String get category_id => throw _privateConstructorUsedError;
  String? get invoice_number => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String? get invoice_date => throw _privateConstructorUsedError;
  Categorydetails? get category_details => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceCopyWith<Invoice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceCopyWith<$Res> {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) then) =
      _$InvoiceCopyWithImpl<$Res, Invoice>;
  @useResult
  $Res call(
      {int id,
      int project_id,
      String category_id,
      String? invoice_number,
      int amount,
      String? invoice_date,
      Categorydetails? category_details,
      String? notes,
      String? attachment});

  $CategorydetailsCopyWith<$Res>? get category_details;
}

/// @nodoc
class _$InvoiceCopyWithImpl<$Res, $Val extends Invoice>
    implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._value, this._then);

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
    Object? invoice_number = freezed,
    Object? amount = null,
    Object? invoice_date = freezed,
    Object? category_details = freezed,
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
              as String,
      invoice_number: freezed == invoice_number
          ? _value.invoice_number
          : invoice_number // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      invoice_date: freezed == invoice_date
          ? _value.invoice_date
          : invoice_date // ignore: cast_nullable_to_non_nullable
              as String?,
      category_details: freezed == category_details
          ? _value.category_details
          : category_details // ignore: cast_nullable_to_non_nullable
              as Categorydetails?,
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
  $CategorydetailsCopyWith<$Res>? get category_details {
    if (_value.category_details == null) {
      return null;
    }

    return $CategorydetailsCopyWith<$Res>(_value.category_details!, (value) {
      return _then(_value.copyWith(category_details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoiceImplCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$$InvoiceImplCopyWith(
          _$InvoiceImpl value, $Res Function(_$InvoiceImpl) then) =
      __$$InvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int project_id,
      String category_id,
      String? invoice_number,
      int amount,
      String? invoice_date,
      Categorydetails? category_details,
      String? notes,
      String? attachment});

  @override
  $CategorydetailsCopyWith<$Res>? get category_details;
}

/// @nodoc
class __$$InvoiceImplCopyWithImpl<$Res>
    extends _$InvoiceCopyWithImpl<$Res, _$InvoiceImpl>
    implements _$$InvoiceImplCopyWith<$Res> {
  __$$InvoiceImplCopyWithImpl(
      _$InvoiceImpl _value, $Res Function(_$InvoiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? project_id = null,
    Object? category_id = null,
    Object? invoice_number = freezed,
    Object? amount = null,
    Object? invoice_date = freezed,
    Object? category_details = freezed,
    Object? notes = freezed,
    Object? attachment = freezed,
  }) {
    return _then(_$InvoiceImpl(
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
              as String,
      invoice_number: freezed == invoice_number
          ? _value.invoice_number
          : invoice_number // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      invoice_date: freezed == invoice_date
          ? _value.invoice_date
          : invoice_date // ignore: cast_nullable_to_non_nullable
              as String?,
      category_details: freezed == category_details
          ? _value.category_details
          : category_details // ignore: cast_nullable_to_non_nullable
              as Categorydetails?,
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
class _$InvoiceImpl extends _Invoice {
  const _$InvoiceImpl(
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

  factory _$InvoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceImplFromJson(json);

  @override
  final int id;
  @override
  final int project_id;
  @override
  final String category_id;
  @override
  final String? invoice_number;
  @override
  final int amount;
  @override
  final String? invoice_date;
  @override
  final Categorydetails? category_details;
  @override
  final String? notes;
  @override
  final String? attachment;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      __$$InvoiceImplCopyWithImpl<_$InvoiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceImplToJson(
      this,
    );
  }
}

abstract class _Invoice extends Invoice {
  const factory _Invoice(
      {required final int id,
      required final int project_id,
      required final String category_id,
      required final String? invoice_number,
      required final int amount,
      required final String? invoice_date,
      required final Categorydetails? category_details,
      required final String? notes,
      required final String? attachment}) = _$InvoiceImpl;
  const _Invoice._() : super._();

  factory _Invoice.fromJson(Map<String, dynamic> json) = _$InvoiceImpl.fromJson;

  @override
  int get id;
  @override
  int get project_id;
  @override
  String get category_id;
  @override
  String? get invoice_number;
  @override
  int get amount;
  @override
  String? get invoice_date;
  @override
  Categorydetails? get category_details;
  @override
  String? get notes;
  @override
  String? get attachment;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
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
