import 'package:ds_richmeat_form/model/FormRM.dart';
import 'package:ds_richmeat_form/providers/drawerProvider.dart';
import 'package:ds_richmeat_form/screens/ColdRoomsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      drawer: Provider.of<DrawerProvider>(context, listen: false)
          .dameDrawer(context),
      appBar: AppBar(
        title: Text('Formularios RichMeat'),
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
