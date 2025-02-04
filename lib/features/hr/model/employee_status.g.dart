// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeStatusImpl _$$EmployeeStatusImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeStatusImpl(
      employee: json['employee'] as String,
      employeeName: json['employee_name'] as String,
      employeeId: json['employee_id'] as String,
      employeeCheckinId: json['employee_checkin_id'] as String,
      logType: json['log_type'] as String,
      punchInTime: json['punch_in_time'] as String,
      customStatus: json['custom_status'] as String,
      customSelfie: json['custom_selfie'] as String?,
      customLocation: json['custom_location_'] as String?,
      punchDate: json['punch_date'] as String,
      reason: json['custom_reject_reason'] as String? ?? '',
    );

Map<String, dynamic> _$$EmployeeStatusImplToJson(
        _$EmployeeStatusImpl instance) =>
    <String, dynamic>{
      'employee': instance.employee,
      'employee_name': instance.employeeName,
      'employee_id': instance.employeeId,
      'employee_checkin_id': instance.employeeCheckinId,
      'log_type': instance.logType,
      'punch_in_time': instance.punchInTime,
      'custom_status': instance.customStatus,
      'custom_selfie': instance.customSelfie,
      'custom_location_': instance.customLocation,
      'punch_date': instance.punchDate,
      'custom_reject_reason': instance.reason,
    };
