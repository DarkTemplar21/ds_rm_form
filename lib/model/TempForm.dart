import 'ColdRoom.dart';

class TempForm {
  int id;
  String created_date;
  String reviewed_date;
  String status;
  String created_by;
  String reviewed_by;
  int anden_1y2_on;
  int anden_1y2_in_range;
  int anden_1y2_reviewed;
  int conservacion_mp_on;
  int conservacion_mp_in_range;
  int conservacion_mp_reviewed;
  int conservacion_pt_on;
  int conservacion_pt_in_range;
  int conservacion_pt_reviewed;
  int anden_3y4_on;
  int anden_3y4_reviewed;
  int anden_3y4_in_range;
  int pasillo_on;
  int pasillo_in_range;
  int pasillo_reviewed;
  int empaque_on;
  int empaque_reviewed;
  int empaque_in_range;
  int preenfriamiento_pt_on;
  int preenfriamiento_pt_in_range;
  int preenfriamiento_pt_reviewed;
  int proceso_on;
  int proceso_in_range;
  int proceso_reviewed;
  int atemperado_mp_on;
  int atemperado_mp_in_range;
  int atemperado_mp_reviewed;

  TempForm({
    this.id,
    this.created_date,
    this.reviewed_date,
    this.status,
    this.created_by,
    this.reviewed_by,
    this.anden_1y2_on,
    this.anden_1y2_in_range,
    this.anden_1y2_reviewed,
    this.conservacion_mp_on,
    this.conservacion_mp_in_range,
    this.conservacion_mp_reviewed,
    this.conservacion_pt_on,
    this.conservacion_pt_in_range,
    this.conservacion_pt_reviewed,
    this.anden_3y4_on,
    this.anden_3y4_reviewed,
    this.anden_3y4_in_range,
    this.pasillo_on,
    this.pasillo_in_range,
    this.pasillo_reviewed,
    this.empaque_on,
    this.empaque_reviewed,
    this.empaque_in_range,
    this.preenfriamiento_pt_on,
    this.preenfriamiento_pt_in_range,
    this.preenfriamiento_pt_reviewed,
    this.proceso_on,
    this.proceso_in_range,
    this.proceso_reviewed,
    this.atemperado_mp_on,
    this.atemperado_mp_in_range,
    this.atemperado_mp_reviewed,
  });

  String toString() {
    return '<tf>$id, $created_by, $created_date </tf>';
  }

  Map<String, dynamic> toJson() {
    return {
      // "id": id,
      "createdDate": created_date,
      "reviewedDate": reviewed_date,
      "status": status,
      // "createdBy": created_by,
      "createdBy": "ariandi el puto amo",
      "reviewedBy": "no es nesesaria revision",
      //
      "coldRooms": [
        {
          "name": "anden_1y2",
          "isOn": anden_1y2_on,
          "inRange": anden_1y2_in_range,
          "isReviewed": anden_1y2_reviewed,
          "temperatureRange": "---",
        },
        {
          "name": "conservacion_mp",
          "isOn": conservacion_mp_on,
          "inRange": conservacion_mp_in_range,
          "isReviewed": conservacion_mp_reviewed,
          "temperatureRange": "---",
        },
        {
          "name": "conservacion_pt",
          "isOn": conservacion_pt_on,
          "inRange": conservacion_pt_in_range,
          "isReviewed": conservacion_pt_reviewed,
          "temperatureRange": "---",
        },
        {
          "name": "anden_3y4",
          "isOn": anden_3y4_on,
          "inRange": anden_3y4_in_range,
          "isReviewed": anden_3y4_reviewed,
          "temperatureRange": "---",
        },
        {
          "name": "pasillo",
          "isOn": pasillo_on,
          "inRange": pasillo_in_range,
          "isReviewed": pasillo_reviewed,
          "temperatureRange": "---",
        },
        {
          "name": "empaque",
          "isOn": empaque_on,
          "inRange": empaque_in_range,
          "isReviewed": empaque_reviewed,
          "temperatureRange": "---",
        },
        {
          "name": "preenfriamiento_pt",
          "isOn": preenfriamiento_pt_on,
          "inRange": preenfriamiento_pt_in_range,
          "isReviewed": preenfriamiento_pt_reviewed,
          "temperatureRange": "---",
        },
        {
          "name": "proceso",
          "isOn": proceso_on,
          "inRange": proceso_in_range,
          "isReviewed": proceso_reviewed,
          "temperatureRange": "---",
        },
        {
          "name": "atemperado_mp",
          "isOn": atemperado_mp_on,
          "inRange": atemperado_mp_in_range,
          "isReviewed": atemperado_mp_reviewed,
          "temperatureRange": "---",
        },
      ],
    };
  }

// Map<String, dynamic> toJson() {
//   return {
//     "id": id,
//     "created_date": created_date,
//     "reviewed_date": reviewed_date,
//     "status": status,
//     "created_by": created_by,
//     "reviewed_by": reviewed_by,
//     "anden_1y2_on": anden_1y2_on,
//     "anden_1y2_in_range": anden_1y2_in_range,
//     "anden_1y2_reviewed": anden_1y2_reviewed,
//     "conservacion_mp_on": conservacion_mp_on,
//     "conservacion_mp_in_range": conservacion_mp_in_range,
//     "conservacion_mp_reviewed": conservacion_mp_reviewed,
//     "conservacion_pt_on": conservacion_pt_on,
//     "conservacion_pt_in_range": conservacion_pt_in_range,
//     "conservacion_pt_reviewed": conservacion_pt_reviewed,
//     "anden_3y4_on": anden_3y4_on,
//     "anden_3y4_reviewed": anden_3y4_reviewed,
//     "anden_3y4_in_range": anden_3y4_in_range,
//     "pasillo_on": pasillo_on,
//     "pasillo_in_range": pasillo_in_range,
//     "pasillo_reviewed": pasillo_reviewed,
//     "empaque_on": empaque_on,
//     "empaque_reviewed": empaque_reviewed,
//     "empaque_in_range": empaque_in_range,
//     "preenfriamiento_pt_on": preenfriamiento_pt_on,
//     "preenfriamiento_pt_in_range": preenfriamiento_pt_in_range,
//     "preenfriamiento_pt_reviewed": preenfriamiento_pt_reviewed,
//     "proceso_on": proceso_on,
//     "proceso_in_range": proceso_in_range,
//     "proceso_reviewed": proceso_reviewed,
//     "atemperado_mp_on": atemperado_mp_on,
//     "atemperado_mp_in_range": atemperado_mp_in_range,
//     "atemperado_mp_reviewed": atemperado_mp_reviewed,
//   };
// }

