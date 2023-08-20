import 'package:flutter/material.dart';

class RoomContainer extends StatelessWidget {
  const RoomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
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
                          const Text(
                            "Sem 5",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "This room is create for sharing resources of sem 5",
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
            ));
  }
}
