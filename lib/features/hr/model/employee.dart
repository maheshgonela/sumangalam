import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee {
  const factory Employee({
    @JsonKey(name: 'employee_checkin_id') required String checkInId,
    @JsonKey(name: 'employee_id') required String empId,
    @JsonKey(name: 'log_type') required String logType,
    @JsonKey(name: 'employee_name') required String employeeName,
    @JsonKey(name: 'punch_in_time') required String time,
    @JsonKey(name: 'approval_status') required String status,
    @JsonKey(name: 'custom_status') required String isApproved,
    @JsonKey(name: 'shift_type') required String shift,
    @JsonKey(name: 'custom_location_') String? location,
    @JsonKey(name: 'custom_selfie') String? selfie,
  }) = _Employee;
  
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
      

      
}
