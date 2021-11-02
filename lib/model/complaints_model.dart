class ComplaintsModel {
String? code;
String? name;
String? id;
String? room;
String? buildingName;
String? complaintDate;
String? replyDate;
String? complaintType;
String? StudentComplaint;
bool? isReplied;
bool? isAccepted;
String? managerReply;



ComplaintsModel({
      this.code,
      this.name,
      this.id,
      this.complaintDate,
      this.replyDate,
      this.complaintType,
      this.StudentComplaint,
      this.isReplied,
      this.isAccepted,
      this.room,
      this.buildingName,
      this.managerReply,
});

ComplaintsModel.fromJson(Map<String, dynamic> json)
  {
    code = json['code'];
    name = json['name'];
    id = json['id'];
    complaintDate = json['complaintDate'];
    replyDate = json['replyDate'];
    complaintType = json['complaintType'];
    StudentComplaint = json['StudentComplaint'];
    isReplied = json['isReplied'];
    isAccepted = json['isAccepted'];
    room = json['room'];
    buildingName = json['buildingName'];
    managerReply = json['managerReply'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'code':code,
      'name':name,
      'id':id,
      'complaintDate':complaintDate,
      'replyDate':replyDate,
      'complaintType':complaintType,
      'StudentComplaint':StudentComplaint,
      'isReplied':isReplied,
      'isAccepted':isAccepted,
      'room':room,
      'buildingName':buildingName,
      'managerReply':managerReply,
    };
  }
}