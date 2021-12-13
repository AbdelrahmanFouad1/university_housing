class GetDashSecurityModel {
  late int id;
  late int roomnumber;
  late String username;
  late String idDB;
  late String buildingName;
  late List<Details>exitAndEnters = [];

  GetDashSecurityModel.fromJson(Map<String, dynamic> json) {
    idDB = json['_id'] ?? 'empty';
    id = json['id'] ?? 'empty';
    roomnumber = json['roomnumber'] ?? 0;
    username = json['username'] ?? 'empty';
    buildingName = json['buildingName'] ?? 'empty';

    json['ExitandEnters'].forEach((element) {
      exitAndEnters.add(Details.fromJson(element));
    });


  }


}

class Details{
  late String enterAt;
  late String exitAt;
  late String enterDate;
  late String exitDate;
  late String notes;

  Details.fromJson(Map<String, dynamic> json) {
    enterAt = json['enterAt'] ?? 'empty';
    exitAt = json['exitAt']?? 'empty';
    enterDate = json['enterDate']?? 'empty';
    exitDate = json['exitDate']?? 'empty';
    notes = json['Notes']?? 'empty';

  }
}
