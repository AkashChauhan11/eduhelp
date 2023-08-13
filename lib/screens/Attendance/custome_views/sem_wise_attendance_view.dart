import 'package:education/helper/chart_calculation.dart';
import 'package:education/models/subject_model.dart';
import 'package:education/provider/attendance_provider.dart';
import 'package:education/screens/Attendance/custom_widgets/sem_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/attendance_chart.dart';
import '../custom_widgets/attendance_chart_month.dart';

class SemWiseAttendance extends StatefulWidget {
  const SemWiseAttendance({super.key});

  @override
  State<SemWiseAttendance> createState() => _SemWiseAttendanceState();
}

class _SemWiseAttendanceState extends State<SemWiseAttendance> {
  @override
  Widget build(BuildContext context) {
    final attedanceProvider = Provider.of<AttendanceProvider>(context);
    List<Subject> subjects = ChartCalculation.getSubList(attedanceProvider,
        screen: "FullAttendanceScreen");
    List<String> months = ChartCalculation.getMonthList(attedanceProvider);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text("Select Semester"),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SemSelectDropDown(),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("Show"))
            ],
          ),
          const Divider(),
          Wrap(
            direction: Axis.horizontal,
            children: subjects
                .map(
                  (sub) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomAttendanceChart(
                        subject: sub, attendanceProvider: attedanceProvider),
                  ),
                )
                .toList(),
          ),
          Divider(),
          Wrap(
            direction: Axis.horizontal,
            children: months
                .map(
                  (month) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomAttendanceMonthChart(
                        month: month, attendanceProvider: attedanceProvider),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
