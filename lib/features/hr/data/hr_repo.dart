import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/features/hr/model/employee.dart';
import 'package:sumangalam/features/hr/model/on_duty_form.dart';
import 'package:sumangalam/features/hr/model/request_params.dart';

abstract interface class HRRepo {
  AsyncValueOf<String> createOnDuty(OnDutyForm form);
  AsyncValueOf<List<Employee>> fetchEmployees(RequestParams params);
  AsyncValueOf<List<Employee>> fetchAttendace(bool check, DateTime start, DateTime end);
  AsyncValueOf<String> approveRequests(List<String> ids,String status);
}