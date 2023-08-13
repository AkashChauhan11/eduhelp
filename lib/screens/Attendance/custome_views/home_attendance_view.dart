import 'package:education/helper/chart_calculation.dart';
import 'package:education/models/subject_model.dart';
import 'package:education/provider/attendance_provider.dart';
import 'package:education/screens/Attendance/custom_widgets/attendance_chart.dart';
import 'package:flutter/material.dart';

class HomeAttendanceView extends StatelessWidget {
  final AttendanceProvider attendanceProvider;
  const HomeAttendanceView({super.key, required this.attendanceProvider});

  @override
  Widget build(BuildContext context) {
    List<Subject> subjects =
        ChartCalculation.getSubList(attendanceProvider);

    return Wrap(
        direction: Axis.horizontal,
        children: subjects
            .map((sub) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomAttendanceChart(
                      subject: sub,
                      attendanceProvider: attendanceProvider),
                ))
            .toList());
  }
}
