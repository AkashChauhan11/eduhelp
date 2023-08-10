import 'package:education/provider/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlotDropDown extends StatefulWidget {
  final AttendanceProvider attendanceProvider;
  const SlotDropDown({super.key, required this.attendanceProvider});

  @override
  State<SlotDropDown> createState() => _SlotDropDownState();
}

class _SlotDropDownState extends State<SlotDropDown> {
  String slotSelected = "Slot";
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);
    return attendanceProvider.clearfield
        ? Center(
            child: DropdownButton(
              items: [],
              onChanged: (value) {},
            ),
          )
        : DropdownButtonFormField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            alignment: Alignment.center,
            hint: FittedBox(
                fit: BoxFit.contain,
                child: Text(attendanceProvider.slot == 0
                    ? "Slot"
                    : slotSelected.toString())),
            items: [
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 1,
                child: Text(
                  "1",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 2,
                child: Text(
                  "2",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 3,
                child: Text(
                  "3",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 4,
                child: Text(
                  "4",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 5,
                child: Text(
                  "5",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 6,
                child: Text(
                  "6",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                widget.attendanceProvider.slot = value!;
                slotSelected = value.toString();
              });
            });
  }
}
