import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/attendance_provider.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({super.key});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    final attendanceProvider =
        Provider.of<AttendanceProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Remark :",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        const SizedBox(
          width: 15,
        ),
        Radio(
          onChanged: (value) {
            setState(() {
              selected = value!;
            });
            // updateRemark(selected);
          },
          groupValue: selected,
          value: 1,
        ),
        const Text("P",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        Radio(
          onChanged: (value) {
            setState(() {
              attendanceProvider.remark = value!;
              selected = value;
            });
            // updateRemark(selected);
          },
          groupValue: selected,
          value: 0,
        ),
        const Text("A",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        Radio(
          onChanged: (value) {
            setState(() {
              selected = value!;
            });
            // updateRemark(selected);
          },
          groupValue: selected,
          value: -1,
        ),
        const Text(
          "S",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
