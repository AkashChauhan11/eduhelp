import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeAttendanceView extends StatelessWidget {
  const HomeAttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(radius: 30);
  }
}