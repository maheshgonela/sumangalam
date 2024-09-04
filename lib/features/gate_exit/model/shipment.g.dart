// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShipmentImpl _$$ShipmentImplFromJson(Map<String, dynamic> json) =>
    _$ShipmentImpl(
      shipmentNo: json['name'] as String,
      dcNo: json['custom_dc_no'] as String,
      soNo: json['custom_so_number'] as String,
      poNumber: json['custom_po_number'] as String,
      customerName: json['custom_customer_name'] as String,
    );

Map<String, dynamic> _$$ShipmentImplToJson(_$ShipmentImpl instance) =>
    <String, dynamic>{
      'name': instance.shipmentNo,
      'custom_dc_no': instance.dcNo,
      'custom_so_number': instance.soNo,
      'custom_po_number': instance.poNumber,
      'custom_customer_name': instance.customerName,
    };
