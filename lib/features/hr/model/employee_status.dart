import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_status.freezed.dart';
part 'employee_status.g.dart';


@freezed
class EmployeeStatus with _$EmployeeStatus {
  const factory EmployeeStatus({
 @JsonKey(name: 'employee') required String employee,
    @JsonKey(name: 'employee_name') required String employeeName,
    @JsonKey(name: 'employee_id') required String employeeId,
    @JsonKey(name: 'employee_checkin_id') required String employeeCheckinId,
    @JsonKey(name: 'log_type') required String logType,
    @JsonKey(name: 'punch_in_time') required String punchInTime,
    @JsonKey(name: 'custom_status') required String customStatus,
    @JsonKey(name: 'custom_selfie') String? customSelfie,
    @JsonKey(name: 'custom_location_') String? customLocation,
    @JsonKey(name: 'punch_date') required String punchDate,
        @JsonKey(name: 'custom_reject_reason',defaultValue: '') required String reason,

  }) = _EmployeeStatus;

  factory EmployeeStatus.fromJson(Map<String, dynamic> json) =>
      _$EmployeeStatusFromJson(json);
}
