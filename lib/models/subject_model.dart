class Subject {
  String? subName;
  String? subCode;
  int? subSem;

  Subject({this.subName, this.subCode, this.subSem});

  Subject.fromJson(Map<dynamic, dynamic> json) {
    subName = json['sub_name'];
    subCode = json['sub_code'];
    subSem = json['sub_sem'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['sub_name'] = subName;
    data['sub_code'] = subCode;
    data['sub_sem'] = subSem;
    return data;
  }
}