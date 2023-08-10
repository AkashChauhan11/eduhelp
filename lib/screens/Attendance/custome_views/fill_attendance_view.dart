import 'package:education/provider/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../custom_widgets/custom_radio_button.dart';
import '../custom_widgets/slot_drop_down.dart';
import '../custom_widgets/subject_drop_down.dart';
import '../custom_widgets/type_drop_down.dart';

class FillAttendanceView extends StatefulWidget {
  final AttendanceProvider provider;
  const FillAttendanceView({super.key, required this.provider});

  @override
  State<FillAttendanceView> createState() => _FillAttendanceViewState();
}

class _FillAttendanceViewState extends State<FillAttendanceView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: size.height * 0.38,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.black)),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Fill your Attendance",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize:
                      Theme.of(context).textTheme.headlineSmall!.fontSize),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.3,
                  child: TypeDropDown(provider: widget.provider),
                  // ),
                ),
                SizedBox(
                  width: size.width * 0.5,
                  child: TextField(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().month - 6),
                          lastDate: DateTime.now());

                      // value.datepicked(DateFormat("dd-MM-yyyy")
                      //     .format(picked_date!));
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: DateFormat("dd-MM-yyyy").format(DateTime.now()),
                      contentPadding: const EdgeInsets.all(5),
                      prefixIcon: const Icon(Icons.date_range),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: size.width * 0.2,
                  child: SlotDropDown(attendanceProvider: widget.provider),
                  // ),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: SubjectDropDown(provider: widget.provider),
                  // ),
                ),
              ],
            ),
          ),
          const CustomRadioButton(),
          ElevatedButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: () {
              widget.provider.fillUserAttendance();
              setState(() {});
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
