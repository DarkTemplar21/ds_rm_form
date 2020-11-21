import 'package:ds_richmeat_form/model/FormRM.dart';
import 'package:ds_richmeat_form/screens/ColdRoomsScreen.dart';
import 'package:ds_richmeat_form/screens/FormsScreen.dart';
import 'package:flutter/material.dart';

class FormMenuScreen extends StatelessWidget {
  final String _title;

  List<FormRM> forms = [
    FormRM(
        name: "Temperaturas",
        detail: "Formulario de TEMP",
        imageURI: "assets/img/temperature_form.png",
        screen: ColdRoomRoute()),
    FormRM(
        name: "Pepe",
        detail: "Formulario de TEMP",
        imageURI: "assets/img/temperature_form.png",
        screen: ColdRoomRoute()),
    FormRM(
        name: "Calabaza",
        detail: "Formulario de TEMP",
        imageURI: "assets/img/temperature_form.png",
        screen: ColdRoomRoute()),
    FormRM(
        name: "Juan",
        detail: "Formulario de TEMP",
        imageURI: "assets/img/temperature_form.png",
        screen: ColdRoomRoute()),
  ];

  FormMenuScreen(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.asset("assets/img/app_icon.png"),
              accountName: Text("ale"),
              accountEmail: Text("ale@richmeat.com"),
            ),
            Text("Formularios"),
            ListTile(
              title: Text("Revisados"),
              onTap: (){ Navigator.popAndPushNamed(context, "/form");},
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
        title: Text(_title),
      ),
      body: ListView(
          children: forms
              .map(
                (formRM) => Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/coldRooms");
                    },
                    child: ListTile(
                      title: Text(formRM.name),
                      subtitle: Text(formRM.detail),
                      leading: Image.asset(formRM.imageURI),
                    ),
                  ),
                ),
              )
              .toList()),
    );
  }
}

class FormMenuRoute extends MaterialPageRoute {
  FormMenuRoute()
      : super(builder: (context) {
          return FormMenuScreen("Formularios");
        });
  
}
