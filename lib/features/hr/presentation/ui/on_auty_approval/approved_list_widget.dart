import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/cubit/network_request/network_request_cubit.dart';
import 'package:sumangalam/core/model/pair_triple.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/hr/model/employee.dart';
import 'package:sumangalam/features/hr/presentation/bloc/hr_bloc_provider.dart';
import 'package:sumangalam/features/hr/presentation/ui/on_auty_approval/pending_for_app_list.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ApprovedListWidget extends StatelessWidget {
  const ApprovedListWidget({super.key, required this.start, required this.end});

  final DateTime start;
  final DateTime end;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApprovedList, NetworkRequestState<List<Employee>>>(
      builder: (_, state) {
        return state.maybeWhen(
          orElse: () => const Center(child: AppLoadingIndicator()),
          failure: (failure) => AppFailureWidget(
            errorMsg: failure.error,
            retry: () => context.cubit<ApprovedList>().request(Pair(start, end)),
          ),
          success: (data) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(4.0),
              scrollDirection: Axis.horizontal,
              child: DataTable(
                horizontalMargin: 10,
                headingRowHeight: 35,
                decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.transparent),
                ),
                headingTextStyle: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                headingRowColor:
                    WidgetStateProperty.all(AppColors.catalineBlue),
                columns: const [
                  DataColumn(
                    label: Center(child: Text('Emp Id', textAlign: TextAlign.center)),
                  ),
                  DataColumn(
                    label: Center(child: Text('Emp Name', textAlign: TextAlign.center)),
                  ),
                  DataColumn(
                    label: Center(child: Text('Shift', textAlign: TextAlign.center)),
                  ),
                  DataColumn(
                    label: Center(child: Text('Time', textAlign: TextAlign.center)),
                  ),
                  DataColumn(
                    label: Center(child: Text('Status', textAlign: TextAlign.center)),
                  ),
                  DataColumn(
                    label: Center(child: Text('Location', textAlign: TextAlign.center)),
                  ),
                ],
                rows: [
                  for (final employee in data) ...[
                    DataRow(
                      onLongPress: employee.selfie.doesNotHaveValue
                        ? null 
                        : () => showDialog(
                          context: context, 
                          builder: (_) => ViewSelfieWidget(url: employee.selfie!)
                        ),
                      cells: [
                        DataCell(Text(employee.empId)),
                        DataCell(Text(employee.employeeName)),
                        DataCell(Text(employee.shift)),
                        DataCell(Text(DFU.fromFrappeDT(employee.time))),
                        DataCell(Text(employee.status)),
                        DataCell(InkWell(
                          onTap: () {
                            if (employee.location == null || employee.location == 'Not Provided') return;
                            _openGoogleMaps(employee.location!);
                          },
                          child: Text(employee.location.valueOrEmpty)),
                        ),
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
