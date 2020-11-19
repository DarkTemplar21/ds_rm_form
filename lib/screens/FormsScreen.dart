import 'dart:convert';

import 'package:ds_richmeat_form/model/TempForm.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormScreen extends StatelessWidget {
  FormScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: Image.asset("assets/img/ddg.png"),
                accountName: Text("ale"),
                accountEmail: Text("ale@richmeat.com"),
                otherAccountsPictures: [
                  Image.asset("assets/img/temperature_form.png"),
                ],
              ),
              Text("Formularios"),
              ListTile(
                title: Text("Revisados"),
                leading: Image.asset("assets/img/temperature_form.png"),
              ),
              ListTile(
                title: Text("Pendientes a Revisar"),
                leading: Image.asset("assets/img/temperature_form.png"),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Formularios"),
        ),
        body: FutureBuilder<List<TempForm>>(
          future: getForms(context),
          builder: (BuildContext context, snapshot) {
            print("dentro de afuera");

            if (!snapshot.hasData) {
              print("dentro de snap");
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              print("dentro de else");
              return Column(
                children: snapshot.data
                    .map((tempForm) => ListTile(
                          title: Text("Revisado por:${tempForm.reviewed_by}"),
                          leading:
                              Image.asset("assets/img/temperature_form.png"),
                          subtitle: Text(
                              "Fecha de Creacion: ${tempForm.reviewed_date}"),
                        ))
                    .toList(),
              );
            }
          },
        ));
  }

  Future<List<TempForm>> getForms(BuildContext context) async {
    String url = 'http://rm-form-backend.herokuapp.com/richmeat/forms';
    return http.get(url).then((response) {
      List<dynamic> formMap = json.decode(response.body);
      List<TempForm> tempForms = formMap.map((tempForm) {
        Map<String, dynamic> mForm = tempForm as Map<String, dynamic>;
        return TempForm(
            created_date: mForm["created_date"] as String,
            reviewed_date: mForm["reviewed_date"] as String,
            status: mForm["status"] as String,
            created_by: mForm["created_by"] as String,
            reviewed_by: mForm["reviewed_by"] as String,
            anden_1y2_on: mForm["anden_1y2_on"] as int,
            anden_1y2_in_range: mForm["anden_1y2_in_range"] as int,
            anden_1y2_reviewed: mForm["anden_1y2_reviewed"] as int,
            conservacion_mp_on: mForm["conservacion_mp_on"] as int,
            conservacion_mp_in_range: mForm["conservacion_mp_in_range"] as int,
            conservacion_mp_reviewed: mForm["conservacion_mp_reviewed"] as int,
            conservacion_pt_on: mForm["conservacion_pt_on"] as int,
            conservacion_pt_in_range: mForm["conservacion_pt_in_range"] as int,
            conservacion_pt_reviewed: mForm["conservacion_pt_reviewed"] as int,
            anden_3y4_on: mForm["anden_3y4_on"] as int,
            anden_3y4_reviewed: mForm["anden_3y4_reviewed"] as int,
            anden_3y4_in_range: mForm["anden_3y4_in_range"] as int,
            pasillo_on: mForm["pasillo_on"] as int,
            pasillo_in_range: mForm["pasillo_in_range"] as int,
            pasillo_reviewed: mForm["pasillo_reviewed"] as int,
            empaque_on: mForm["empaque_on"] as int,
            empaque_reviewed: mForm["empaque_reviewed"] as int,
            empaque_in_range: mForm["empaque_in_range"] as int,
            preenfriamiento_pt_on: mForm["preenfriamiento_pt_on"] as int,
            preenfriamiento_pt_in_range:
                mForm["preenfriamiento_pt_in_range"] as int,
            preenfriamiento_pt_reviewed:
                mForm["preenfriamiento_pt_reviewed"] as int,
            proceso_on: mForm["proceso_on"] as int,
            proceso_in_range: mForm["proceso_in_range"] as int,
            proceso_reviewed: mForm["proceso_reviewed"] as int,
            atemperado_mp_on: mForm["atemperado_mp_on"] as int,
            atemperado_mp_in_range: mForm["atemperado_mp_in_range"] as int,
            atemperado_mp_reviewed: mForm["atemperado_mp_reviewed"] as int);
      }).toList();
      return tempForms;
    }).catchError((onError) {
      print("xddxdddd $onError");
    });
  }
}

class FormScreenRoute extends MaterialPageRoute {
  FormScreenRoute()
      : super(builder: (context) {
          return FormScreen();
        });
}
