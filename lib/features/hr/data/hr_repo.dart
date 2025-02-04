import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/features/hr/model/employee.dart';
import 'package:sumangalam/features/hr/model/employee_status.dart';
import 'package:sumangalam/features/hr/model/on_duty_form.dart';
import 'package:sumangalam/features/hr/model/request_params.dart';

abstract interface class HRRepo {
  AsyncValueOf<String> createOnDuty(OnDutyForm form);
  AsyncValueOf<List<Employee>> fetchEmployees(RequestParams params);
  AsyncValueOf<List<Employee>> fetchAttendace(bool check, RequestParams params);
  AsyncValueOf<String> approveRequests(List<String> ids,String status,[String? rejectedReason]);
  AsyncValueOf<List<EmployeeStatus>> fetchAttendaceResult(bool check, RequestParams params);
}