  static TempForm dameTempFormDesdeColdRooms(List<ColdRoom> coldRooms) {
    int i = 0;
    return TempForm(
      anden_1y2_on: coldRooms[i].isOn ? 1 : 0,
      anden_1y2_in_range: coldRooms[i].isInRange ? 1 : 0,
      anden_1y2_reviewed: coldRooms[i++].isReviewed ? 1 : 0,
      conservacion_mp_on: coldRooms[i].isOn ? 1 : 0,
      conservacion_mp_in_range: coldRooms[i].isInRange ? 1 : 0,
      conservacion_mp_reviewed: coldRooms[i++].isReviewed ? 1 : 0,
      conservacion_pt_on: coldRooms[i].isOn ? 1 : 0,
      conservacion_pt_in_range: coldRooms[i].isInRange ? 1 : 0,
      conservacion_pt_reviewed: coldRooms[i++].isReviewed ? 1 : 0,
      anden_3y4_on: coldRooms[i].isOn ? 1 : 0,
      anden_3y4_in_range: coldRooms[i].isInRange ? 1 : 0,
      anden_3y4_reviewed: coldRooms[i++].isReviewed ? 1 : 0,
      pasillo_on: coldRooms[i].isOn ? 1 : 0,
      pasillo_in_range: coldRooms[i].isInRange ? 1 : 0,
      pasillo_reviewed: coldRooms[i++].isReviewed ? 1 : 0,
      empaque_on: coldRooms[i].isOn ? 1 : 0,
      empaque_in_range: coldRooms[i].isInRange ? 1 : 0,
      empaque_reviewed: coldRooms[i++].isReviewed ? 1 : 0,
      preenfriamiento_pt_on: coldRooms[i].isOn ? 1 : 0,
      preenfriamiento_pt_in_range: coldRooms[i].isInRange ? 1 : 0,
      preenfriamiento_pt_reviewed: coldRooms[i++].isReviewed ? 1 : 0,
      proceso_on: coldRooms[i].isOn ? 1 : 0,
      proceso_in_range: coldRooms[i].isInRange ? 1 : 0,
      proceso_reviewed: coldRooms[i++].isReviewed ? 1 : 0,
      atemperado_mp_on: coldRooms[i].isOn ? 1 : 0,
      atemperado_mp_in_range: coldRooms[i].isInRange ? 1 : 0,
      atemperado_mp_reviewed: coldRooms[i++].isReviewed ? 1 : 0,
      created_by: '',
      created_date: '',
      reviewed_by: '',
      reviewed_date: '',
      status: 'enviado',
    );
  }
}
