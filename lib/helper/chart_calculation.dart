import 'package:education/models/attendance_model.dart';
import 'package:education/provider/attendance_provider.dart';

import '../models/subject_model.dart';

class ChartCalculation {
  //for attendance home calulations

  static List<Subject> getSubList(AttendanceProvider attendanceProvider) {
    List<Subject> subjects = [];
    subjects = attendanceProvider.subjects
        .where((sub) => ((!subjects.contains(sub)) &&
            sub.subSem == attendanceProvider.currentSem))
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
}
