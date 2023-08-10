import 'package:education/provider/attendance_provider.dart';
import 'package:flutter/material.dart';

class SubjectDropDown extends StatefulWidget {
  final AttendanceProvider provider;
  const SubjectDropDown({super.key, required this.provider});

  @override
  State<SubjectDropDown> createState() => _SubjectDropDownState();
}

class _SubjectDropDownState extends State<SubjectDropDown> {
  String subselected = "Subject";
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        elevation: 1,
        hint: Text(
          subselected,
          style: const TextStyle(color: Colors.black),
        ),
        items: widget.provider.subjects
            .where((sub) => sub.subSem == widget.provider.currentSem)
            .map(
              (sub) => DropdownMenuItem(
                value: sub.subCode,
                child: Text(
                  sub.subName!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            subselected = value!;
            widget.provider.subCode = subselected;
          });
        });
  }
}
