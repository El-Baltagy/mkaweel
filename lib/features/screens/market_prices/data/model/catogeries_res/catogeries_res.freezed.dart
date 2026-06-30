// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catogeries_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CatogeriesRes _$CatogeriesResFromJson(Map<String, dynamic> json) {
  return _CatogeriesRes.fromJson(json);
}

/// @nodoc
mixin _$CatogeriesRes {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<CatogeryItem> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatogeriesResCopyWith<CatogeriesRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatogeriesResCopyWith<$Res> {
  factory $CatogeriesResCopyWith(
          CatogeriesRes value, $Res Function(CatogeriesRes) then) =
      _$CatogeriesResCopyWithImpl<$Res, CatogeriesRes>;
  @useResult
  $Res call({String status, String message, List<CatogeryItem> data});
}

/// @nodoc
class _$CatogeriesResCopyWithImpl<$Res, $Val extends CatogeriesRes>
    implements $CatogeriesResCopyWith<$Res> {
  _$CatogeriesResCopyWithImpl(this._value, this._then);

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
              as List<CatogeryItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CatogeriesResImplCopyWith<$Res>
    implements $CatogeriesResCopyWith<$Res> {
  factory _$$CatogeriesResImplCopyWith(
          _$CatogeriesResImpl value, $Res Function(_$CatogeriesResImpl) then) =
      __$$CatogeriesResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, List<CatogeryItem> data});
}

/// @nodoc
class __$$CatogeriesResImplCopyWithImpl<$Res>
    extends _$CatogeriesResCopyWithImpl<$Res, _$CatogeriesResImpl>
    implements _$$CatogeriesResImplCopyWith<$Res> {
  __$$CatogeriesResImplCopyWithImpl(
      _$CatogeriesResImpl _value, $Res Function(_$CatogeriesResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$CatogeriesResImpl(
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
              as List<CatogeryItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CatogeriesResImpl extends _CatogeriesRes {
  const _$CatogeriesResImpl(
      {required this.status,
      required this.message,
      required final List<CatogeryItem> data})
      : _data = data,
        super._();

  factory _$CatogeriesResImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatogeriesResImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  final List<CatogeryItem> _data;
  @override
  List<CatogeryItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatogeriesResImplCopyWith<_$CatogeriesResImpl> get copyWith =>
      __$$CatogeriesResImplCopyWithImpl<_$CatogeriesResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatogeriesResImplToJson(
      this,
    );
  }
}

abstract class _CatogeriesRes extends CatogeriesRes {
  const factory _CatogeriesRes(
      {required final String status,
      required final String message,
      required final List<CatogeryItem> data}) = _$CatogeriesResImpl;
  const _CatogeriesRes._() : super._();

  factory _CatogeriesRes.fromJson(Map<String, dynamic> json) =
      _$CatogeriesResImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  List<CatogeryItem> get data;
  @override
  @JsonKey(ignore: true)
  _$$CatogeriesResImplCopyWith<_$CatogeriesResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CatogeryItem _$CatogeryItemFromJson(Map<String, dynamic> json) {
  return _CatogeryItem.fromJson(json);
}

/// @nodoc
mixin _$CatogeryItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get image_path => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int? get construction_materials_count => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatogeryItemCopyWith<CatogeryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatogeryItemCopyWith<$Res> {
  factory $CatogeryItemCopyWith(
          CatogeryItem value, $Res Function(CatogeryItem) then) =
      _$CatogeryItemCopyWithImpl<$Res, CatogeryItem>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? image_path,
      String description,
      bool is_active,
      String type,
      int? construction_materials_count,
      String created_at});
}

/// @nodoc
class _$CatogeryItemCopyWithImpl<$Res, $Val extends CatogeryItem>
    implements $CatogeryItemCopyWith<$Res> {
  _$CatogeryItemCopyWithImpl(this._value, this._then);

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
    Object? construction_materials_count = freezed,
    Object? created_at = null,
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
              as String?,
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
      construction_materials_count: freezed == construction_materials_count
          ? _value.construction_materials_count
          : construction_materials_count // ignore: cast_nullable_to_non_nullable
              as int?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CatogeryItemImplCopyWith<$Res>
    implements $CatogeryItemCopyWith<$Res> {
  factory _$$CatogeryItemImplCopyWith(
          _$CatogeryItemImpl value, $Res Function(_$CatogeryItemImpl) then) =
      __$$CatogeryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? image_path,
      String description,
      bool is_active,
      String type,
      int? construction_materials_count,
      String created_at});
}

/// @nodoc
class __$$CatogeryItemImplCopyWithImpl<$Res>
    extends _$CatogeryItemCopyWithImpl<$Res, _$CatogeryItemImpl>
    implements _$$CatogeryItemImplCopyWith<$Res> {
  __$$CatogeryItemImplCopyWithImpl(
      _$CatogeryItemImpl _value, $Res Function(_$CatogeryItemImpl) _then)
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
    Object? construction_materials_count = freezed,
    Object? created_at = null,
  }) {
    return _then(_$CatogeryItemImpl(
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
              as String?,
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
      construction_materials_count: freezed == construction_materials_count
          ? _value.construction_materials_count
          : construction_materials_count // ignore: cast_nullable_to_non_nullable
              as int?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CatogeryItemImpl extends _CatogeryItem {
  const _$CatogeryItemImpl(
      {required this.id,
      required this.name,
      required this.image_path,
      required this.description,
      required this.is_active,
      required this.type,
      required this.construction_materials_count,
      required this.created_at})
      : super._();

  factory _$CatogeryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatogeryItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? image_path;
  @override
  final String description;
  @override
  final bool is_active;
  @override
  final String type;
  @override
  final int? construction_materials_count;
  @override
  final String created_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatogeryItemImplCopyWith<_$CatogeryItemImpl> get copyWith =>
      __$$CatogeryItemImplCopyWithImpl<_$CatogeryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatogeryItemImplToJson(
      this,
    );
  }
}

abstract class _CatogeryItem extends CatogeryItem {
  const factory _CatogeryItem(
      {required final int id,
      required final String name,
      required final String? image_path,
      required final String description,
      required final bool is_active,
      required final String type,
      required final int? construction_materials_count,
      required final String created_at}) = _$CatogeryItemImpl;
  const _CatogeryItem._() : super._();

  factory _CatogeryItem.fromJson(Map<String, dynamic> json) =
      _$CatogeryItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get image_path;
  @override
  String get description;
  @override
  bool get is_active;
  @override
  String get type;
  @override
  int? get construction_materials_count;
  @override
  String get created_at;
  @override
  @JsonKey(ignore: true)
  _$$CatogeryItemImplCopyWith<_$CatogeryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
