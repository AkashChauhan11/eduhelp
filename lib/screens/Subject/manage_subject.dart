import 'package:education/models/subject_model.dart';
import 'package:education/provider/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageSubjects extends StatefulWidget {
  const ManageSubjects({super.key});

  @override
  State<ManageSubjects> createState() => _ManageSubjectsState();
}

class _ManageSubjectsState extends State<ManageSubjects> {
  final subCodeController = TextEditingController();
  final subSemController = TextEditingController();
  final subnameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final attendanceprovider =
        Provider.of<AttendanceProvider>(context, listen: false);
    attendanceprovider.getsubject();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subCodeController.dispose();
    subSemController.dispose();
    subnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final attendanceprovider = Provider.of<AttendanceProvider>(context);
    List<Subject> subjectList = attendanceprovider.subjects;
    subjectList.sort(
      (a, b) => a.subSem!.compareTo(b.subSem!),
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //show bottom modal sheet for adding the subject
          addSubject(attendanceprovider);
        },
      ),
      appBar: AppBar(
        title: const Text("Manage Subjects"),
      ),
      body: ListView.builder(
        itemCount: subjectList.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            child: Text(subjectList[index].subSem.toString()),
          ),
          title: Text(subjectList[index].subName.toString()),
          subtitle: Text(subjectList[index].subCode.toString()),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    //show bottom modal sheet for editing
                    updateSubject(subjectList[index]);
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    deleteSubject(attendanceprovider,
                        subjectList[index].subCode.toString());
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addSubject(AttendanceProvider provider) {
    subCodeController.clear();
    subSemController.clear();
    subnameController.clear();
    //bottom modal sheet for adding subject...
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: subCodeController,
              decoration: const InputDecoration(labelText: "Subject Code"),
            ),
            TextField(
              controller: subnameController,
              decoration: const InputDecoration(labelText: "Subject Name"),
            ),
            TextField(
              controller: subSemController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Sem"),
            )
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text("Add"),
            onPressed: () {
              provider.addusersubjects(
                  int.parse(subSemController.text.toString()),
                  subnameController.text.toString(),
                  subCodeController.text.toString());
              Navigator.of(context);
            },
          ),
        ],
      ),
    );
  }

  void updateSubject(Subject sub) {
    subCodeController.text = sub.subCode.toString();
    subSemController.text = sub.subSem.toString();
    subnameController.text = sub.subName.toString();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update Subject"),
        titleTextStyle: const TextStyle().copyWith(fontSize: 20, color: Colors.black),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: subCodeController,
              decoration: InputDecoration(
                  labelText: "Subject Code",
                  hintText: subCodeController.text,
                  enabled: false),
            ),
            TextField(
              controller: subnameController,
              decoration: const InputDecoration(labelText: "Subject Name"),
            ),
            TextField(
              controller: subSemController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Sem"),
            )
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text("Add"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void deleteSubject(AttendanceProvider provider, String subCode) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Subject"),
        content: const Text("Are you sure want to delete subject?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancle"),
          ),
          TextButton(
            onPressed: () {
              provider.deleteusersubjects(subCode);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
