import 'package:education/provider/attendance_provider.dart';
import 'package:education/screens/Attendance/attendancehome.dart';
import 'package:education/screens/Rooms/home.dart';
import 'package:education/screens/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'Profile/profile_screen.dart';

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

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final joinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);
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
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => FullAttendanceDetailScreen(),
                // ));
              },
              child: const Text("next page"))),
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

      floatingActionButton: (_current == 2 || _current == 3)
          ? null
          : FloatingActionButton(
              onPressed: () {
                _current == 0 ? createRoom(provider) : null;
              },
              child: const Icon(Icons.add),
            ),
    );
  }

  void createRoom(AttendanceProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Create Room"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Room Name"),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: "Room Description"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              joinRoom(provider);
            },
            child: const Text("Join"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancle"),
          ),
          TextButton(
            onPressed: () {
              provider.createRoom(nameController.text.toString(),
                  descController.text.toString());
            },
            child: const Text("Create"),
          ),
        ],
      ),
    );
  }

  void joinRoom(AttendanceProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Join Room"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: joinController,
              decoration: const InputDecoration(labelText: "Join String"),
            ),
            SizedBox(
              height: 10,
            ),
            // Stack(children: [
            //   Divider(
            //     thickness: 2,
            //   ),
            //   Positioned(
            //     left: 90,
            //     child: Text("OR"),
            //   ),
            // ]),
            Divider(),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                String code = await FlutterBarcodeScanner.scanBarcode(
                    "#ff6666", "Cancel", true, ScanMode.QR);
                joinController.text = code;
              },
              icon: Icon(Icons.qr_code_2_sharp),
              label: Text("Scan QR"),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancle"),
          ),
          TextButton(
            onPressed: () {
              provider.joinaRoom(joinController.text.toString());
            },
            child: const Text("Join"),
          ),
        ],
      ),
    );
  }
}
