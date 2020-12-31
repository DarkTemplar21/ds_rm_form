class ColdRoom {
  int id;
  String name;
  bool isOn;
  bool isInRange;
  bool isReviewed;
  String temperatureRange;

  ColdRoom({
    this.id,
    this.name,
    this.isOn = true,
    this.isInRange = true,
    this.isReviewed = true,
    this.temperatureRange,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isOn': isOn ? 1 : 0,
      'isInRange': isInRange ? 1 : 0,
      'isReviewed': isReviewed ? 1 : 0,
      'temperatureRange': temperatureRange,
    };
  }

  ColdRoom.fromJson(Map<String, dynamic> jsonMap) {
    this.id = jsonMap['id'] as int;
    this.name = jsonMap['name'] as String;
    this.isOn = jsonMap['isOn'] == 1;
    this.isInRange = jsonMap['isInRange'] == 1;
    this.isReviewed = jsonMap['isReviewed'] == 1;
    this.temperatureRange = jsonMap['temperatureRange'] as String;
  }
}
