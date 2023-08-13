import 'package:education/screens/Attendance/custome_views/sem_wise_attendance_view.dart';
import 'package:flutter/material.dart';

class FullAttendanceScreen extends StatefulWidget {
  const FullAttendanceScreen({super.key});

  @override
  State<FullAttendanceScreen> createState() => _FullAttendanceScreenState();
}

class _FullAttendanceScreenState extends State<FullAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Full Attendance Details"),
          bottom: const TabBar(tabs: [
            Text("Sem Wise"),
            Text("Month Wise"),
            Text("Subject Wise"),
          ]),
        ),
        body: const TabBarView(children: [
          SemWiseAttendance(),
          Center(
            child: Text('Month wise'),
          ),
          Center(
            child: Text('Subject wise'),
          ),
        ]),
      ),
    );
  }
}
