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

class DraftAttendanceList extends StatelessWidget {
  const DraftAttendanceList({super.key, required this.start, required this.end});

  final DateTime start;
  final DateTime end;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ApproveAuthReqCubit, ApproveAuthReqState>(
      listener: (_, state) {
        state.maybeWhen(
          orElse: () {},
          failure: (failure) {
            AppDialog.showSuccessDialog(
              context,
              content: failure.error,
              onTapDismiss: context.exit,
            );
          },
          success: (data) {
            AppDialog.showSuccessDialog(
              context,
              content: 'Attendance Approved Successfully..!',
              onTapDismiss: context.exit,
            ).then((_) {
              if (!context.mounted) return;
              final inp = Pair(start, end);
              context
                ..cubit<AppAttendanceList>().request(inp)
                ..cubit<DraftAttendaceList>().request(inp);
            });
          },
        );
      },
      child: BlocBuilder<DraftAttendaceList, NetworkRequestState<List<Employee>>>(
        builder: (_, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: AppLoadingIndicator()),
            failure: (failure) => AppFailureWidget(
              errorMsg: failure.error,
              retry: () => context.cubit<ApprovalList>().request(Pair(start, end)),
            ),
            success: (data) {
              if(data.isEmpty) {
                return AppFailureWidget(
                  errorMsg: 'No Draft Employee Checkins Found To Approve',
                  retry: () {
                    final inp = Pair(start, end);
                    context.cubit<ApprovalList>().request(inp);
                  },
                );
              }
              return _PendingFeeTableWidget(data: data);
            },
          );
        },
      ),
    );
  }
}

class _PendingFeeTableWidget extends StatefulWidget {
  const _PendingFeeTableWidget({required this.data});

  final List<Employee> data;

  @override
  State<_PendingFeeTableWidget> createState() => _PendingFeeTableWidgetState();
}

class _PendingFeeTableWidgetState extends State<_PendingFeeTableWidget> {
  final _selectedEmployees = <String>[];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.catalineBlue),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              DataTable(
                horizontalMargin: 10,
                headingRowHeight: 35,
                headingRowColor:
                    WidgetStateProperty.all(AppColors.catalineBlue),
                columns: [
                  DataColumn(
                    label: Checkbox(
                      side: const BorderSide(color: Colors.transparent),
                      checkColor: AppColors.catalineBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fillColor: WidgetStateProperty.all(AppColors.white),
                      activeColor: AppColors.catalineBlue,
                      value: _selectedEmployees.length == widget.data.length && _selectedEmployees.isNotEmpty,
                      onChanged: (value) {
                        setState(() {
                          if (value.isTrue) {
                            final ids = widget.data.map((e) => e.checkInId);
                            _selectedEmployees
                              ..clear()
                              ..addAll(ids);
                          } else {
                            _selectedEmployees.clear();
                          }
                        });
                      },
                    ),
                  ),
                ],
                rows: [
                  for (final emp in widget.data) ...[
                    DataRow(
                      cells: [
                        DataCell(
                          Checkbox(
                            fillColor: _selectedEmployees.contains(emp.checkInId)
                                ? const WidgetStatePropertyAll(Colors.green)
                                : const WidgetStatePropertyAll(Colors.white),
                            checkColor: Colors.white,
                            side:
                                const BorderSide(color: AppColors.catalineBlue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            value: _selectedEmployees.contains(emp.checkInId),
                            onChanged: (value) {
                              setState(() {
                                if (value.isTrue) {
                                  _selectedEmployees.add(emp.checkInId);
                                } else {
                                  _selectedEmployees.remove(emp.checkInId);
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
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
                        label: Center(
                            child: Text('Emp Id', textAlign: TextAlign.center)),
                      ),
                      DataColumn(
                        label: Center(child: Text('Emp Name', textAlign: TextAlign.center)),
                      ),
                      DataColumn(
                        label: Center(child:Text('Log Type', textAlign: TextAlign.center)),
                      ),
                      DataColumn(
                        label: Center(child: Text('Shift', textAlign: TextAlign.center)),
                      ),
                      DataColumn(
                        label: Center(child: Text('Time', textAlign: TextAlign.center)),
                      ),
                      DataColumn(
                        label: Center(child: Text('Location', textAlign: TextAlign.center)),
                      ),
                    ],
                    rows: [
                      for (final employee in widget.data) ...[
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
                            DataCell(Text(employee.logType)),
                            DataCell(Text(employee.shift)),
                            DataCell(Text(DFU.fromFrappeDT(employee.time))),
                            DataCell(InkWell(
                              onTap: () {
                                if (employee.location == null || employee.location == 'Not location Provided') return;
                                _openGoogleMaps(employee.location!);
                              },
                              child: Text(employee.location.valueOrEmpty)),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 8.0,
          bottom: 8.0,
          child: BlocBuilder<ApproveAuthReqCubit, ApproveAuthReqState>(
            builder: (_, state) {
              return OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.powderBlue,
                  foregroundColor: AppColors.black,
                  textStyle: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.powderBlue),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                onPressed: _selectedEmployees.isEmpty || state.isLoading
                    ? null
                    : () async {
                      final res = await AppDialog.askForConfirmation<bool?>(
                        context, 
                        title: 'Are you Sure ?',
                        content: 'Do you Approve Selected Records', 
                        onTapDismiss: () => context.pop(false), 
                        onTapConfirm: () => context.pop(true), 
                      );

                      if(res.isTrue && context.mounted) {
                        context
                          .cubit<ApproveAuthReqCubit>()
                          .request(_selectedEmployees);
                      }
                    },
                icon: const Icon(Icons.thumb_up_alt),
                label: const Text('Approve'),
              );
            },
          ),
        ),
      ],
    );
  }

  void _openGoogleMaps(String coordinates) async {
    final latLong = coordinates.split(',');

    final lat = latLong[0].trim();
    final lng = latLong[1].trim();

    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    final canLaunch = await canLaunchUrlString(url);
    if (canLaunch) {
        await launchUrlString(url);
      } else {
        throw 'Could not launch $url';
      }
  }
}
