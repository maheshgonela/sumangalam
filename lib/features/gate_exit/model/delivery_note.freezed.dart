// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryNote _$DeliveryNoteFromJson(Map<String, dynamic> json) {
  return _DeliveryNote.fromJson(json);
}

/// @nodoc
mixin _$DeliveryNote {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_sales_order')
  String? get soNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_purchase_order')
  String? get poNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryNoteCopyWith<DeliveryNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryNoteCopyWith<$Res> {
  factory $DeliveryNoteCopyWith(
          DeliveryNote value, $Res Function(DeliveryNote) then) =
      _$DeliveryNoteCopyWithImpl<$Res, DeliveryNote>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'custom_sales_order') String? soNo,
      @JsonKey(name: 'custom_purchase_order') String? poNumber,
      @JsonKey(name: 'customer_name') String customerName});
}

/// @nodoc
class _$DeliveryNoteCopyWithImpl<$Res, $Val extends DeliveryNote>
    implements $DeliveryNoteCopyWith<$Res> {
  _$DeliveryNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? soNo = freezed,
    Object? poNumber = freezed,
    Object? customerName = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      soNo: freezed == soNo
          ? _value.soNo
          : soNo // ignore: cast_nullable_to_non_nullable
              as String?,
      poNumber: freezed == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryNoteImplCopyWith<$Res>
    implements $DeliveryNoteCopyWith<$Res> {
  factory _$$DeliveryNoteImplCopyWith(
          _$DeliveryNoteImpl value, $Res Function(_$DeliveryNoteImpl) then) =
      __$$DeliveryNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'custom_sales_order') String? soNo,
      @JsonKey(name: 'custom_purchase_order') String? poNumber,
      @JsonKey(name: 'customer_name') String customerName});
}

/// @nodoc
class __$$DeliveryNoteImplCopyWithImpl<$Res>
    extends _$DeliveryNoteCopyWithImpl<$Res, _$DeliveryNoteImpl>
    implements _$$DeliveryNoteImplCopyWith<$Res> {
  __$$DeliveryNoteImplCopyWithImpl(
      _$DeliveryNoteImpl _value, $Res Function(_$DeliveryNoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? soNo = freezed,
    Object? poNumber = freezed,
    Object? customerName = null,
  }) {
    return _then(_$DeliveryNoteImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      soNo: freezed == soNo
          ? _value.soNo
          : soNo // ignore: cast_nullable_to_non_nullable
              as String?,
      poNumber: freezed == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryNoteImpl implements _DeliveryNote {
  const _$DeliveryNoteImpl(
      {required this.name,
      @JsonKey(name: 'custom_sales_order') this.soNo,
      @JsonKey(name: 'custom_purchase_order') this.poNumber,
      @JsonKey(name: 'customer_name') required this.customerName});

  factory _$DeliveryNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryNoteImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'custom_sales_order')
  final String? soNo;
  @override
  @JsonKey(name: 'custom_purchase_order')
  final String? poNumber;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;

  @override
  String toString() {
    return 'DeliveryNote(name: $name, soNo: $soNo, poNumber: $poNumber, customerName: $customerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryNoteImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.soNo, soNo) || other.soNo == soNo) &&
            (identical(other.poNumber, poNumber) ||
                other.poNumber == poNumber) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, soNo, poNumber, customerName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryNoteImplCopyWith<_$DeliveryNoteImpl> get copyWith =>
      __$$DeliveryNoteImplCopyWithImpl<_$DeliveryNoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryNoteImplToJson(
      this,
    );
  }
}

abstract class _DeliveryNote implements DeliveryNote {
  const factory _DeliveryNote(
          {required final String name,
          @JsonKey(name: 'custom_sales_order') final String? soNo,
          @JsonKey(name: 'custom_purchase_order') final String? poNumber,
          @JsonKey(name: 'customer_name') required final String customerName}) =
      _$DeliveryNoteImpl;

  factory _DeliveryNote.fromJson(Map<String, dynamic> json) =
      _$DeliveryNoteImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'custom_sales_order')
  String? get soNo;
  @override
  @JsonKey(name: 'custom_purchase_order')
  String? get poNumber;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryNoteImplCopyWith<_$DeliveryNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
