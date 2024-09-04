// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Shipment _$ShipmentFromJson(Map<String, dynamic> json) {
  return _Shipment.fromJson(json);
}

/// @nodoc
mixin _$Shipment {
  @JsonKey(name: 'name')
  String get shipmentNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_dc_no')
  String get dcNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_so_number')
  String get soNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_po_number')
  String get poNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_customer_name')
  String get customerName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShipmentCopyWith<Shipment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentCopyWith<$Res> {
  factory $ShipmentCopyWith(Shipment value, $Res Function(Shipment) then) =
      _$ShipmentCopyWithImpl<$Res, Shipment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String shipmentNo,
      @JsonKey(name: 'custom_dc_no') String dcNo,
      @JsonKey(name: 'custom_so_number') String soNo,
      @JsonKey(name: 'custom_po_number') String poNumber,
      @JsonKey(name: 'custom_customer_name') String customerName});
}

/// @nodoc
class _$ShipmentCopyWithImpl<$Res, $Val extends Shipment>
    implements $ShipmentCopyWith<$Res> {
  _$ShipmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipmentNo = null,
    Object? dcNo = null,
    Object? soNo = null,
    Object? poNumber = null,
    Object? customerName = null,
  }) {
    return _then(_value.copyWith(
      shipmentNo: null == shipmentNo
          ? _value.shipmentNo
          : shipmentNo // ignore: cast_nullable_to_non_nullable
              as String,
      dcNo: null == dcNo
          ? _value.dcNo
          : dcNo // ignore: cast_nullable_to_non_nullable
              as String,
      soNo: null == soNo
          ? _value.soNo
          : soNo // ignore: cast_nullable_to_non_nullable
              as String,
      poNumber: null == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShipmentImplCopyWith<$Res>
    implements $ShipmentCopyWith<$Res> {
  factory _$$ShipmentImplCopyWith(
          _$ShipmentImpl value, $Res Function(_$ShipmentImpl) then) =
      __$$ShipmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String shipmentNo,
      @JsonKey(name: 'custom_dc_no') String dcNo,
      @JsonKey(name: 'custom_so_number') String soNo,
      @JsonKey(name: 'custom_po_number') String poNumber,
      @JsonKey(name: 'custom_customer_name') String customerName});
}

/// @nodoc
class __$$ShipmentImplCopyWithImpl<$Res>
    extends _$ShipmentCopyWithImpl<$Res, _$ShipmentImpl>
    implements _$$ShipmentImplCopyWith<$Res> {
  __$$ShipmentImplCopyWithImpl(
      _$ShipmentImpl _value, $Res Function(_$ShipmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipmentNo = null,
    Object? dcNo = null,
    Object? soNo = null,
    Object? poNumber = null,
    Object? customerName = null,
  }) {
    return _then(_$ShipmentImpl(
      shipmentNo: null == shipmentNo
          ? _value.shipmentNo
          : shipmentNo // ignore: cast_nullable_to_non_nullable
              as String,
      dcNo: null == dcNo
          ? _value.dcNo
          : dcNo // ignore: cast_nullable_to_non_nullable
              as String,
      soNo: null == soNo
          ? _value.soNo
          : soNo // ignore: cast_nullable_to_non_nullable
              as String,
      poNumber: null == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipmentImpl implements _Shipment {
  const _$ShipmentImpl(
      {@JsonKey(name: 'name') required this.shipmentNo,
      @JsonKey(name: 'custom_dc_no') required this.dcNo,
      @JsonKey(name: 'custom_so_number') required this.soNo,
      @JsonKey(name: 'custom_po_number') required this.poNumber,
      @JsonKey(name: 'custom_customer_name') required this.customerName});

  factory _$ShipmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipmentImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String shipmentNo;
  @override
  @JsonKey(name: 'custom_dc_no')
  final String dcNo;
  @override
  @JsonKey(name: 'custom_so_number')
  final String soNo;
  @override
  @JsonKey(name: 'custom_po_number')
  final String poNumber;
  @override
  @JsonKey(name: 'custom_customer_name')
  final String customerName;

  @override
  String toString() {
    return 'Shipment(shipmentNo: $shipmentNo, dcNo: $dcNo, soNo: $soNo, poNumber: $poNumber, customerName: $customerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentImpl &&
            (identical(other.shipmentNo, shipmentNo) ||
                other.shipmentNo == shipmentNo) &&
            (identical(other.dcNo, dcNo) || other.dcNo == dcNo) &&
            (identical(other.soNo, soNo) || other.soNo == soNo) &&
            (identical(other.poNumber, poNumber) ||
                other.poNumber == poNumber) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, shipmentNo, dcNo, soNo, poNumber, customerName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentImplCopyWith<_$ShipmentImpl> get copyWith =>
      __$$ShipmentImplCopyWithImpl<_$ShipmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipmentImplToJson(
      this,
    );
  }
}

abstract class _Shipment implements Shipment {
  const factory _Shipment(
      {@JsonKey(name: 'name') required final String shipmentNo,
      @JsonKey(name: 'custom_dc_no') required final String dcNo,
      @JsonKey(name: 'custom_so_number') required final String soNo,
      @JsonKey(name: 'custom_po_number') required final String poNumber,
      @JsonKey(name: 'custom_customer_name')
      required final String customerName}) = _$ShipmentImpl;

  factory _Shipment.fromJson(Map<String, dynamic> json) =
      _$ShipmentImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get shipmentNo;
  @override
  @JsonKey(name: 'custom_dc_no')
  String get dcNo;
  @override
  @JsonKey(name: 'custom_so_number')
  String get soNo;
  @override
  @JsonKey(name: 'custom_po_number')
  String get poNumber;
  @override
  @JsonKey(name: 'custom_customer_name')
  String get customerName;
  @override
  @JsonKey(ignore: true)
  _$$ShipmentImplCopyWith<_$ShipmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
