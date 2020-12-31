import 'dart:convert';

import 'ColdRoom.dart';

class TEMP_FORM_STATUS {
  static const String CREADO = 'creado';
  static const String REVISADO = 'revisado';
  static const String DESCONOCIDO = 'desconocido';
}

class TempFormPreview {
  // TODO q alexis me mande solo estos 3 datos al obtener lista de formularios
  int id;
  String fecha;
  String status;

  TempFormPreview({this.id, this.fecha, this.status});

  TempFormPreview.fromJsonData(Map<String, dynamic> data) {
    this.id = data['id'] as int;
    this.fecha = data['createdDate'] as String;
    this.status = data['status'] as String;
  }
}

class TempForm {
  int id;
  String createdDate;
  String reviewedDate;
  String status;
  String createdBy;
  String reviewedBy;
  List<ColdRoom> coldRooms;

  TempForm({
    this.id,
    this.createdDate,
    this.reviewedDate,
    this.status,
    this.createdBy,
    this.reviewedBy,
    this.coldRooms,
  });

  Map<String, dynamic> toJson() {
    return {
      "createdDate": createdDate,
      "reviewedDate": reviewedDate,
      "status": status,
      "createdBy": createdBy,
      "reviewedBy": reviewedBy,
      "coldRooms": coldRooms.map((coldRoom) => coldRoom.toJson()).toList()
    };
  }

  TempForm.fromJson(String json) {
    Map<String, dynamic> jsonMap = jsonDecode(json);
    this.createdDate = jsonMap['createdDate'] as String;
    this.reviewedDate = jsonMap['reviewedDate'] as String;
    this.status = jsonMap['status'] as String;
    this.createdBy = jsonMap['createdBy'] as String;
    this.createdBy = jsonMap['createdBy'] as String;
    this.reviewedBy = jsonMap['reviewedBy'] as String;

    this.coldRooms = List<ColdRoom>();
    List<dynamic> coldRoomsData = jsonMap['coldRooms'] as List<dynamic>;
    coldRoomsData.forEach((e) {
      Map<String, dynamic> coldRoomData = e as Map<String, dynamic>;
      this.coldRooms.add(ColdRoom.fromJson(coldRoomData));
    });
  }
}
