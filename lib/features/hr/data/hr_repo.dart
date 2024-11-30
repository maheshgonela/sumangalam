import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/features/hr/model/employee.dart';
import 'package:sumangalam/features/hr/model/on_duty_form.dart';

abstract interface class HRRepo {
  AsyncValueOf<String> createOnDuty(OnDutyForm form);
  AsyncValueOf<List<Employee>> fetchEmployees(bool check, DateTime start, DateTime end);
  AsyncValueOf<List<Employee>> fetchAttendace(bool check, DateTime start, DateTime end);
  AsyncValueOf<String> approveRequests(List<String> ids);
}