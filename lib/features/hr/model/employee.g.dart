// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeImpl _$$EmployeeImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeImpl(
      checkInId: json['employee_checkin_id'] as String,
      empId: json['employee_id'] as String,
      logType: json['log_type'] as String,
      employeeName: json['employee_name'] as String,
      time: json['punch_in_time'] as String,
      status: json['approval_status'] as String,
      isApproved: (json['custom_approved'] as num).toInt(),
      shift: json['shift_type'] as String,
      location: json['custom_location_'] as String?,
      selfie: json['custom_selfie'] as String?,
    );

Map<String, dynamic> _$$EmployeeImplToJson(_$EmployeeImpl instance) =>
    <String, dynamic>{
      'employee_checkin_id': instance.checkInId,
      'employee_id': instance.empId,
      'log_type': instance.logType,
      'employee_name': instance.employeeName,
      'punch_in_time': instance.time,
      'approval_status': instance.status,
      'custom_approved': instance.isApproved,
      'shift_type': instance.shift,
      'custom_location_': instance.location,
      'custom_selfie': instance.selfie,
    };
