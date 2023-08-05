import 'package:education/screens/Attendance/attendancehome.dart';
import 'package:education/screens/home.dart';
import 'package:education/screens/profile.dart';
import 'package:education/screens/task.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _current = 0;
  final screens = const [
    HomeScreen(),
    TaskScreen(),
    AttendanceHome(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //App Bar
      appBar: AppBar(
        elevation: 3,
        title: Text(
          "Home",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
        ),
        centerTitle: true,
        shadowColor: Theme.of(context).colorScheme.shadow,
      ),
      //Drawer
      drawer: Drawer(
          width: size.shortestSide * 0.65,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => FullAttendanceDetailScreen(),
                // ));
              },
              child: Text("next page"))),
      body: screens[_current],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey[600],
        fixedColor: Theme.of(context).colorScheme.primary,
        currentIndex: _current,
        elevation: 5,
        onTap: (index) {
          setState(() {
            _current = index;
          });
        },
        useLegacyColorScheme: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            label: "My task",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment_outlined),
            label: "Attendance",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
