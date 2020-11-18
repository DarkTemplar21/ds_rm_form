import 'dart:convert';

import 'package:ds_richmeat_form/model/ColdRoom.dart';
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

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        http
            .post(
          'https://rm-form-backend.herokuapp.com/richmeat/form',
          body: jsonEncode(coldRooms),
        )
            .then((response) {
          print('El server dice ${response.body}');
          // TODO q me envie aunque sea un 200 pa saber q le llego.
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.cloud_done),
                  SizedBox(
                    width: 13,
                  ),
                  Text('Datos guardados correctamente.'),
                ],
              ),
            ),
          );
        }).catchError((err) {
          print('Hubo error $err');
          // TODO q me envie aunque sea un 500 pa saber q no pincho.
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('ha ocurrido un error, los datos no se han guardado.'),
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
