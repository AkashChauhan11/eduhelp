import 'package:education/provider/attendance_provider.dart';
import 'package:education/screens/onboarding.dart';
import 'package:education/utils/navigator_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AttendanceProvider(),
      child: MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          title: 'Edu-help',
          theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(14, 58, 91, 1),
            ),
          ),
          home: const OnBoardingScreen()),
    );
  }
}
