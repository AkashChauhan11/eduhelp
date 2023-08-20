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

  static List<Subject> getSubListbyMonth(
    AttendanceProvider attendanceProvider,
  ) {
    print(attendanceProvider.filteredmonth);
    print(attendanceProvider.filteredyear);
    final month = attendanceProvider.filteredmonth;
    final year = attendanceProvider.filteredyear;
    List<AttendanceModel> attendances = [];
    List<Subject> subjects = [];

    attendances = attendanceProvider.attendanceList
        .where((attendance) =>
                getMonthname(DateTime.parse(attendance.date!)) == month &&
                getYear(DateTime.parse(attendance.date!)) == year
            // &&(!attendances.contains(attendance)),
            )
        .toList();
    for (AttendanceModel attendance in attendances) {
      for (Subject subject in attendanceProvider.subjects) {
        if (attendance.subCode == subject.subCode &&
            (!subjects.contains(subject))) {
          subjects.add(subject);
        }
      }
    }
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
    int semWiseSelectedSem = attendanceProvider.semWiseSelectedSem == 0
        ? attendanceProvider.currentSem
        : attendanceProvider.semWiseSelectedSem;
    List<AttendanceModel> attendances = attendanceProvider.attendanceList
        .where((attendance) =>
            attendance.sem == semWiseSelectedSem)
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

  static double getPercentageForMonthWise(
      AttendanceProvider attendanceProvider, String subCode) {
    List<AttendanceModel> attendances = [];
    attendances = attendanceProvider.attendanceList
        .where((attendance) =>
            attendance.subCode == subCode &&
            getMonthname(DateTime.parse(attendance.date!)) ==
                attendanceProvider.filteredmonth &&
            getYear(DateTime.parse(attendance.date!)) ==
                attendanceProvider.filteredyear)
        .toList();
    int present = attendances
        .where((attendance) =>
            attendance.subCode == subCode &&
            getMonthname(DateTime.parse(attendance.date!)) ==
                attendanceProvider.filteredmonth &&
            getYear(DateTime.parse(attendance.date!)) ==
                attendanceProvider.filteredyear &&
            attendance.remark == 1)
        .toList()
        .length;
    if (attendances.isEmpty) return 0;
    return present / attendances.length;
  }

  static String getMonthname(DateTime date) {
    // String month = DateFormat.MMMM().format(DateFormat('dd-MM-yyyy')
    //     .parse(attedndance.attendance![i].date!.toString()));
    String month = DateFormat.MMMM().format(date);
    return month;
  }

  static getYear(DateTime date) {
    int year = int.parse(DateFormat.y().format(date));
    print(year);
    return year;
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
