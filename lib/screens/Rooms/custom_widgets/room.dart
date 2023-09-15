import 'package:education/models/room_model.dart';
import 'package:education/provider/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomContainer extends StatefulWidget {
  const RoomContainer({super.key});

  @override
  State<RoomContainer> createState() => _RoomContainerState();
}

class _RoomContainerState extends State<RoomContainer> {
  // late AttendanceProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<AttendanceProvider>(context, listen: false);
    provider.getuserrooms();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context, listen: true);
    List<UserRoom> rooms = provider.userRooms;
    print(rooms.length.toString());
    final size = MediaQuery.of(context).size;
    return provider.loadingrooms
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: provider.userRooms.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: size.height * 0.38),
            itemBuilder: (context, index) => SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      height: size.height * 0.30,
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(-2, 5))
                          ],
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            provider.userRooms[index].folder!.folderName!,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            provider.userRooms[index].folder!.description!,
                            style: TextStyle(fontSize: 13),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(),
                            child: const Text('Explore'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: size.width * 0.15,
                    top: 10,
                    child: const CircleAvatar(
                      radius: 40,
                      child: Center(child: Text("Image here")),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
