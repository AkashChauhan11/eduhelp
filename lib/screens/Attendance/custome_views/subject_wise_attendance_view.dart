import 'package:education/provider/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/attendance_chart.dart';

class SubjectWiseAttendance extends StatelessWidget {
  const SubjectWiseAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);
    final subjects = attendanceProvider.subjects;
    return Column(
      children: [
        const Text("All subject Attendance"),
        Wrap(
          direction: Axis.horizontal,
          children: subjects
              .map(
                (sub) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomAttendanceChart(
                    subject: sub,
                    attendanceProvider: attendanceProvider,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
