import 'package:education/models/attendance_model.dart';
import 'package:education/models/resource_model.dart';
import 'package:education/models/room_model.dart';
import 'package:education/models/subject_model.dart';
import 'package:education/models/task_model.dart';
import 'package:education/service/apis.dart';
import 'package:flutter/material.dart';

class AttendanceProvider extends ChangeNotifier {
  //user academic details
  List<Subject> _subjects = [];
  List<AttendanceModel> _attendanceList = [];
  List<Rooms> _userRooms = [];
  List<Resource> _resources = [];
  List<Task> tasks = [];

  int currentSem = 4;

  //user login details
  int userId = 1;

  //progress indicators
  bool fetchingData = false;
  bool clearfield = false;
  bool loadingrooms = false;
  bool loadingresources = false;
  bool lodingtasks = false;

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
  int filteredyear = 0;

  //getters
  List<Subject> get subjects => _subjects;
  List<AttendanceModel> get attendanceList => _attendanceList;
  List<Rooms> get userRooms => _userRooms;
  List<Resource> get resources => _resources;

//-------------------Methods for API calls--------------------------------
  // getting all subjects of a particular user

  getInitialAttendanceScreenData() async {
    fetchingData = true;
    await getsubject();
    await getUserAttendance();
    fetchingData = false;
    //print(attendanceList);
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

  getuserrooms() async {
    loadingrooms = true;
    _userRooms = await getallrooms(userId);
    loadingrooms = false;
    notifyListeners();
  }

  //subjects portion:----
  addusersubjects(int sem, String subName, String subCode) async {
    addsubject(userId, subCode, sem, subName);
  }

  deleteusersubjects(String subCode) {
    //print("in provider");
    deletesub(userId, subCode);
  }

  updateuserProfilePicture(String name, String path) {
    updateprofilePicture(userId, name, path);
  }

  createRoom(String name, String description) {
    createnewRoom(userId, name, description);
  }

  joinaRoom(String joinString) {
    joinRoom(userId, joinString);
  }

  //resources
  getfolderResources(int parentId) async {
    loadingresources = true;
    _resources = await getallresources(parentId);
    loadingresources = false;
    notifyListeners();
  }

  getusertask() async {
    lodingtasks = true;
    tasks = await getalltask(userId);
    lodingtasks = false;
    notifyListeners();
  }
}

//getting user attendance
