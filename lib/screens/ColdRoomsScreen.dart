import 'dart:convert';

import 'package:ds_richmeat_form/model/ColdRoom.dart';
import 'package:ds_richmeat_form/model/Form.dart';
import 'package:ds_richmeat_form/widgets/ColdRoomWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ColdRoomsScreen extends StatelessWidget {
  final double _fixedWidth = 130.0;
  List<ColdRoom> coldRooms = [
    ColdRoom(
        id: 0,
        name: 'Andén 1 y 2',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-4 a 0'),
    ColdRoom(
        id: 1,
        name: 'Conservación de MP',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-4 a 0'),
    ColdRoom(
        id: 2,
        name: 'Conservación de PT',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-4 a 0'),
    ColdRoom(
        id: 3,
        name: 'Anden 3 y 4',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-4 a 0'),
    ColdRoom(
        id: 4,
        name: 'Pasillo',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-4 a 0'),
    ColdRoom(
        id: 5,
        name: 'Empaque',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-4 a 0'),
    ColdRoom(
        id: 6,
        name: 'Preenfriamiento o PT',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-4 a 0'),
    ColdRoom(
        id: 7,
        name: 'Proceso',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-4 a 0'),
    ColdRoom(
        id: 8,
        name: 'Temperado MP',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-4 a 0'),
    ColdRoom(
        id: 8,
        name: 'Temperado MP',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-4 a 0'),
    ColdRoom(
        id: 8,
        name: 'Temperado MP',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-4 a 0'),
    ColdRoom(
        id: 8,
        name: 'Temperado MP',
        isOn: true,
        isInRange: true,
        isReviewed: true,
        temperatureRange: '-4 a 0'),
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
      created_by: 'anonimous for now',
      created_date: '',
      reviewed_by: '',
      reviewed_date: '',
      status: 'enviado',
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        TempForm tempForm = dameTempFormDesdeColdRooms(coldRooms);
        http
            .post(
          'https://rm-form-backend.herokuapp.com/richmeat/form',
          body: jsonEncode(tempForm),
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
