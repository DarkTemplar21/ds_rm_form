import 'dart:convert';

import 'package:ds_richmeat_form/model/TempForm.dart';
import 'package:ds_richmeat_form/providers/AuthProvider.dart';
import 'package:ds_richmeat_form/providers/drawerProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  FormScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Provider.of<DrawerProvider>(context, listen: false)
            .dameDrawer(context),
        appBar: AppBar(
          title: Text("Formularios Creados"),
        ),
        body: FutureBuilder<List<TempFormPreview>>(
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
                    title: Text(
                      "Creado: ${snapshot.data[i].fecha}",
                      style: TextStyle(fontSize: 17),
                    ),
                    leading: Image.asset(
                      "assets/img/temperature_form.png",
                      width: 46,
                    ),
                    subtitle: Text(
                      "Estado: ${snapshot.data[i].status}",
                    ),
                  );
                },
              );
            }
          },
        ));
  }

  Future<List<TempFormPreview>> getForms(BuildContext context) async {
    var _authProvider = Provider.of<AuthProvider>(context);
    String url = 'http://rm-form-backend.herokuapp.com/richmeat/forms';
    return http.get(
      url,
      headers: {'Authorization': _authProvider.authToken},
    ).then((response) {
      List<dynamic> formMap = json.decode(response.body);
      List<TempFormPreview> tempFormPreviews = formMap.map((tempForm) {
        return TempFormPreview.fromJsonData(tempForm);
      }).toList();
      return tempFormPreviews;
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
