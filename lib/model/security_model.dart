class SecurityModel {
  String? id;
  String? name;
  String? exitDate;
  String? exitTime;
  String? enterDate;
  String? enterTime;
  String? notes;

  SecurityModel({
      this.id,
      this.name,
      this.exitDate,
      this.exitTime,
      this.enterDate,
      this.enterTime,
      this.notes,
  });

  SecurityModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    exitDate = json['exitDate'];
    exitTime = json['exitTime'];
    enterDate = json['enterDate'];
    enterTime = json['enterTime'];
    notes = json['notes'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'id':id,
      'name':name,
      'exitDate':exitDate,
      'exitTime':exitTime,
      'enterDate':enterDate,
      'enterTime':enterTime,
      'notes':notes,
    };
  }
}