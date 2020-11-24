import 'dart:convert';

import 'package:ds_richmeat_form/model/ColdRoom.dart';
import 'package:ds_richmeat_form/model/TempForm.dart';
import 'package:ds_richmeat_form/providers/AuthProvider.dart';
import 'package:ds_richmeat_form/widgets/ColdRoomWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ColdRoomsScreen extends StatelessWidget {
  final double _fixedWidth = 130.0;
  List<ColdRoom> coldRooms = [
    ColdRoom(
        id: 0,
        name: 'Andén 1 y 2  (Rango: 8 a 14 °C)',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '8 a 14'),
    ColdRoom(
        id: 1,
        name: 'Conservación de MP (Rango: -5 a -20 °C)',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-5 a -20'),
    ColdRoom(
        id: 2,
        name: 'Conservación de PT (Rango: -10 a -23 °C)',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-10 a -23'),
    ColdRoom(
        id: 3,
        name: 'Anden 3 y 4 (Rango: 8 a 14 °C)',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '8 a 14'),
    ColdRoom(
        id: 4,
        name: 'Pasillo (Rango: 8 a 14 °C)',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '8 a 14'),
    ColdRoom(
        id: 5,
        name: 'Empaque (Rango: 8 a 13 °C)',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '8 a 13'),
    ColdRoom(
        id: 6,
        name: 'Preenfriamiento o PT (Rango: 0 a -5 °C)',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '0 a -5'),
    ColdRoom(
        id: 7,
        name: 'Proceso (Rango: 8 a 12 °C)',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '8 a 12'),
    ColdRoom(
        id: 8,
        name: 'Temperado MP (Rango: 0 a 12 °C)',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '0 a 12'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camaras de Enfriamiento"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: _fixedWidth,
                    child: Text(
                      "Cámara",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    "Encendida",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    "En Rango",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    "Revisada",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView(
                children: coldRooms.map((coldRoom) {
                  return ColdRoomWidget(coldRoom);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: PostFormFloatingActionButton(coldRooms: coldRooms),
    );
  }
}

class PostFormFloatingActionButton extends StatelessWidget {
  const PostFormFloatingActionButton({
    Key key,
    @required this.coldRooms,
  }) : super(key: key);

  final List<ColdRoom> coldRooms;

  TempForm dameTempFormDesdeColdRooms(List<ColdRoom> coldRooms) {
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

  @override
  Widget build(BuildContext context) {
    var _authProvider = Provider.of<AuthProvider>(context);
    return FloatingActionButton(
      onPressed: () {
        TempForm tempForm = dameTempFormDesdeColdRooms(coldRooms);
        http
            .post(
          'https://rm-form-backend.herokuapp.com/richmeat/form',
          body: jsonEncode(tempForm),
          headers: {'Authorization': _authProvider.authToken},
        )
            .then((response) {
          print('Con code ${response.statusCode}');
          var formSubido = response.statusCode == 201;

          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: formSubido ? Colors.green : Colors.red,
              content: Row(
                children: [
                  Icon(formSubido ? Icons.cloud_done : Icons.cloud_off),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    formSubido
                        ? 'Datos guardados correctamente.'
                        : 'Error, el formulario no se ha guardado.',
                  ),
                ],
              ),
            ),
          );
        }).catchError((err) {
          print('Hubo error $err');
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text('Error, los datos no se han guardado.\n'
                  'Revise su coneccion a internet.'),
            ),
          );
        });
      },
      child: Icon(Icons.done),
    );
  }
}

class ColdRoomRoute extends MaterialPageRoute {
  ColdRoomRoute()
      : super(builder: (context) {
          return ColdRoomsScreen();
        });
}
