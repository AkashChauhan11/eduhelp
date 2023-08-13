import 'package:education/models/attendance_model.dart';
import 'package:education/provider/attendance_provider.dart';
import 'package:intl/intl.dart';

import '../models/subject_model.dart';

class ChartCalculation {
  //for attendance home calulations
  static List<Subject> getSubList(AttendanceProvider attendanceProvider,
      {String screen = "AttendanceHome"}) {
    List<Subject> subjects = [];
    int semSelected;
    semSelected = screen == "AttendanceHome"
        ? attendanceProvider.currentSem
        : attendanceProvider.semWiseSelectedSem == 0
            ? attendanceProvider.currentSem
            : attendanceProvider.semWiseSelectedSem;
    subjects = attendanceProvider.subjects
        .where(
            (sub) => ((!subjects.contains(sub)) && sub.subSem == semSelected))
        .toList();
    print(subjects);
    return subjects;
  }

  static double getAttendancePercentage(
      String subCode, int subSem, AttendanceProvider attendanceProvider) {
    List<AttendanceModel> allAttendance = attendanceProvider.attendanceList
        .where((attendance) =>
            subCode == attendance.subCode && subSem == attendance.sem)
        .toList();
    List<AttendanceModel> present = allAttendance
        .where(
          (attendance) => attendance.remark == 1,
        )
        .toList();
    if (allAttendance.isEmpty) return 0;
    return (present.length) / (allAttendance.length);
  }

  //for sem wise calulations:
  static List<String> getMonthList(AttendanceProvider attendanceProvider) {
    List<AttendanceModel> attendances = attendanceProvider.attendanceList
        .where((attendance) => attendance.sem == attendanceProvider.currentSem)
        .toList();
    List<String> months = [];
    for (AttendanceModel attendance in attendances) {
      String month = getMonthname(DateTime.parse(attendance.date!));
      if (!months.contains(month)) {
        months.add(month);
      }
    }
    print(months);
    return months;
  }

  static String getMonthname(DateTime date) {
    // String month = DateFormat.MMMM().format(DateFormat('dd-MM-yyyy')
    //     .parse(attedndance.attendance![i].date!.toString()));
    String month = DateFormat.MMMM().format(date);
    return month;
  }

 static double getAttendancePercentOfMonth(
      AttendanceProvider attendanceProvider, String month) {
    int semSelected = attendanceProvider.semWiseSelectedSem == 0
        ? attendanceProvider.currentSem
        : attendanceProvider.semWiseSelectedSem;
    final allAttendance = attendanceProvider.attendanceList.where(
        (attendance) =>
            attendance.sem == semSelected &&
            getMonthname(DateTime.parse(attendance.date!)) == month);
    int present = allAttendance
        .where((attendance) => attendance.remark == 1)
        .toList()
        .length;

    if (allAttendance.isEmpty) return 0;
    return present / allAttendance.length;
  }
}
