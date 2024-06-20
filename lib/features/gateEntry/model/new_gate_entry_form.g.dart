// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_gate_entry_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GateEntryFormImpl _$$GateEntryFormImplFromJson(Map<String, dynamic> json) =>
    _$GateEntryFormImpl(
      creationDate: json['creationDate'] as String?,
      materialType: json['materialType'] as String?,
      vendorName: json['vendorName'] as String?,
      receiveMode:
          $enumDecodeNullable(_$ReceiverModeEnumMap, json['receiveMode']),
      poNumber: json['poNumber'] as String?,
      vendorInvoiceNo: json['vendorInvoiceNo'] as String?,
      vendorInvoiceDate: json['vendorInvoiceDate'] as String?,
      remarks: json['remarks'] as String?,
      docPhoto: json['docPhoto'] as String?,
      delivererName: json['delivererName'] as String?,
      delivererMobileNo: json['delivererMobileNo'] as String?,
      vehiclePhoto: json['vehiclePhoto'] as String?,
      vehicleNo: json['vehicleNo'] as String?,
      driverName: json['driverName'] as String?,
      driverMobileNo: json['driverMobileNo'] as String?,
      sealPhoto: json['sealPhoto'] as String?,
      weightPhoto: json['weightPhoto'] as String?,
    );

Map<String, dynamic> _$$GateEntryFormImplToJson(_$GateEntryFormImpl instance) =>
    <String, dynamic>{
      'creationDate': instance.creationDate,
      'materialType': instance.materialType,
      'vendorName': instance.vendorName,
      'receiveMode': _$ReceiverModeEnumMap[instance.receiveMode],
      'poNumber': instance.poNumber,
      'vendorInvoiceNo': instance.vendorInvoiceNo,
      'vendorInvoiceDate': instance.vendorInvoiceDate,
      'remarks': instance.remarks,
      'docPhoto': instance.docPhoto,
      'delivererName': instance.delivererName,
      'delivererMobileNo': instance.delivererMobileNo,
      'vehiclePhoto': instance.vehiclePhoto,
      'vehicleNo': instance.vehicleNo,
      'driverName': instance.driverName,
      'driverMobileNo': instance.driverMobileNo,
      'sealPhoto': instance.sealPhoto,
      'weightPhoto': instance.weightPhoto,
    };

const _$ReceiverModeEnumMap = {
  ReceiverMode.byHand: 'byHand',
  ReceiverMode.byVehicle: 'byVehicle',
};
