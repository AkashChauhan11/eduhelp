import 'package:education/helper/chart_calculation.dart';
import 'package:education/provider/attendance_provider.dart';
import 'package:education/screens/Attendance/custom_widgets/attendance_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MonthWiseAttendance extends StatefulWidget {
  const MonthWiseAttendance({super.key});

  @override
  State<MonthWiseAttendance> createState() => _MonthWiseAttendanceState();
}

class _MonthWiseAttendanceState extends State<MonthWiseAttendance> {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider =
        Provider.of<AttendanceProvider>(context, listen: false);
    final subjects = ChartCalculation.getSubListbyMonth(attendanceProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text("Select Month"),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  onTap: () {
                    showMonthPicker(
                      context,
                      onSelected: (month, year) {
                        setState(() {
                          attendanceProvider.filteredmonth = DateFormat.MMMM()
                              .format(DateFormat('M').parse(month.toString()));
                          attendanceProvider.filteredyear = year;
                        });
                      },
                      firstYear: int.parse(
                        (DateTime.now().year - 5).toString(),
                      ),
                      lastYear: DateTime.now().year,

                      // textColor: Colors.white,
                      // contentBackgroundColor: Colors.amber,

                      highlightColor: const Color.fromARGB(157, 35, 93, 174),
                      selectButtonText: "Ok",

                      contentBackgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "${attendanceProvider.filteredmonth}  "
                        "${attendanceProvider.filteredyear}",
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
          Wrap(
            direction: Axis.horizontal,
            children: subjects
                .map(
                  (sub) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomAttendanceChart(
                        subject: sub,
                        attendanceProvider: attendanceProvider,
                        monthwiseScreenCalculation: true),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
