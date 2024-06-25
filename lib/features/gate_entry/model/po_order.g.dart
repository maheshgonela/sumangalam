// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'po_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$POOrderImpl _$$POOrderImplFromJson(Map<String, dynamic> json) =>
    _$POOrderImpl(
      name: json['name'] as String,
      supplier: json['supplier_name'] as String? ?? '',
      trxnDate: json['transaction_date'] as String?,
      status: json['status'] as String?,
      total: (json['grand_total'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$POOrderImplToJson(_$POOrderImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'supplier_name': instance.supplier,
      'transaction_date': instance.trxnDate,
      'status': instance.status,
      'grand_total': instance.total,
    };
