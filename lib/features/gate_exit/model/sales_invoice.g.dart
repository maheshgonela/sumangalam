// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesInvoiceImpl _$$SalesInvoiceImplFromJson(Map<String, dynamic> json) =>
    _$SalesInvoiceImpl(
      name: json['name'] as String? ?? '',
      customerName: json['customer_name'] as String?,
      purchaseOrder: json['custom_purchase_order'] as String?,
      salesOrder: json['custom_sales_order'] as String?,
    );

Map<String, dynamic> _$$SalesInvoiceImplToJson(_$SalesInvoiceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'customer_name': instance.customerName,
      'custom_purchase_order': instance.purchaseOrder,
      'custom_sales_order': instance.salesOrder,
    };
