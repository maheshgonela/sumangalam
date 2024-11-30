// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_duty_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnDutyFormImpl _$$OnDutyFormImplFromJson(Map<String, dynamic> json) =>
    _$OnDutyFormImpl(
      logType: json['log_type'] as String?,
      time: json['time'] as String?,
      custDetails: json['custom_customer_details'] as String?,
      purpose: json['custom_purpose'] as String?,
      remarks: json['custom_remarks'] as String?,
      dutyType: json['custom_type'] as String?,
      location: json['device_id'] as String?,
      selfie: json['selfie'] as String?,
      selfieFile: toNull(json['selfieFile']),
    );

Map<String, dynamic> _$$OnDutyFormImplToJson(_$OnDutyFormImpl instance) =>
    <String, dynamic>{
      'log_type': instance.logType,
      'time': instance.time,
      'custom_customer_details': instance.custDetails,
      'custom_purpose': instance.purpose,
      'custom_remarks': instance.remarks,
      'custom_type': instance.dutyType,
      'device_id': instance.location,
      'selfie': instance.selfie,
    };
