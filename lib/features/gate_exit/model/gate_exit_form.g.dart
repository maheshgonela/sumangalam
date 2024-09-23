// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gate_exit_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GateExitFormImpl _$$GateExitFormImplFromJson(Map<String, dynamic> json) =>
    _$GateExitFormImpl(
      exitno: json['name'] as String?,
      exitdate: json['gate_exit_date'] as String?,
      createdtime: json['created_time'] as String?,
      customerName: json['customer_name'] as String?,
      dcNo: json['dc_no'] as String?,
      sONO: json['so_number'] as String?,
      poNumber: json['purchase_order'] as String?,
      vehicleImageUrl: json['vehicle_image'] as String?,
      vehicleImage: toNull(json['vehicleImage']),
      vehicleNo: json['vehicle_no'] as String?,
      driverName: json['driver_name'] as String?,
      driverMobileNo: json['driver_mobile_no'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$GateExitFormImplToJson(_$GateExitFormImpl instance) =>
    <String, dynamic>{
      'name': instance.exitno,
      'gate_exit_date': _dateToJson(instance.exitdate),
      'created_time': instance.createdtime,
      'customer_name': instance.customerName,
      'dc_no': instance.dcNo,
      'so_number': instance.sONO,
      'purchase_order': instance.poNumber,
      'vehicle_no': instance.vehicleNo,
      'driver_name': instance.driverName,
      'driver_mobile_no': instance.driverMobileNo,
      'status': instance.status,
    };
