import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/cubit/network_request/network_request_cubit.dart';
import 'package:sumangalam/core/model/pair_triple.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/hr/model/employee.dart';
import 'package:sumangalam/features/hr/model/request_params.dart';
import 'package:sumangalam/features/hr/presentation/bloc/hr_bloc_provider.dart';
import 'package:sumangalam/features/hr/presentation/ui/attendance_approval/reject_reason_dialog.dart';
import 'package:sumangalam/features/hr/presentation/ui/on_auty_approval/pending_for_app_list.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DraftAttendanceList extends StatelessWidget {
  const DraftAttendanceList({
    super.key,
    required this.params,
  });

  final RequestParams params;
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
              content: data.contains('Approved')
                  ? 'Attendance Requests Approved Successfully..!'
                  : 'Attendance Requests Rejected Successfully',
              onTapDismiss: context.exit,
            ).then((_) {
              if (!context.mounted) return;
              final inp = params;
              context
                  // ..cubit<AppAttendanceList>().request(inp)
                  .cubit<DraftAttendaceList>()
                  .request(inp);
              // ..cubit<AttendanceApprovedList>().request(inp)
              // ..cubit<AttendanceRejectedList>().request(inp);
            });
          },
        );
      },
      child:
          BlocBuilder<DraftAttendaceList, NetworkRequestState<List<Employee>>>(
        builder: (_, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: AppLoadingIndicator()),
            failure: (failure) => AppFailureWidget(
              errorMsg: failure.error,
              retry: () => context.cubit<DraftAttendaceList>().request(params),
            ),
            success: (data) {
              if (data.isEmpty) {
                return AppFailureWidget(
                  errorMsg: 'No Draft Employee Checkins Found To Approve',
                  retry: () {
                    final inp = params;
                    context.cubit<DraftAttendaceList>().request(inp);
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
  String? isApproved;

  @override
  Widget build(BuildContext context) {
    final date = widget.data;
     print('date to trim $date');
    print('date ${DFU.toDate(date.first.time)}');
    
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.catalineBlue),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              DataTable(
                horizontalMargin: 10,
                headingRowHeight: 35,
                dataRowHeight: 40,
                  border: TableBorder.all(
                    color: AppColors.white, width: 0, style: BorderStyle.solid),
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
                      value: _selectedEmployees.length == widget.data.length &&
                          _selectedEmployees.isNotEmpty,
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
                            fillColor: _selectedEmployees
                                    .contains(emp.checkInId)
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
                    horizontalMargin: 1,
                    headingRowHeight: 35,
                    columnSpacing: 8.0,
                    border: TableBorder.all(color: AppColors.white,width: 0,style: BorderStyle.solid),
                    dataRowHeight:40 ,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0, color: AppColors.catalineBlue),
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
                        label: Center(
                            child:
                                Text('Emp Name', textAlign: TextAlign.center)),
                      ),
                      DataColumn(
                        label: Center(
                            child:
                                Text('Log Type', textAlign: TextAlign.center)),
                      ),
                      DataColumn(
                        label: Center(
                            child: Text('Shift', textAlign: TextAlign.center)),
                      ),
                      DataColumn(
                        label: Center(
                            child: Text('Date', textAlign: TextAlign.center)),
                      ),
                      DataColumn(
                        label: Center(
                            child:
                                Text('Time', textAlign: TextAlign.center)),
                      ),
                    ],
                    rows: [
                      for (final employee in widget.data) ...[
                        DataRow(
                          onLongPress: employee.selfie.doesNotHaveValue
                              ? null
                              : () => showDialog(
                                  context: context,
                                  builder: (_) =>
                                      ViewSelfieWidget(url: employee.selfie!)),
                          cells: [
                            DataCell(Text(employee.empId)),
                            DataCell(Text(employee.employeeName)),
                            DataCell(Text(employee.logType)),
                            DataCell(Text(employee.shift)),
                            DataCell(Text(DFU.toDate(employee.time))),
                                                        DataCell(Text(DFU.toTime(employee.time))),

                            // DataCell(
                            //   InkWell(
                            //       onTap: () {
                            //         if (employee.location == null ||
                            //             employee.location ==
                            //                 'Not location Provided') return;
                            //         _openGoogleMaps(employee.location!);
                            //       },
                            //       child: Text(employee.location.valueOrEmpty)),
                            // ),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: BlocBuilder<ApproveAuthReqCubit, ApproveAuthReqState>(
              builder: (_, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      elevation: 4.0,
                      backgroundColor: AppColors.catalineBlue,
                      onPressed: _selectedEmployees.isEmpty || state.isLoading
                          ? null
                          : () async {
                              isApproved = 'Approved';
                              final res =
                                  await AppDialog.askForConfirmation<bool?>(
                                context,
                                title: 'Are you Sure ?',
                                content: 'Do you Approve Selected Records',
                                onTapDismiss: () => context.pop(false),
                                onTapConfirm: () => context.pop(true),
                              );

                              if (res.isTrue && context.mounted) {
                                context.cubit<ApproveAuthReqCubit>().request(
                                    dartz.Tuple3(
                                        _selectedEmployees, 'Approved', null));
                              }
                            },
                      child: state.isLoading && isApproved == 'Approved'
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: AppColors.mintLeaf,
                                strokeWidth: 2.5,
                              ),
                            )
                          : const Icon(
                              Icons.thumb_up,
                              color: AppColors.white,
                            ),
                    ),
                    const SizedBox(width: 16),
                    FloatingActionButton(
                      backgroundColor: AppColors.catalineBlue,
                      onPressed: _selectedEmployees.isEmpty || state.isLoading
                          ? null
                          : () async {
                              isApproved = 'Rejected';
                              // final res = await AppDialog.askForConfirmation<bool?>(
                              //   context,
                              //   title: 'Are you Sure ?',
                              //   content: 'Do you Want to Reject Selected Records',
                              //   onTapDismiss: () => context.pop(false),
                              //   onTapConfirm: () => context.pop(true),
                              // );
                              final reason = await showReasonDialog(context);
                              if (!context.mounted || reason.doesNotHaveValue)return;

                              context.cubit<ApproveAuthReqCubit>().request(
                                  dartz.Tuple3(
                                      _selectedEmployees, 'Rejected', reason));
                            },
                      child: state.isLoading && isApproved == 'Rejected'
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: AppColors.mintLeaf,
                                strokeWidth: 2.5,
                              ),
                            )
                          : const Icon(
                              Icons.thumb_down,
                              color: AppColors.white,
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<String?> showReasonDialog(BuildContext context) {
    return showDialog(
        context: context, builder: (ctx) => const RejectReasonDialog());
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
