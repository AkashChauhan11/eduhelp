import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({super.key});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  int selected=1;
  @override
  Widget build(BuildContext context) {
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
              selected = value!;
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
