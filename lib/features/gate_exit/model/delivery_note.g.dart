// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryNoteImpl _$$DeliveryNoteImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryNoteImpl(
      name: json['name'] as String,
      soNo: json['custom_sales_order'] as String?,
      poNumber: json['custom_purchase_order'] as String?,
      customerName: json['customer_name'] as String,
    );

Map<String, dynamic> _$$DeliveryNoteImplToJson(_$DeliveryNoteImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'custom_sales_order': instance.soNo,
      'custom_purchase_order': instance.poNumber,
      'customer_name': instance.customerName,
    };
