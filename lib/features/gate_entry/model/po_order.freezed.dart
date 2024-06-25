// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'po_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

POOrder _$POOrderFromJson(Map<String, dynamic> json) {
  return _POOrder.fromJson(json);
}

/// @nodoc
mixin _$POOrder {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name', defaultValue: '')
  String get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date')
  String? get trxnDate => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'grand_total', defaultValue: 0.0)
  double get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $POOrderCopyWith<POOrder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $POOrderCopyWith<$Res> {
  factory $POOrderCopyWith(POOrder value, $Res Function(POOrder) then) =
      _$POOrderCopyWithImpl<$Res, POOrder>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'supplier_name', defaultValue: '') String supplier,
      @JsonKey(name: 'transaction_date') String? trxnDate,
      String? status,
      @JsonKey(name: 'grand_total', defaultValue: 0.0) double total});
}

/// @nodoc
class _$POOrderCopyWithImpl<$Res, $Val extends POOrder>
    implements $POOrderCopyWith<$Res> {
  _$POOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? supplier = null,
    Object? trxnDate = freezed,
    Object? status = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      trxnDate: freezed == trxnDate
          ? _value.trxnDate
          : trxnDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$POOrderImplCopyWith<$Res> implements $POOrderCopyWith<$Res> {
  factory _$$POOrderImplCopyWith(
          _$POOrderImpl value, $Res Function(_$POOrderImpl) then) =
      __$$POOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'supplier_name', defaultValue: '') String supplier,
      @JsonKey(name: 'transaction_date') String? trxnDate,
      String? status,
      @JsonKey(name: 'grand_total', defaultValue: 0.0) double total});
}

/// @nodoc
class __$$POOrderImplCopyWithImpl<$Res>
    extends _$POOrderCopyWithImpl<$Res, _$POOrderImpl>
    implements _$$POOrderImplCopyWith<$Res> {
  __$$POOrderImplCopyWithImpl(
      _$POOrderImpl _value, $Res Function(_$POOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? supplier = null,
    Object? trxnDate = freezed,
    Object? status = freezed,
    Object? total = null,
  }) {
    return _then(_$POOrderImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      trxnDate: freezed == trxnDate
          ? _value.trxnDate
          : trxnDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$POOrderImpl implements _POOrder {
  const _$POOrderImpl(
      {required this.name,
      @JsonKey(name: 'supplier_name', defaultValue: '') required this.supplier,
      @JsonKey(name: 'transaction_date') this.trxnDate,
      this.status,
      @JsonKey(name: 'grand_total', defaultValue: 0.0) required this.total});

  factory _$POOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$POOrderImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'supplier_name', defaultValue: '')
  final String supplier;
  @override
  @JsonKey(name: 'transaction_date')
  final String? trxnDate;
  @override
  final String? status;
  @override
  @JsonKey(name: 'grand_total', defaultValue: 0.0)
  final double total;

  @override
  String toString() {
    return 'POOrder(name: $name, supplier: $supplier, trxnDate: $trxnDate, status: $status, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$POOrderImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.trxnDate, trxnDate) ||
                other.trxnDate == trxnDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, supplier, trxnDate, status, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$POOrderImplCopyWith<_$POOrderImpl> get copyWith =>
      __$$POOrderImplCopyWithImpl<_$POOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$POOrderImplToJson(
      this,
    );
  }
}

abstract class _POOrder implements POOrder {
  const factory _POOrder(
      {required final String name,
      @JsonKey(name: 'supplier_name', defaultValue: '')
      required final String supplier,
      @JsonKey(name: 'transaction_date') final String? trxnDate,
      final String? status,
      @JsonKey(name: 'grand_total', defaultValue: 0.0)
      required final double total}) = _$POOrderImpl;

  factory _POOrder.fromJson(Map<String, dynamic> json) = _$POOrderImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'supplier_name', defaultValue: '')
  String get supplier;
  @override
  @JsonKey(name: 'transaction_date')
  String? get trxnDate;
  @override
  String? get status;
  @override
  @JsonKey(name: 'grand_total', defaultValue: 0.0)
  double get total;
  @override
  @JsonKey(ignore: true)
  _$$POOrderImplCopyWith<_$POOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
