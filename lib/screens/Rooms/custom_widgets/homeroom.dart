import 'dart:io';

import 'package:dio/dio.dart';
import 'package:education/models/resource_model.dart';
import 'package:education/models/room_model.dart';
import 'package:education/provider/attendance_provider.dart';
import 'package:education/screens/Rooms/custom_widgets/pdfviewscreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class RoomHome extends StatefulWidget {
  final Folder room;
  const RoomHome({super.key, required this.room});

  @override
  State<RoomHome> createState() => _RoomHomeState();
}

class _RoomHomeState extends State<RoomHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<AttendanceProvider>(context, listen: false);
    provider.getfolderResources(widget.room.folderId!);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context, listen: true);
    List<Resource> resources = provider.resources;
    print("room has");
    print(resources.length);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.room.folderName!),
          actions: [
            IconButton(
                onPressed: () {
                  uploadFile();
                  setState(() {});
                },
                icon: Icon(Icons.add_to_drive))
          ],
        ),
        body: provider.loadingresources
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: resources.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.download),
                      onPressed: () {
                        openFile(
                            url: resources[index].path!,
                            filename: resources[index].resourceName);
                      },
                    ),
                    leading: Image.asset(
                      'assets/images/pdf.png',
                    ),
                    title: Text(resources[index].resourceName!.split('.')[0]),
                  ),
                ),
              ));
  }

  Future openFile({required String url, String? filename}) async {
    final file = await downloadPdf(url, filename!);
    if (file == null) return;
    print(file.path);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfScreen(path: file.path),
      ),
    );
  }

  Future<File?> downloadPdf(String url, String name) async {
    print(url);
    final appStorage = await getApplicationDocumentsDirectory();
    File file = File('${appStorage}/$name');
    try {
      final response = await Dio().get(
        url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: Duration(seconds: 10)),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void uploadFile() async {
    var dio = Dio();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = file.path.split('/').last;
      String filepath = file.path;
      FormData data = FormData.fromMap({
        'file': await MultipartFile.fromFile(filepath, filename: fileName),
        'resource_name': fileName,
        'resource_path': filepath,
        'parent_id': widget.room.folderId
      });

      var response =
          dio.post("http://192.168.137.1:3000/user/updateImage/1", data: data);
    }
  }
}
