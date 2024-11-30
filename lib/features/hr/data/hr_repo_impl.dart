import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sumangalam/constants/urls.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/network/network.dart';
import 'package:sumangalam/features/hr/data/hr_repo.dart';
import 'package:sumangalam/features/hr/model/employee.dart';
import 'package:sumangalam/features/hr/model/on_duty_form.dart';

@LazySingleton(as: HRRepo)
class HRRepoImpl extends BaseApiRepository implements HRRepo {
  const HRRepoImpl(super.client);

  @override
  AsyncValueOf<String> createOnDuty(OnDutyForm form) async {
    try {
      final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      final parsedDate = DateFormat('dd-MM-yyyy HH:mm:ss').parse(form.time!);
      final dateTime = dateFormat.format(parsedDate);
      final config = RequestConfig(
        url: Urls.createCheckinss,
        reqParams: {
          'user': user().email,
          'time': dateTime,
          'log_type': form.logType,
          'custom_customer_details': form.custDetails,
          'custom_purpose': form.purpose,
          'custom_remarks': form.remarks,
          'custom_type': 'On Duty',
          'device_id': form.location,
          'custom_location_': form.location,
          'selfie': form.selfieFile,
        },
        parser: (p0) {
          final checkInNo =  p0['message']['checkin_no'];
          final message = p0['message']['message'];
          return '"$checkInNo" - $message';
        }
      );

      final response = await formRequest(config);
      return response.process((r) => right(r.data!));
    } on Exception catch (e, st) {
      $logger.error('[On Duty Auth]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  @override
  AsyncValueOf<List<Employee>> fetchEmployees(bool check, DateTime start, DateTime end) async {
    try {
      final config = RequestConfig(
        url: Urls.empCheckinss,
        reqParams: {
          'shift_request_approver': user().email,
          'custom_approved': check ? 1 : 0,
          'start_date': DFU.yyyyMMdd(start),
          'end_date': DFU.yyyyMMdd(end),
        },
        parser: (p0) {
          final data = p0['message'] as List<dynamic>;
          return data.map((e) => Employee.fromJson(e)).toList();
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    } on Exception catch (e, st) {
      $logger.error('[Employee List]', e, st);
      return left(Failure(error: e.toString()));
    }
  }
  
  @override
  AsyncValueOf<String> approveRequests(List<String> ids) async {
    try {
      final config = RequestConfig(
        url: Urls.approveCheckinss,
        body: jsonEncode({'employee_checkin_ids' : ids.join(',')}),
        parser: (p0) => p0,
      );
      $logger.devLog(config);
      final response = await post(config);
      return response.process((r) => right('Approved Successfully..!'));
    } on Exception catch (e, st) {
      $logger.error('[Employee List]', e, st);
      return left(Failure(error: e.toString()));
    }
  }
  
  @override
  AsyncValueOf<List<Employee>> fetchAttendace(bool check, DateTime start, DateTime end) async {
    try {
      final config = RequestConfig(
        url: Urls.empChecking,
        reqParams: {
          'shift_request_approver': user().email,
          'custom_approved': check ? 1 : 0,
          'start_date': DFU.yyyyMMdd(start),
          'end_date': DFU.yyyyMMdd(end),
        },
        parser: (p0) {
          final data = p0['message'] as List<dynamic>;
          return data.map((e) => Employee.fromJson(e)).toList();
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    } on Exception catch (e, st) {
      $logger.error('[Employee List]', e, st);
      return left(Failure(error: e.toString()));
    }
  }
}
