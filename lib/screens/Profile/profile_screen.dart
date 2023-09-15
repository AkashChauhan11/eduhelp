import 'package:education/screens/Subject/manage_subject.dart';
import 'package:flutter/material.dart';

import 'custom_widget/current_sem_drop_down.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
