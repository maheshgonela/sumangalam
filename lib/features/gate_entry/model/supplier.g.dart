// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupplierImpl _$$SupplierImplFromJson(Map<String, dynamic> json) =>
    _$SupplierImpl(
      supplier: json['supplier_name'] as String? ?? '',
      addLine1: json['address_line1'] as String?,
      addLine2: json['address_line2'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$SupplierImplToJson(_$SupplierImpl instance) =>
    <String, dynamic>{
      'supplier_name': instance.supplier,
      'address_line1': instance.addLine1,
      'address_line2': instance.addLine2,
      'phone': instance.phone,
    };
