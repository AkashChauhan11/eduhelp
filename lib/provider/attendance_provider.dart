import 'package:education/models/attendance_model.dart';
import 'package:education/models/subject_model.dart';
import 'package:education/service/apis.dart';
import 'package:flutter/material.dart';

class AttendanceProvider extends ChangeNotifier {
  //user academic details
  List<Subject> _subjects = [];
  List<AttendanceModel> _attendanceList = [];
  int currentSem = 4;

  //user login details
  int userId = 1;

  //progress indicators
  bool fetchingData = false;
  bool clearfield = false;

  //variables for filling attendance
  int fillSem = 0;
  String subCode = "";
  int slot = 0;
  String type = "";
  DateTime date = DateTime.now();
  int remark = 1;

  //Full attendance screen variables
  int semWiseSelectedSem = 0;
  String filteredmonth = "";
  int filteredyear=0;

  //getters
  List<Subject> get subjects => _subjects;
  List<AttendanceModel> get attendanceList => _attendanceList;

//-------------------Methods for API calls--------------------------------
  // getting all subjects of a particular user

  getInitialAttendanceScreenData() async {
    fetchingData = true;
    await getsubject();
    await getUserAttendance();
    fetchingData = false;
    print(attendanceList);
    notifyListeners();
  }

  getsubject() async {
    List<Subject>? subjects = await getallsubjects(userId);
    _subjects = subjects;
  }

  //fill attendance of the user...
  fillUserAttendance() async {
    fetchingData = true;
    await fillAttendance(
      userId,
      subCode,
      fillSem = currentSem,
      slot,
      type,
      remark,
      date,
    ).then((_) {
      fillSem = 0;
      subCode = "";
      slot = 0;
      type = "";
      date = DateTime.now();
      remark = 1;
    });
    fetchingData = false;
    notifyListeners();
  }

  getUserAttendance() async {
    _attendanceList = await getuserattendace(userId);
  }
}

//getting user attendance
