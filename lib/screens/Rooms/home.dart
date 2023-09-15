import 'package:education/models/room_model.dart';
import 'package:education/provider/attendance_provider.dart';
import 'package:education/screens/Rooms/custom_widgets/room.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    //final provider = Provider.of<AttendanceProvider>(context, listen: false);
    //provider.getuserrooms();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final provider = Provider.of<AttendanceProvider>(context, listen: false);
    //List<UserRoom> userRooms = provider.userRooms;
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Hi User!",
                        style: const TextStyle().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontSize,
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        textAlign: TextAlign.left,
                        "Good Morning",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .fontSize),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: double.infinity,
              height: size.height * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    width: 2,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .fontSize,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: size.width * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            softWrap: true,
                            textAlign: TextAlign.center,
                            "Let's organize your study material",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .fontSize,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.40,
                    child: Image.asset('assets/images/64.png'),
                  ),
                ],
              ),
            ),
            // Wrap(children: [
            //   RoomContainer(),
            //   RoomContainer(),
            //   RoomContainer(),
            //   RoomContainer(),
            //   RoomContainer(),
            // ])
            // SizedBox(height: 800,width: double.infinity,child: RoomContainer())
            const RoomContainer()
          ],
        ),
      ),
    );
  }
}
