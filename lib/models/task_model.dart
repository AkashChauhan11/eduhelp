class Task {
  int? taskId;
  int? userId;
  String? task;

  Task({this.taskId, this.userId, this.task});

  Task.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    userId = json['user_id'];
    task = json['task'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['user_id'] = this.userId;
    data['task'] = this.task;
    return data;
  }
}