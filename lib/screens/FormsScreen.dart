import 'dart:convert';

import 'package:ds_richmeat_form/model/ColdRoom.dart';
import 'package:ds_richmeat_form/model/TempForm.dart';
import 'package:ds_richmeat_form/providers/AuthProvider.dart';
import 'package:ds_richmeat_form/providers/drawerProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  FormScreen();

  bool estoyEsperando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Provider.of<DrawerProvider>(context, listen: false)
            .dameDrawer(context),
        appBar: AppBar(
          title: Text("Formularioss"),
        ),
        body: FutureBuilder<List<TempForm>>(
          future: getForms(context),
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('/coldRooms',
                          arguments: snapshot.data[i].id);
                    },
                    title: Text("Revisado por:${snapshot.data[i].created_by}"),
                    leading: Image.asset("assets/img/temperature_form.png"),
                    subtitle: Text(
                        "Fecha de Creacion: ${snapshot.data[i].reviewed_date}"),
                  );
                },
                // children: snapshot.data.map((tempForm) {
                //   return ListTile(
                //     onTap: () {
                //       Navigator.of(context)
                //           .pushNamed('/coldRooms', arguments: tempForm.id);
                //     },
                //     title: Text("Revisado por:${tempForm.created_by}"),
                //     leading: Image.asset("assets/img/temperature_form.png"),
                //     subtitle:
                //         Text("Fecha de Creacion: ${tempForm.reviewed_date}"),
                //   );
                // }).toList(),
              );
            }
          },
        ));
  }

  Future<List<TempForm>> getForms(BuildContext context) async {
    var _authProvider = Provider.of<AuthProvider>(context);

    String url = 'http://rm-form-backend.herokuapp.com/richmeat/forms';
    return http.get(
      url,
      headers: {'Authorization': _authProvider.authToken},
    ).then((response) {
      List<dynamic> formMap = json.decode(response.body);
      List<TempForm> tempForms = formMap.map((tempForm) {
        Map<String, dynamic> mForm = tempForm as Map<String, dynamic>;
        List<ColdRoom> coldrooms = (mForm['coldRooms'] as List<dynamic>)
            .map((data_coldroom) => ColdRoom(
                  id: data_coldroom['temperatureFormId'],
                  name: data_coldroom['name'],
                  isOn: data_coldroom['isOn'] == 1,
                  isInRange: data_coldroom['inRange'] == 1,
                  isReviewed: data_coldroom['isReviewed'] == 1,
                  temperatureRange: data_coldroom['temperatureRange'],
                ))
            .toList();
        TempForm res = TempForm.dameTempFormDesdeColdRooms(coldrooms);
        res.id = mForm["id"] as int;
        res.created_date = mForm["createdDate"] as String;
        res.reviewed_date = mForm["reviewedDate"] as String;
        res.status = mForm["status"] as String;
        res.created_by = mForm["createdBy"] as String;
        res.reviewed_by = mForm["reviewedBy"] as String;
        return res;
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
