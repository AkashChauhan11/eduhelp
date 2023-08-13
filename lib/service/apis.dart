import 'dart:convert';
import 'dart:io';

import 'package:education/models/attendance_model.dart';
import 'package:education/models/subject_model.dart';
import 'package:education/utils/dialogs.dart';
import 'package:education/utils/navigator_context.dart';
import 'package:http/http.dart' as http;

Future<List<Subject>> getallsubjects(int userid) async {
  //get user id from sharred prefernces in provider
  List<Subject> subjects = [];
  try {
    final response = await http.get(
      Uri.parse("http://192.168.137.1:3000/subject/getsubjects/$userid"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      for (Map i in data) {
        subjects.add(Subject.fromJson(i));
      }
      return subjects;
    } else {
      //show dialog box here...
      return [];
    }
  } catch (e) {
    //show a dialog box with e here...
    return [];
  }
}

Future<void> fillAttendance(int userId, String subCode, int sem, int slot,
    String type, int remark, DateTime date) async {
  if (userId == 0 || subCode == "" || slot == 0 || type == "") {
    //show msg that all fields are required
    showmessage(NavigationService.navigatorKey.currentContext!, "Error",
        "All fields are required");
    print("All fields are required");
  } else {
    try {
      final response = await http.post(
        Uri.parse(
            "http://192.168.137.1:3000/attendance/fillattendance/$userId"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode({
          "sub_code": subCode,
          "sem": sem,
          "slot": slot,
          "date": DateTime.now().toString(),
          "type": type,
          "remark": remark
        }),
      );
      if (response.statusCode == 200) {
        final msg = jsonDecode(response.body);
        showmessage(NavigationService.navigatorKey.currentContext!,
            msg['status'], msg['message']);

        //show dialog with msg...
      } else {
        final msg = jsonDecode(response.body);
        showmessage(NavigationService.navigatorKey.currentContext!,
            msg['status'], msg['message']);
        //show dialog with msg...
      }
    } catch (e) {
      //show dialog with msg
    }
  }
}

Future<List<AttendanceModel>> getuserattendace(int userid) async {
  List<AttendanceModel> attendanceList = [];
  try {
    final response = await http.get(
      Uri.parse("http://192.168.137.1:3000/attendance/getattendance/$userid"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      for (Map i in body) {
        attendanceList.add(AttendanceModel.fromJson(i));
      }
      return attendanceList;
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}
