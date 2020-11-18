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
    this.isOn,
    this.isInRange,
    this.isReviewed,
    this.temperatureRange,
  });
  Map<String, dynamic> toEncodable() {
    return {
      'id': id,
      'name': name,
      'isOn': isOn,
      'isInRange': isInRange,
      'isReviewed': isReviewed,
      'temperatureRange': temperatureRange,
    };
  }

  Map<String, dynamic> toJson() {
    return toEncodable();
  }
}
