import 'package:education/models/room_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RoomInfo extends StatelessWidget {
  final Folder room;
  const RoomInfo({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "ROOM INFORMATION",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Room Name",
                style: TextStyle(
                    fontSize: 20, decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(room.folderName!),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Room Description",
                style: TextStyle(
                    fontSize: 20, decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(room.description!),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Join String",
                style: TextStyle(
                    fontSize: 20, decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Use the following code to join a ROOM"),
              const SizedBox(
                height: 10,
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                    hintText: room.joinString,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              Divider(),
              Center(child: Text("OR SCAN THE QR TO JOIN ROOM",style: TextStyle(fontWeight: FontWeight.bold),)),
              Center(
                child: QrImageView(
                  data: room.joinString!,
                  size: 170,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
