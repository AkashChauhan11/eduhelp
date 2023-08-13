import 'package:education/helper/chart_calculation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../provider/attendance_provider.dart';

class CustomAttendanceMonthChart extends StatelessWidget {
  final AttendanceProvider attendanceProvider;
  final String month;
  const CustomAttendanceMonthChart(
      {super.key, required this.attendanceProvider, required this.month});

  @override
  Widget build(BuildContext context) {
    double percentage =
        ChartCalculation.getAttendancePercentOfMonth(attendanceProvider, month);
    return CircularPercentIndicator(
      progressColor: Theme.of(context).colorScheme.primary,
      curve: Curves.easeInOutSine,
      lineWidth: 10.0,
      circularStrokeCap: CircularStrokeCap.round,
      percent: percentage,
      footer: Text(
        month,
        style: const TextStyle(color: Colors.black),
      ),
      animationDuration: 2000,
      radius: 50,
      animation: true,
      center: Text(
        '${(percentage * 100).floor().toString()}%',
        style: const TextStyle(color: Colors.black, fontSize: 19),
      ),
    );
  }
}
