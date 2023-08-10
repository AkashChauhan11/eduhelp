import 'package:education/models/subject_model.dart';
import 'package:education/service/apis.dart';
import 'package:flutter/material.dart';

class AttendanceProvider extends ChangeNotifier {
  //user academic details
  List<Subject> _subjects = [];
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

  //getters
  List<Subject> get subjects => _subjects;

//-------------------Methods for API calls--------------------------------
  // getting all subjects of a particular user
  Future getsubject() async {
    fetchingData = true;
    List<Subject>? subjects = await getallsubjects(userId);
    _subjects = subjects;
    fetchingData = false;
    notifyListeners();
  }

  //fill attendance of the user...
  fillUserAttendance() async {
    fetchingData = true;
    await fillAttendance(
      userId,
      subCode,
      fillSem,
      slot,
      type,
      remark,
      DateTime.now(),
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
}
