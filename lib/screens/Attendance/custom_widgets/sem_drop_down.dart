import 'package:education/provider/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SemSelectDropDown extends StatefulWidget {
  const SemSelectDropDown({super.key});

  @override
  State<SemSelectDropDown> createState() => _SemSelectDropDownState();
}

class _SemSelectDropDownState extends State<SemSelectDropDown> {
  String selectedSem = "Select Sem";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final attendanceProvider =
        Provider.of<AttendanceProvider>(context, listen: false);
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: size.width * 0.3),
      child: SizedBox(
        width: size.width * 0.4,
        child: DropdownButtonFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            alignment: Alignment.center,
            hint: Center(
              child: Text(
                selectedSem,
                
              ),
            ),
            items: const [
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 1,
                child: Text(
                  "1",
                  // style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 2,
                child: Text(
                  "2",
                  // style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 3,
                child: Text(
                  "3",
                  // style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 4,
                child: Text(
                  "4",
                  // style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 5,
                child: Text(
                  "5",
                  // style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 6,
                child: Text(
                  "6",
                  // style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 7,
                child: Text(
                  "7",
                  // style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              DropdownMenuItem(
                alignment: Alignment.center,
                value: 8,
                child: Text(
                  "8",
                  // style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
            onChanged: (value) {
              attendanceProvider.semWiseSelectedSem = value!;
              setState(() {
                selectedSem = value.toString();
              });
            }),
      ),
    );
  }
}
