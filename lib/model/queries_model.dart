class QueriesModel {
String? code;
String? name;
String? id;
String? room;
String? buildingName;
String? queriesDate;
String? replyDate;
String? StudentQueries;
bool? isReplied;
String? managerReply;



QueriesModel({
      this.code,
      this.name,
      this.id,
      this.queriesDate,
      this.replyDate,
      this.StudentQueries,
      this.isReplied,
      this.room,
      this.buildingName,
      this.managerReply,
});

QueriesModel.fromJson(Map<String, dynamic> json)
  {
    code = json['code'];
    name = json['name'];
    id = json['id'];
    queriesDate = json['queriesDate'];
    replyDate = json['replyDate'];
    StudentQueries = json['StudentQueries'];
    isReplied = json['isReplied'];
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
      'queriesDate':queriesDate,
      'replyDate':replyDate,
      'StudentQueries':StudentQueries,
      'isReplied':isReplied,
      'room':room,
      'buildingName':buildingName,
      'managerReply':managerReply,
    };
  }
}