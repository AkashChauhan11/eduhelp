class Rooms {
  int? sNo;
  int? userId;
  int? folderId;
  String? userType;
  Folder? folder;

  Rooms({this.sNo, this.userId, this.folderId, this.userType, this.folder});

  Rooms.fromJson(Map<dynamic, dynamic> json) {
    sNo = json['s_no'];
    userId = json['user_id'];
    folderId = json['folder_id'];
    userType = json['user_type'];
    folder = json['folder'] != null ? Folder.fromJson(json['folder']) : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['s_no'] = sNo;
    data['user_id'] = userId;
    data['folder_id'] = folderId;
    data['user_type'] = userType;
    if (folder != null) {
      data['folder'] = folder!.toJson();
    }
    return data;
  }
}

class Folder {
  int? folderId;
  String? folderName;
  String? description;
  String? type;
  String? date;
  String? joinString;
  String? imageUrl;
  int? adminId;
  int? parentFolderId;

  Folder(
      {this.folderId,
      this.folderName,
      this.description,
      this.type,
      this.date,
      this.joinString,
      this.imageUrl,
      this.adminId,
      this.parentFolderId});

  Folder.fromJson(Map<dynamic, dynamic> json) {
    folderId = json['folder_id'];
    folderName = json['folder_name'];
    description = json['description'];
    type = json['type'];
    date = json['date'];
    joinString = json['join_string'];
    imageUrl = json['image_url'];
    adminId = json['admin_id'];
    parentFolderId = json['parent_folder_id'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['folder_id'] = folderId;
    data['folder_name'] = folderName;
    data['description'] = description;
    data['type'] = type;
    data['date'] = date;
    data['join_string'] = joinString;
    data['image_url'] = imageUrl;
    data['admin_id'] = adminId;
    data['parent_folder_id'] = parentFolderId;
    return data;
  }
}
