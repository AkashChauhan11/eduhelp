class Resource {
  int? resourceId;
  String? resourceName;
  String? path;
  int? parentFolderId;
  String? resource;

  Resource(
      {this.resourceId,
      this.resourceName,
      this.path,
      this.parentFolderId,
      this.resource});

  Resource.fromJson(Map<dynamic, dynamic> json) {
    resourceId = json['resource_id'];
    resourceName = json['resource_name'];
    path = json['path'];
    parentFolderId = json['parent_folder_id'];
    resource = json['resource'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['resource_id'] = resourceId;
    data['resource_name'] = resourceName;
    data['path'] = path;
    data['parent_folder_id'] = parentFolderId;
    data['resource'] = resource;
    return data;
  }
}
