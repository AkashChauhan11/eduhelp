import 'package:education/provider/attendance_provider.dart';
import 'package:education/screens/Subject/manage_subject.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'custom_widget/current_sem_drop_down.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? pickedfile;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: double.infinity,
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person_outlined,
                    size: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  final XFile? image = await picker.pickImage(
                      source: ImageSource.gallery, imageQuality: 70);
                  provider.updateuserProfilePicture(image!.name, image.path);
                },
                child: const Text("Change Image")),
            Text(
              "User Name",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            const Divider(),
            SizedBox(
              height: 300,
              child: ListView(
                children: [
                  ListTile(
                    tileColor: Colors.grey[200],
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.arrow_right,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                    title: Text(
                      "Edit Profile",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    tileColor: Colors.grey[200],
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.arrow_right,
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ManageSubjects(),
                            ));
                      },
                    ),
                    title: Text(
                      "Manage Subjects",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    trailing: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          SizedBox(width: 100, child: SemSelectionDropDown()),
                    ),
                    tileColor: Colors.grey[200],
                    title: Text(
                      "Current sem",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
