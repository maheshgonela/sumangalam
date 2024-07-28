// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Supplier _$SupplierFromJson(Map<String, dynamic> json) {
  return _Supplier.fromJson(json);
}

/// @nodoc
mixin _$Supplier {
  @JsonKey(name: 'supplier_name', defaultValue: '')
  String get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line1')
  String? get addLine1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line2')
  String? get addLine2 => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupplierCopyWith<Supplier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplierCopyWith<$Res> {
  factory $SupplierCopyWith(Supplier value, $Res Function(Supplier) then) =
      _$SupplierCopyWithImpl<$Res, Supplier>;
  @useResult
  $Res call(
      {@JsonKey(name: 'supplier_name', defaultValue: '') String supplier,
      @JsonKey(name: 'address_line1') String? addLine1,
      @JsonKey(name: 'address_line2') String? addLine2,
      String? phone});
}

/// @nodoc
class _$SupplierCopyWithImpl<$Res, $Val extends Supplier>
    implements $SupplierCopyWith<$Res> {
  _$SupplierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplier = null,
    Object? addLine1 = freezed,
    Object? addLine2 = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      addLine1: freezed == addLine1
          ? _value.addLine1
          : addLine1 // ignore: cast_nullable_to_non_nullable
              as String?,
      addLine2: freezed == addLine2
          ? _value.addLine2
          : addLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupplierImplCopyWith<$Res>
    implements $SupplierCopyWith<$Res> {
  factory _$$SupplierImplCopyWith(
          _$SupplierImpl value, $Res Function(_$SupplierImpl) then) =
      __$$SupplierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'supplier_name', defaultValue: '') String supplier,
      @JsonKey(name: 'address_line1') String? addLine1,
      @JsonKey(name: 'address_line2') String? addLine2,
      String? phone});
}

/// @nodoc
class __$$SupplierImplCopyWithImpl<$Res>
    extends _$SupplierCopyWithImpl<$Res, _$SupplierImpl>
    implements _$$SupplierImplCopyWith<$Res> {
  __$$SupplierImplCopyWithImpl(
      _$SupplierImpl _value, $Res Function(_$SupplierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplier = null,
    Object? addLine1 = freezed,
    Object? addLine2 = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$SupplierImpl(
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      addLine1: freezed == addLine1
          ? _value.addLine1
          : addLine1 // ignore: cast_nullable_to_non_nullable
              as String?,
      addLine2: freezed == addLine2
          ? _value.addLine2
          : addLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupplierImpl implements _Supplier {
  const _$SupplierImpl(
      {@JsonKey(name: 'supplier_name', defaultValue: '') required this.supplier,
      @JsonKey(name: 'address_line1') this.addLine1,
      @JsonKey(name: 'address_line2') this.addLine2,
      this.phone});

  factory _$SupplierImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupplierImplFromJson(json);

  @override
  @JsonKey(name: 'supplier_name', defaultValue: '')
  final String supplier;
  @override
  @JsonKey(name: 'address_line1')
  final String? addLine1;
  @override
  @JsonKey(name: 'address_line2')
  final String? addLine2;
  @override
  final String? phone;

  @override
  String toString() {
    return 'Supplier(supplier: $supplier, addLine1: $addLine1, addLine2: $addLine2, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupplierImpl &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.addLine1, addLine1) ||
                other.addLine1 == addLine1) &&
            (identical(other.addLine2, addLine2) ||
                other.addLine2 == addLine2) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, supplier, addLine1, addLine2, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SupplierImplCopyWith<_$SupplierImpl> get copyWith =>
      __$$SupplierImplCopyWithImpl<_$SupplierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupplierImplToJson(
      this,
    );
  }
}

abstract class _Supplier implements Supplier {
  const factory _Supplier(
      {@JsonKey(name: 'supplier_name', defaultValue: '')
      required final String supplier,
      @JsonKey(name: 'address_line1') final String? addLine1,
      @JsonKey(name: 'address_line2') final String? addLine2,
      final String? phone}) = _$SupplierImpl;

  factory _Supplier.fromJson(Map<String, dynamic> json) =
      _$SupplierImpl.fromJson;

  @override
  @JsonKey(name: 'supplier_name', defaultValue: '')
  String get supplier;
  @override
  @JsonKey(name: 'address_line1')
  String? get addLine1;
  @override
  @JsonKey(name: 'address_line2')
  String? get addLine2;
  @override
  String? get phone;
  @override
  @JsonKey(ignore: true)
  _$$SupplierImplCopyWith<_$SupplierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
