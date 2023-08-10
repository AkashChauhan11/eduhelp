import 'package:flutter/material.dart';

import '../../../provider/attendance_provider.dart';

class TypeDropDown extends StatefulWidget {
  final AttendanceProvider provider;

  const TypeDropDown({super.key, required this.provider});

  @override
  State<TypeDropDown> createState() => _TypeDropDownState();
}

class _TypeDropDownState extends State<TypeDropDown> {
  String slotSelected = "Type";
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        alignment: Alignment.center,
        hint: FittedBox(fit: BoxFit.contain, child: Text(slotSelected)),
        items: const [
          DropdownMenuItem(
            alignment: Alignment.center,
            value: "Lecture",
            child: Text(
              "Lecture",
              style: TextStyle(color: Colors.black),
            ),
          ),
          DropdownMenuItem(
            alignment: Alignment.center,
            value: "Lab",
            child: Text(
              "Lab",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            widget.provider.type = value!;
            slotSelected = value.toString();
          });
        });
  }
}
