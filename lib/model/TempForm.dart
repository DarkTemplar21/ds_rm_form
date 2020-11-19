class TempForm {
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

  Map<String, dynamic> toJson() {
    return {
      "created_date": created_date,
      "reviewed_date": reviewed_date,
      "status": status,
      "created_by": created_by,
      "reviewed_by": reviewed_by,
      "anden_1y2_on": anden_1y2_on,
      "anden_1y2_in_range": anden_1y2_in_range,
      "anden_1y2_reviewed": anden_1y2_reviewed,
      "conservacion_mp_on": conservacion_mp_on,
      "conservacion_mp_in_range": conservacion_mp_in_range,
      "conservacion_mp_reviewed": conservacion_mp_reviewed,
      "conservacion_pt_on": conservacion_pt_on,
      "conservacion_pt_in_range": conservacion_pt_in_range,
      "conservacion_pt_reviewed": conservacion_pt_reviewed,
      "anden_3y4_on": anden_3y4_on,
      "anden_3y4_reviewed": anden_3y4_reviewed,
      "anden_3y4_in_range": anden_3y4_in_range,
      "pasillo_on": pasillo_on,
      "pasillo_in_range": pasillo_in_range,
      "pasillo_reviewed": pasillo_reviewed,
      "empaque_on": empaque_on,
      "empaque_reviewed": empaque_reviewed,
      "empaque_in_range": empaque_in_range,
      "preenfriamiento_pt_on": preenfriamiento_pt_on,
      "preenfriamiento_pt_in_range": preenfriamiento_pt_in_range,
      "preenfriamiento_pt_reviewed": preenfriamiento_pt_reviewed,
      "proceso_on": proceso_on,
      "proceso_in_range": proceso_in_range,
      "proceso_reviewed": proceso_reviewed,
      "atemperado_mp_on": atemperado_mp_on,
      "atemperado_mp_in_range": atemperado_mp_in_range,
      "atemperado_mp_reviewed": atemperado_mp_reviewed,
    };
  }
}
