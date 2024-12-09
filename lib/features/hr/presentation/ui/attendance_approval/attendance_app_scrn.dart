import 'package:flutter/material.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/model/pair_triple.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_text_styles.dart';
import 'package:sumangalam/features/hr/presentation/bloc/hr_bloc_provider.dart';
import 'package:sumangalam/features/hr/presentation/ui/attendance_approval/app_attendace_list_widget.dart';
import 'package:sumangalam/features/hr/presentation/ui/attendance_approval/draft_attendance_list.dart';

class AttendanceAppScrn extends StatefulWidget {
  const AttendanceAppScrn({super.key});

  @override
  State<AttendanceAppScrn> createState() => _AttendanceAppScrnState();
}

class _AttendanceAppScrnState extends State<AttendanceAppScrn> {
  DateTime startTime = DFU.now();
  DateTime endTime = DFU.now();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelStyle: AppTextStyles.titleMedium(context).copyWith(color: AppColors.black),
            dividerColor: AppColors.himlayaPeeks,
            indicatorColor: AppColors.catalineBlue,
            tabs: const [
              Tab(child: Text('To Be Approved')),
              Tab(child: Text('Approved')),
            ],
          ),
          centerTitle: true,
          titleTextStyle: AppTextStyles.titleLarge(context).copyWith(color: AppColors.black),
          title: const Text('Attendance Approval'),
          actions: [
            IconButton(
              onPressed: () {
                showDateRangePicker(
                  context: context, 
                  initialDateRange: DateTimeRange(start: startTime, end: endTime),
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
                  if(value == null) return;
                  setState(() {
                    startTime = value.start;
                    endTime = value.end;
                    final inp = Pair(startTime, endTime);
                    context
                      ..cubit<DraftAttendaceList>().request(inp)
                      ..cubit<AppAttendanceList>().request(inp);
                  }); 
                });
              }, 
              icon: const Icon(Icons.calendar_month),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(child: DraftAttendanceList(start: startTime, end: endTime)),
            SingleChildScrollView(child: AppAttendanceListWidget(start: startTime, end: endTime))
          ],
        ),
      ),
    );
  }
}
