import 'package:education/models/room_model.dart';
import 'package:education/screens/Rooms/custom_widgets/homeroom.dart';
import 'package:education/screens/Rooms/custom_widgets/infoscreen.dart';
import 'package:flutter/material.dart';

class IndividualRoom extends StatefulWidget {
  const IndividualRoom({super.key, required this.room});
  final Folder room;

  @override
  State<IndividualRoom> createState() => _IndividualRoomState();
}

class _IndividualRoomState extends State<IndividualRoom> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _current == 0
          ? RoomHome(
              room: widget.room,
            )
          : RoomInfo(
              room: widget.room,
            ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _current,
          onTap: (value) {
            setState(() {
              _current = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Info",
              icon: Icon(Icons.info),
            ),
          ]),
    );
  }
}
