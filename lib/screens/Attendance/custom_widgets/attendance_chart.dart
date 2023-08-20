import 'package:education/helper/chart_calculation.dart';
import 'package:education/models/subject_model.dart';
import 'package:education/provider/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomAttendanceChart extends StatelessWidget {
  final Subject subject;
  final AttendanceProvider attendanceProvider;
  final bool monthwiseScreenCalculation;
  const CustomAttendanceChart(
      {super.key,
      required this.subject,
      required this.attendanceProvider,
      this.monthwiseScreenCalculation = false});

  @override
  Widget build(BuildContext context) {
    double percentage = monthwiseScreenCalculation
        ? ChartCalculation.getPercentageForMonthWise(
            attendanceProvider, subject.subCode!)
        : ChartCalculation.getAttendancePercentage(
            subject.subCode!,
            subject.subSem!,
            attendanceProvider); //get percentage function to be called here
    return CircularPercentIndicator(
      progressColor: Theme.of(context).colorScheme.primary,
      curve: Curves.easeInOutSine,
      lineWidth: 10.0,
      circularStrokeCap: CircularStrokeCap.round,
      percent: percentage,
      footer: Text(
        subject.subName.toString(),
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
