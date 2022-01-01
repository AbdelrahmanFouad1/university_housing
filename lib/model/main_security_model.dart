class MainSecurityModel{

  MainSecurityModel({
    required this.id,
    required this.idDB,
    required this.roomnumber,
    required this.gender,
    required this.buildingType,
    required this.buildingName,
    required this.username,

  });

  late num id;
  late String idDB;
  late num roomnumber;
  late bool gender;
  late bool buildingType;
  late String buildingName;
  late String username;
  late String image;
  late List<ExitandEntersModel> ExitandEnters = [];


  MainSecurityModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    // print('Parsed => id');

    idDB = json['_id']??'empty';
    // print('Parsed => idDB');

    roomnumber = json['roomnumber']??0;
    // print('Parsed => roomnumber');

    if(json['gender'] != null){
      gender = json['gender'];
      // print('Parsed => gender');
    }

    if(json['buildingType'] != null){
      buildingType = json['buildingType'];
      // print('Parsed => buildingType');
    }

    buildingName = json['buildingName']??'empty';
    // print('Parsed => buildingName');

    username = json['username']??'empty';
    // print('Parsed => username');

    image = json['image']??'empty';


    // if(json['ExitandEnters'] != null) {
    //   ExitandEnters = List.from(json['ExitandEnters'])
    //       .map((e) {
    //          // count ++;
    //          // print('Parsed => ExitandEnters');
    //          //  print('Count => $count');
    //         return ExitandEntersModel.fromJson(e);
    //   }
    //
    //   ).toList();
    //
    // }

    json['ExitandEnters'].forEach((element) {
      ExitandEnters.add(ExitandEntersModel.fromJson(element));
    });

  }

}


class ExitandEntersModel{

  ExitandEntersModel({
    required this.enterAt,
    required this.exitAt,
    required this.enterDate,
    required this.exitDate,
    required this.Notes,
    required this.idDB,
  });

  late final String enterAt;
  late final String exitAt;
  late final String enterDate;
  late final String exitDate;
  late final String Notes;
  late final String idDB;



  ExitandEntersModel.fromJson(Map<String, dynamic> json) {
    enterAt = json['enterAt']??'empty';
    exitAt = json['exitAt']??'empty';
    enterDate = json['enterDate']??'empty';
    exitDate = json['exitDate']??'empty';
    Notes = json['Notes']??'empty';
    idDB = json['_id']??'empty';

  }

}