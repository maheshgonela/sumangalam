import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_text_styles.dart';
import 'package:sumangalam/features/hr/model/request_params.dart';
import 'package:sumangalam/features/hr/presentation/bloc/hr_bloc_provider.dart';
import 'package:sumangalam/features/hr/presentation/ui/on_auty_approval/approved_list_widget.dart';
import 'package:sumangalam/features/hr/presentation/ui/on_auty_approval/pending_for_app_list.dart';
import 'package:sumangalam/features/hr/presentation/ui/on_auty_approval/rejected_list_widget.dart';

class OnDutyApprovalScrn extends StatefulWidget {
  const OnDutyApprovalScrn({super.key});

  @override
  State<OnDutyApprovalScrn> createState() => _OnDutyApprovalScrnState();
}

class _OnDutyApprovalScrnState extends State<OnDutyApprovalScrn> {
  DateTime startTime = DFU.now();
  DateTime endTime = DFU.now();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              if (index == 0) {
                context.cubit<ApprovalList>().request(RequestParams(
                    status: 'Draft', start: startTime, end: endTime));
              } else if (index == 1) {
                context.cubit<ApprovedList>().request(RequestParams(
                    status: 'Approved', start: startTime, end: endTime));
              } else {
                context.cubit<RejectedList>().request(RequestParams(
                    status: 'Rejected', start: startTime, end: endTime));
              }
            },
            labelStyle: AppTextStyles.titleMedium(context)
                .copyWith(color: AppColors.black),
            dividerColor: AppColors.himlayaPeeks,
            indicatorColor: AppColors.catalineBlue,
            tabs: const [
              Tab(child: Text('Draft')),
              Tab(child: Text('Approved')),
              Tab(child: Text('Rejected')),
            ],
          ),
          centerTitle: true,
          titleTextStyle: AppTextStyles.titleLarge(context)
              .copyWith(color: AppColors.black),
          title: const Text('On Duty Approval'),
          actions: [
            IconButton(
              onPressed: () {
                showDateRangePicker(
                  context: context,
                  initialDateRange:
                      DateTimeRange(start: startTime, end: endTime),
                  builder: (context, child) => Theme(
                    data: ThemeData.light().copyWith(
                      dialogBackgroundColor: AppColors.white,
                      textTheme: TextTheme(
                        bodyMedium: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    child: child!,
                  ),
                  firstDate: DFU.now().subtract(const Duration(days: 60)),
                  lastDate: DFU.now(),
                ).then((value) {
                  if (value == null) return;
                  setState(() {
                    startTime = value.start;
                    endTime = value.end;
                    final dInp = RequestParams(
                        status: 'Draft', start: startTime, end: endTime);
                    final aInp = RequestParams(
                        status: 'Approved', start: startTime, end: endTime);
                    final rInp = RequestParams(
                        status: 'Rejected', start: startTime, end: endTime);

                    context
                      ..cubit<ApprovalList>().request(dInp)
                      ..cubit<ApprovedList>().request(aInp)
                      ..cubit<RejectedList>().request(rInp);
                  });
                });
              },
              icon: const Icon(Icons.calendar_month),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: PendingForAppList(
                  params: RequestParams(
                      status: 'Draft', start: startTime, end: endTime)),
            ),
            SingleChildScrollView(
              child: ApprovedListWidget(
                  params: RequestParams(
                      status: 'Approved', start: startTime, end: endTime)),
            ),
            SingleChildScrollView(
                child: RejectedListWidget(
              params: RequestParams(
                  status: 'Rejected', start: startTime, end: endTime),
            ))
          ],
        ),
      ),
    );
  }
}
