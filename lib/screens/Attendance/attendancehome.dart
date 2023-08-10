import 'package:education/provider/attendance_provider.dart';
import 'package:education/screens/Attendance/custom_widgets/custom_radio_button.dart';
import 'package:education/screens/Attendance/custom_widgets/slot_drop_down.dart';
import 'package:education/screens/Attendance/custom_widgets/subject_drop_down.dart';
import 'package:education/screens/Attendance/custom_widgets/type_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AttendanceHome extends StatefulWidget {
  const AttendanceHome({super.key});

  @override
  State<AttendanceHome> createState() => _AttendanceHomeState();
}

class _AttendanceHomeState extends State<AttendanceHome> {
  @override
  void initState() {
    super.initState();
    Provider.of<AttendanceProvider>(context, listen: false).getsubject();
    // WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);
    Size size = MediaQuery.of(context).size;
    return attendanceProvider.fetchingData
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .fontSize),
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
                                child:
                                    TypeDropDown(provider: attendanceProvider),
                                // ),
                              ),
                              SizedBox(
                                width: size.width * 0.5,
                                child: TextField(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate:
                                            DateTime(DateTime.now().month - 6),
                                        lastDate: DateTime.now());

                                    // value.datepicked(DateFormat("dd-MM-yyyy")
                                    //     .format(picked_date!));
                                  },
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: DateFormat("dd-MM-yyyy")
                                        .format(DateTime.now()),
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
                                child: SlotDropDown(
                                    attendanceProvider: attendanceProvider),
                                // ),
                              ),
                              SizedBox(
                                width: size.width * 0.4,
                                child: SubjectDropDown(
                                    provider: attendanceProvider),
                                // ),
                              ),
                            ],
                          ),
                        ),
                        CustomRadioButton(),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          onPressed: () {
                            attendanceProvider.fillUserAttendance();
                            setState(() {});
                          },
                          child: const Text("Submit"),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Text(
                    "Your Attendance",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(),

                  //Attendance Chart to be shown here....
                ],
              ),
            ),
          );
  }
}
