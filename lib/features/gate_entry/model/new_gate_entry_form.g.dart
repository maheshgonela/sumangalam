// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_gate_entry_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GateEntryFormImpl _$$GateEntryFormImplFromJson(Map<String, dynamic> json) =>
    _$GateEntryFormImpl(
      gateEntryNo: json['name'] as String?,
      entryDate: json['gate_entry_date'] as String?,
      createdtime: json['created_time'] as String?,
      materialType: json['material_type'] as String?,
      vendor: json['supplier_name'] as String?,
      receiveMode: _receiveModeFromJson(json['receive_mode'] as String?),
      poNumber: json['purchase_order_no'] as String?,
      vendorInvoiceNo: json['vendor_invoice_no'] as String?,
      isPOAvailable: _$JsonConverterFromJson<int, bool>(
          json['po_available'], const BoolenAPIConverter().fromJson),
      vendorInvoiceDate: json['vendor_invoice_date'] as String?,
      remarks: json['remarks'] as String?,
      status: json['status'] as String?,
      docPhoto: toNull(json['document_image']),
      delivererName: json['deliverer_name'] as String?,
      delivererMobileNo: json['deliverer_mobile_number'] as String?,
      vehiclePhoto: toNull(json['vehicle_image']),
      vehicleNo: json['vehicle_no'] as String?,
      driverName: json['driver_name'] as String?,
      driverMobileNo: json['driver_mobile_no'] as String?,
      weight1: (json['weight1'] as num?)?.toDouble(),
      documentWeight: json['bill_weight'] as String?,
      sealPhoto: toNull(json['seal_tag_image']),
      weight1Photo: toNull(json['weigth1_image']),
      weight2Photo: toNull(json['weight2_image']),
      weight2: (json['weight2'] as num?)?.toDouble(),
      actualWeight: (json['actual_weight'] as num?)?.toDouble(),
      unloadedPilePhoto: toNull(json['unloaded_pile_pic']),
    );

Map<String, dynamic> _$$GateEntryFormImplToJson(_$GateEntryFormImpl instance) =>
    <String, dynamic>{
      'name': instance.gateEntryNo,
      'gate_entry_date': _dateToJson(instance.entryDate),
      'created_time': instance.createdtime,
      'material_type': instance.materialType,
      'supplier_name': instance.vendor,
      'receive_mode': _$ReceiverModeEnumMap[instance.receiveMode],
      'purchase_order_no': instance.poNumber,
      'vendor_invoice_no': instance.vendorInvoiceNo,
      'po_available': _$JsonConverterToJson<int, bool>(
          instance.isPOAvailable, const BoolenAPIConverter().toJson),
      'vendor_invoice_date': _dateToJson(instance.vendorInvoiceDate),
      'remarks': instance.remarks,
      'status': instance.status,
      'deliverer_name': instance.delivererName,
      'deliverer_mobile_number': instance.delivererMobileNo,
      'vehicle_no': instance.vehicleNo,
      'driver_name': instance.driverName,
      'driver_mobile_no': instance.driverMobileNo,
      'weight1': instance.weight1,
      'bill_weight': instance.documentWeight,
      'weight2': instance.weight2,
      'actual_weight': instance.actualWeight,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$ReceiverModeEnumMap = {
  ReceiverMode.byHand: 'byHand',
  ReceiverMode.byVehicle: 'byVehicle',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
