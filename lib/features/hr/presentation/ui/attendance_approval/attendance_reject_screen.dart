import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/cubit/network_request/network_request_cubit.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/hr/model/employee_status.dart';
import 'package:sumangalam/features/hr/model/request_params.dart';
import 'package:sumangalam/features/hr/presentation/bloc/hr_bloc_provider.dart';
import 'package:sumangalam/features/hr/presentation/ui/on_auty_approval/pending_for_app_list.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AttendanceRejectScreen extends StatelessWidget {
  const AttendanceRejectScreen({
    super.key,
    required this.params,
  });

  final RequestParams params;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceRejectedList,
        NetworkRequestState<List<EmployeeStatus>>>(
      builder: (_, state) {
        print('Approval List state $state');
        return state.maybeWhen(
          orElse: () => const Center(child: AppLoadingIndicator()),
          failure: (failure) => AppFailureWidget(
            errorMsg: failure.error,
            retry: () =>
                context.cubit<AttendanceRejectedList>().request(params),
          ),
          success: (data) {
            if (data.isEmpty) {
              return AppFailureWidget(
                errorMsg: 'No Employee Are Rejected ',
                retry: () {
                  final inp = params;
                  context.cubit<AttendanceRejectedList>().request(inp);
                },
              );
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(4.0),
              scrollDirection: Axis.horizontal,
              child: DataTable(
                horizontalMargin: 10,
                headingRowHeight: 35,
                decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.transparent),
                ),
                border: TableBorder.all(
                    color: AppColors.white, width: 0, style: BorderStyle.solid),
                headingTextStyle: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                headingRowColor:
                    WidgetStateProperty.all(AppColors.catalineBlue),
                columns: const [
                  DataColumn(
                    label: Center(
                        child: Text('Emp Id', textAlign: TextAlign.center)),
                  ),
                  DataColumn(
                    label: Center(
                        child: Text('Emp Name', textAlign: TextAlign.center)),
                  ),
                  DataColumn(
                    label: Center(
                        child: Text('Log Type', textAlign: TextAlign.center)),
                  ),
                  DataColumn(
                    label: Center(
                        child: Text('Date', textAlign: TextAlign.center)),
                  ),
                  DataColumn(
                    label: Center(
                        child: Text('Time', textAlign: TextAlign.center)),
                  ),
                  DataColumn(
                    label: Center(
                        child: Text('Status', textAlign: TextAlign.center)),
                  ),
                  DataColumn(
                    label: Center(
                        child: Text('Reason', textAlign: TextAlign.center)),
                  ),
                ],
                rows: [
                  for (final employee in data) ...[
                    DataRow(
                      onLongPress: employee.customSelfie.doesNotHaveValue
                          ? null
                          : () => showDialog(
                              context: context,
                              builder: (_) => ViewSelfieWidget(
                                  url: employee.customSelfie!)),
                      cells: [
                        DataCell(Text(employee.employeeId)),
                        DataCell(Text(employee.employeeName)),
                        DataCell(Text(employee.logType)),
                        DataCell(Text(DFU.toDate(employee.punchDate))),
                        DataCell(Text(DFU.toTime(employee.punchInTime))),
                        DataCell(Text(employee.customStatus)),
                        DataCell(Text(employee.reason)),
                      ],
                    ),
                  ]
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _openGoogleMaps(String coordinates) async {
    final latLong = coordinates.split(',');

    final lat = double.parse(latLong[0].trim());
    final lng = double.parse(latLong[1].trim());

    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    final canLaunch = await canLaunchUrlString(url);
    if (canLaunch) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
