import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/constants/urls.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/cubit/network_request/network_request_cubit.dart';
import 'package:sumangalam/core/model/pair_triple.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/hr/model/employee.dart';
import 'package:sumangalam/features/hr/model/request_params.dart';
import 'package:sumangalam/features/hr/presentation/bloc/hr_bloc_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PendingForAppList extends StatelessWidget {
  const PendingForAppList({
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
              content: data.contains('Approved') ?'On Duty Requests Approved Successfully..!' : 'On Duty Requests Rejected Successfully',
              onTapDismiss: context.exit,
            ).then((_) {
              if (!context.mounted) return;
              final inp = params;
              context.cubit<ApprovalList>().request(inp);
            });
          },
        );
      },
      child: BlocBuilder<ApprovalList, NetworkRequestState<List<Employee>>>(
        builder: (_, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: AppLoadingIndicator()),
            failure: (failure) => AppFailureWidget(
              errorMsg: failure.error,
              retry: () => context.cubit<ApprovalList>().request(params),
            ),
            success: (data) {
              $logger.devLog('dev message $data');
                            $logger.devLog('length ${data.length}');

              if (data.isEmpty) {
                return AppFailureWidget(
                  errorMsg: 'No Draft Employee Checkins Found To Approve',
                  retry: () {
                    context.cubit<ApprovalList>().request(params);
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
                horizontalMargin: 1,
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
                    columnSpacing: 8.0,
                    border: TableBorder.all(
                        color: AppColors.white,
                        width: 0,
                        style: BorderStyle.solid),
                    headingRowHeight: 35,
                    dataRowHeight: 40,
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
                        label: Center(
                            child:
                                Text('Emp Name', textAlign: TextAlign.center)),
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
                            child: Text('Shift', textAlign: TextAlign.center)),
                      ),
                      DataColumn(
                        label: Center(
                            child:
                                Text('Location', textAlign: TextAlign.center)),
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
                            DataCell(Text(
                              employee.employeeName,
                              maxLines: 1,
                              softWrap: true,
                            )),
                            DataCell(Text(DFU.toDate(employee.time))),
                            DataCell(Text(DFU.toTime(employee.time))),
                            DataCell(Text(employee.status)),
                            DataCell(Text(employee.shift)),
                            DataCell(
                              InkWell(
                                  onTap: () {
                                    if (employee.location == null ||
                                        employee.location == 'Not Provided') {
                                      return;
                                    }
                                    _openGoogleMaps(
                                        employee.location.valueOrEmpty);
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
                      backgroundColor: AppColors.powderBlue,
                      foregroundColor: AppColors.black,
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
                                    Pair(_selectedEmployees, 'Approved'));
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
                              Icons.thumb_up_alt,
                              color: AppColors.mintLeaf,
                            ),
                    ),
                    const SizedBox(width: 16),
                    FloatingActionButton(
                      backgroundColor: AppColors.powderBlue,
                      foregroundColor: AppColors.black,
                      onPressed: _selectedEmployees.isEmpty || state.isLoading
                          ? null
                          : () async {
                           isApproved = 'Rejected';  
                              final res =
                                  await AppDialog.askForConfirmation<bool?>(
                                context,
                                title: 'Are you Sure ?',
                                content: 'Do you Reject Selected Records',
                                onTapDismiss: () => context.pop(false),
                                onTapConfirm: () => context.pop(true),
                              );

                              if (res.isTrue && context.mounted) {
                                context.cubit<ApproveAuthReqCubit>().request(
                                    Pair(_selectedEmployees, 'Rejected'));
                              }
                            },
                      child: state.isLoading && isApproved == 'Rejected'
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: AppColors.mintLeaf,
                                strokeWidth: 2.5,
                              ),
                            ): const Icon(
                        Icons.thumb_down_alt,
                        color: AppColors.error,
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

class ViewSelfieWidget extends StatelessWidget {
  const ViewSelfieWidget({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Selfie'),
          IconButton(
            onPressed: context.exit,
            icon: const Icon(Icons.close, color: AppColors.error),
          ),
        ],
      ),
      content: Image.network(
        Urls.filepath(url),
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation(AppColors.catalineBlue),
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
