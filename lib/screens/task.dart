import 'package:education/provider/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<AttendanceProvider>(context, listen: false);
    provider.getusertask();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);
    return provider.lodingtasks
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: provider.tasks.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                child: Text(index.toString()),
              ),
              title: Text(provider.tasks[index].task!),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ),
          );
  }
}
