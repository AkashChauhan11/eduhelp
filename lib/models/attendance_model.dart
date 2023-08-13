class AttendanceModel {
  String? subCode;
  int? sem;
  int? slot;
  String? date;
  int? remark;
  String? type;

  AttendanceModel(
      {this.subCode, this.sem, this.slot, this.date, this.remark, this.type});

  AttendanceModel.fromJson(Map<dynamic, dynamic> json) {
    subCode = json['sub_code'];
    sem = json['sem'];
    slot = json['slot'];
    date = json['date'];
    remark = json['remark'];
    type = json['type'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sub_code'] = subCode;
    data['sem'] = sem;
    data['slot'] = slot;
    data['date'] = date;
    data['remark'] = remark;
    data['type'] = type;
    return data;
  }
}
