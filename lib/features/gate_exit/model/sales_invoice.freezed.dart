// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesInvoice _$SalesInvoiceFromJson(Map<String, dynamic> json) {
  return _SalesInvoice.fromJson(json);
}

/// @nodoc
mixin _$SalesInvoice {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_purchase_order')
  String? get purchaseOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_sales_order')
  String? get salesOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesInvoiceCopyWith<SalesInvoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesInvoiceCopyWith<$Res> {
  factory $SalesInvoiceCopyWith(
          SalesInvoice value, $Res Function(SalesInvoice) then) =
      _$SalesInvoiceCopyWithImpl<$Res, SalesInvoice>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'customer_name') String? customerName,
      @JsonKey(name: 'custom_purchase_order') String? purchaseOrder,
      @JsonKey(name: 'custom_sales_order') String? salesOrder});
}

/// @nodoc
class _$SalesInvoiceCopyWithImpl<$Res, $Val extends SalesInvoice>
    implements $SalesInvoiceCopyWith<$Res> {
  _$SalesInvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? customerName = freezed,
    Object? purchaseOrder = freezed,
    Object? salesOrder = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseOrder: freezed == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as String?,
      salesOrder: freezed == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesInvoiceImplCopyWith<$Res>
    implements $SalesInvoiceCopyWith<$Res> {
  factory _$$SalesInvoiceImplCopyWith(
          _$SalesInvoiceImpl value, $Res Function(_$SalesInvoiceImpl) then) =
      __$$SalesInvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'customer_name') String? customerName,
      @JsonKey(name: 'custom_purchase_order') String? purchaseOrder,
      @JsonKey(name: 'custom_sales_order') String? salesOrder});
}

/// @nodoc
class __$$SalesInvoiceImplCopyWithImpl<$Res>
    extends _$SalesInvoiceCopyWithImpl<$Res, _$SalesInvoiceImpl>
    implements _$$SalesInvoiceImplCopyWith<$Res> {
  __$$SalesInvoiceImplCopyWithImpl(
      _$SalesInvoiceImpl _value, $Res Function(_$SalesInvoiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? customerName = freezed,
    Object? purchaseOrder = freezed,
    Object? salesOrder = freezed,
  }) {
    return _then(_$SalesInvoiceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseOrder: freezed == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as String?,
      salesOrder: freezed == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesInvoiceImpl implements _SalesInvoice {
  const _$SalesInvoiceImpl(
      {this.name = '',
      @JsonKey(name: 'customer_name') this.customerName,
      @JsonKey(name: 'custom_purchase_order') this.purchaseOrder,
      @JsonKey(name: 'custom_sales_order') this.salesOrder});

  factory _$SalesInvoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesInvoiceImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @override
  @JsonKey(name: 'custom_purchase_order')
  final String? purchaseOrder;
  @override
  @JsonKey(name: 'custom_sales_order')
  final String? salesOrder;

  @override
  String toString() {
    return 'SalesInvoice(name: $name, customerName: $customerName, purchaseOrder: $purchaseOrder, salesOrder: $salesOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesInvoiceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, customerName, purchaseOrder, salesOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesInvoiceImplCopyWith<_$SalesInvoiceImpl> get copyWith =>
      __$$SalesInvoiceImplCopyWithImpl<_$SalesInvoiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesInvoiceImplToJson(
      this,
    );
  }
}

abstract class _SalesInvoice implements SalesInvoice {
  const factory _SalesInvoice(
          {final String name,
          @JsonKey(name: 'customer_name') final String? customerName,
          @JsonKey(name: 'custom_purchase_order') final String? purchaseOrder,
          @JsonKey(name: 'custom_sales_order') final String? salesOrder}) =
      _$SalesInvoiceImpl;

  factory _SalesInvoice.fromJson(Map<String, dynamic> json) =
      _$SalesInvoiceImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'customer_name')
  String? get customerName;
  @override
  @JsonKey(name: 'custom_purchase_order')
  String? get purchaseOrder;
  @override
  @JsonKey(name: 'custom_sales_order')
  String? get salesOrder;
  @override
  @JsonKey(ignore: true)
  _$$SalesInvoiceImplCopyWith<_$SalesInvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
