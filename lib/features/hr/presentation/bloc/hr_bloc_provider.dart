import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/cubit/network_request/network_request_cubit.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/core/model/pair_triple.dart';
import 'package:sumangalam/features/hr/data/hr_repo.dart';
import 'package:sumangalam/features/hr/model/employee.dart';

mixin ApprovalList on NetworkRequestCubit<List<Employee>, Pair<DateTime, DateTime>> {}
mixin ApprovedList on NetworkRequestCubit<List<Employee>, Pair<DateTime, DateTime>> {}

class OnDutyAuthCubit extends NetworkRequestCubit<List<Employee>, Pair<DateTime, DateTime>>
    with ApprovalList, ApprovedList{
  OnDutyAuthCubit({required super.onRequest});
}

mixin DraftAttendaceList on NetworkRequestCubit<List<Employee>, Pair<DateTime, DateTime>> {}
mixin AppAttendanceList on NetworkRequestCubit<List<Employee>, Pair<DateTime, DateTime>> {}

class AttendanceCubit extends NetworkRequestCubit<List<Employee>, Pair<DateTime, DateTime>>
    with DraftAttendaceList, AppAttendanceList{
  AttendanceCubit({required super.onRequest});
}

typedef ApproveAuthReqCubit = NetworkRequestCubit<String, List<String>>;
typedef ApproveAuthReqState = NetworkRequestState<String>;

@injectable
class HRBlocProvider {
  const HRBlocProvider({required this.repo});
  final HRRepo repo;

  static HRBlocProvider get() => $sl.get<HRBlocProvider>();

  ApprovalList approvalList() => OnDutyAuthCubit(
    onRequest: (params, __) => repo.fetchEmployees(false, params!.first, params.second),
  );

  ApprovedList approvedList() => OnDutyAuthCubit(
    onRequest: (params, __) => repo.fetchEmployees(true, params!.first, params.second),
  );

  DraftAttendaceList draftAttendace() => AttendanceCubit(
    onRequest: (params, __) => repo.fetchAttendace(false, params!.first, params.second),
  );

  AppAttendanceList approvedAttendance() => AttendanceCubit(
    onRequest: (params, __) => repo.fetchAttendace(true, params!.first, params.second),
  );

  ApproveAuthReqCubit approveReqs() => ApproveAuthReqCubit(
    onRequest: (params, __) => repo.approveRequests(params!),
  );
}