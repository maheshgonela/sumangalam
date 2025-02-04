import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/cubit/network_request/network_request_cubit.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/features/hr/data/hr_repo.dart';
import 'package:sumangalam/features/hr/model/employee.dart';
import 'package:sumangalam/features/hr/model/employee_status.dart';
import 'package:sumangalam/features/hr/model/request_params.dart';

mixin ApprovalList on NetworkRequestCubit<List<Employee>, RequestParams> {}
mixin ApprovedList on NetworkRequestCubit<List<Employee>, RequestParams> {}
mixin RejectedList on NetworkRequestCubit<List<Employee>, RequestParams> {}

mixin AttendanceApprovedList
    on NetworkRequestCubit<List<EmployeeStatus>, RequestParams> {}
mixin AttendanceRejectedList
    on NetworkRequestCubit<List<EmployeeStatus>, RequestParams> {}

class OnDutyAuthCubit extends NetworkRequestCubit<List<Employee>, RequestParams>
    with ApprovalList, ApprovedList, RejectedList {
  OnDutyAuthCubit({required super.onRequest});
}

mixin DraftAttendaceList
    on NetworkRequestCubit<List<Employee>, RequestParams> {}
mixin AppAttendanceList on NetworkRequestCubit<List<Employee>, RequestParams> {}

class AttendanceCubit extends NetworkRequestCubit<List<Employee>, RequestParams>
    with DraftAttendaceList, AppAttendanceList {
  AttendanceCubit({required super.onRequest});
}

class AttendanceStatusCubit
    extends NetworkRequestCubit<List<EmployeeStatus>, RequestParams>
    with AttendanceApprovedList, AttendanceRejectedList {
  AttendanceStatusCubit({required super.onRequest});
}

typedef ApproveAuthReqCubit
    = NetworkRequestCubit<String, Tuple3<List<String>, String,String?>>;
typedef ApproveAuthReqState = NetworkRequestState<String>;

@injectable
class HRBlocProvider {
  const HRBlocProvider({required this.repo});
  final HRRepo repo;

  static HRBlocProvider get() => $sl.get<HRBlocProvider>();

  ApprovalList approvalList() => OnDutyAuthCubit(
        onRequest: (params, __) => repo.fetchEmployees(params!),
      );

  ApprovedList approvedList() => OnDutyAuthCubit(
        onRequest: (params, __) => repo.fetchEmployees(params!),
      );
  RejectedList rejectedList() => OnDutyAuthCubit(
        onRequest: (params, __) => repo.fetchEmployees(params!),
      );

  DraftAttendaceList draftAttendace() => AttendanceCubit(
        onRequest: (params, __) => repo.fetchAttendace(false, params!),
      );

  AppAttendanceList approvedAttendance() => AttendanceCubit(
        onRequest: (params, __) => repo.fetchAttendace(true, params!),
      );

  ApproveAuthReqCubit approveReqs() => ApproveAuthReqCubit(
        onRequest: (params, __) =>
            repo.approveRequests(params!.value1, params.value2,params.value3),
      );

  AttendanceApprovedList attendaceApprovedList() => AttendanceStatusCubit(
        onRequest: (params, state) => repo.fetchAttendaceResult(true, params!),
      );

        AttendanceRejectedList attendaceRejectedList() => AttendanceStatusCubit(
        onRequest: (params, state) => repo.fetchAttendaceResult(true, params!),
      );
}
