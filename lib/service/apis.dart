import 'dart:convert';
import 'dart:io';

import 'package:education/models/attendance_model.dart';
import 'package:education/models/resource_model.dart';
import 'package:education/models/room_model.dart';
import 'package:education/models/subject_model.dart';
import 'package:education/models/task_model.dart';
import 'package:education/utils/dialogs.dart';
import 'package:education/utils/navigator_context.dart';
import 'package:http/http.dart' as http;

//SUBJECT MODULE

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

Future<void> addsubject(
    int userid, String subCode, int sem, String subname) async {
  if (userid == 0 || subCode == "" || sem == 0 || subname == "") {
    showmessage(NavigationService.navigatorKey.currentContext!, 'Error',
        "All fields are required");
  } else {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.137.1:3000/subject/addsub/$userid"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode({
          "subCode": subCode,
          "subName": subname,
          "subSem": sem,
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
      //show a dialog with message here...
    }
  }
}

Future<void> deletesub(int userid, String subCode) async {
  print("in service");
  try {
    final response = await http.delete(
      Uri.parse("http://192.168.137.1:3000/subject/deletesub/$userid/$subCode"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final msg = jsonDecode(response.body);
      showmessage(NavigationService.navigatorKey.currentContext!, msg['status'],
          msg['message']);

      //show dialog with msg...
    } else {
      final msg = jsonDecode(response.body);
      showmessage(NavigationService.navigatorKey.currentContext!, msg['status'],
          msg['message']);
      //show dialog with msg...
    }
  } catch (e) {
    //show a dialog with message here...
  }
}
//-------------SUBJECT END---------------------------------------------------

//ATTENDANCE MODULE

Future<void> fillAttendance(int userId, String subCode, int sem, int slot,
    String type, int remark, DateTime date) async {
  if (userId == 0 || subCode == "" || slot == 0 || type == "") {
    //show msg that all fields are required
    showmessage(NavigationService.navigatorKey.currentContext!, "Error",
        "All fields are required");
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
          "date": date.toString(),
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

//----------ATTENDANCE END------------------------------------------------------

//ROOM MODULE
Future<List<Rooms>> getallrooms(int userid) async {
  List<Rooms> userRooms = [];
  try {
    final response = await http.get(
      Uri.parse("http://192.168.137.1:3000/room/getrooms/$userid"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(body[0]);
      for (Map i in body) {
        userRooms.add(Rooms.fromJson(i));
      }
      print("here");
      print("User roms");
      return userRooms;
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}

Future<void> createnewRoom(int userId, String name, String description) async {
  try {
    final response = await http.post(
      Uri.parse("http://192.168.137.1:3000/room/createroom/$userId"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode({
        "roomName": name,
        "roomDescription": description,
      }),
    );
    if (response.statusCode == 200) {
      final msg = jsonDecode(response.body);
      showmessage(NavigationService.navigatorKey.currentContext!, msg['status'],
          msg['message']);

      //show dialog with msg...
    } else {
      final msg = jsonDecode(response.body);
      showmessage(NavigationService.navigatorKey.currentContext!, msg['status'],
          msg['message']);
      //show dialog with msg...
    }
  } catch (e) {
    //show dialog with msg
  }
}

Future<void> joinRoom(int userId, String joinString) async {
  try {
    final response = await http.post(
      Uri.parse("http://192.168.137.1:3000/room/joinroom/$userId"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode({
        "join_string": joinString,
      }),
    );
    if (response.statusCode == 200) {
      final msg = jsonDecode(response.body);
      showmessage(NavigationService.navigatorKey.currentContext!, msg['status'],
          msg['message']);

      //show dialog with msg...
    } else {
      final msg = jsonDecode(response.body);
      showmessage(NavigationService.navigatorKey.currentContext!, msg['status'],
          msg['message']);
      //show dialog with msg...
    }
  } catch (e) {
    //show dialog with msg
  }
}

Future<void> updateprofilePicture(
    int userId, String name, String filepath) async {
  try {
    final response = await http.post(
        Uri.parse("http://192.168.137.1:3000/user/updateImage/$userId"),
        headers: {
          HttpHeaders.contentTypeHeader: "multipart/form-data",
        },
        body: {
          "file": File(filepath),
          "image_url": "http://192.168.137.1:3000/Profile/$name"
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("here");
      print("User roms");
    } else {}
  } catch (e) {}
}

Future<List<Resource>> getallresources(int parentId) async {
  List<Resource> resources = [];
  try {
    final response = await http.get(
      Uri.parse("http://192.168.137.1:3000/room/getresources/$parentId"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(body);
      for (Map i in body) {
        resources.add(Resource(
            parentFolderId: i['parent_folder_id'],
            path: i['path'],
            resource: "",
            resourceId: i['resource_id'],
            resourceName: i['resource_name']));
      }

      return resources;
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}

//task
Future<List<Task>> getalltask(int userid) async {
  List<Task> tasks = [];
  try {
    final response = await http.get(
      Uri.parse("http://192.168.137.1:3000/task/getalltasks/$userid"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(body);
      for (Map i in body) {
        tasks.add(
            Task(task: i['task'], userId: i['user_id'], taskId: i['task_id']));
      }
      return tasks;
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}
