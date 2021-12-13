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
  late List<ExitandEntersModel> ExitandEnters;


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
    print('Parsed => username');

    if(json['ExitandEnters'] != null /*&& (json['ExitandEnters'] as List).isNotEmpty*/) {
      int count = 0;
      ExitandEnters = List.from(json['ExitandEnters'])
          .map((e) {
             // count ++;
             // print('Parsed => ExitandEnters');
             //  print('Count => $count');
            return ExitandEntersModel.fromJson(e);
      }

      ).toList();

    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['_id'] = idDB;
    _data['gender'] = gender;
    _data['roomnumber'] = roomnumber;
    _data['buildingType'] = buildingType;
    _data['buildingName'] = buildingName;
    _data['username'] = username;
    _data['ExitandEnters'] = ExitandEnters.map((e) => e.toJson()).toList();

    return _data;
  }
}


class ExitandEntersModel{

  ExitandEntersModel({
    required this.enterAt,
    required this.exitAt,
    required this.enterDate,
    required this.exitDate,
    required this.Notes,


  });

  late final String enterAt;
  late final String exitAt;
  late final String enterDate;
  late final String exitDate;
  late final String Notes;



  ExitandEntersModel.fromJson(Map<String, dynamic> json) {
    enterAt = json['enterAt']??'empty';
    exitAt = json['exitAt']??'empty';
    enterDate = json['enterDate']??'empty';
    exitDate = json['exitDate']??'empty';
    Notes = json['Notes']??'empty';


  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['enterAt'] = enterAt;
    _data['exitAt'] = exitAt;
    _data['enterDate'] = enterDate;
    _data['exitDate'] = exitDate;
    _data['Notes'] = Notes;


    return _data;
  }
}