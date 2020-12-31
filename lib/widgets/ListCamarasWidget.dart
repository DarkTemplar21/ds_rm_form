import 'package:ds_richmeat_form/model/ColdRoom.dart';
import 'package:flutter/material.dart';

import 'ColdRoomWidget.dart';

class ListCamarasWidget extends StatelessWidget {
  const ListCamarasWidget({
    Key key,
    @required double fixedWidth,
    @required this.coldRooms,
  })  : _fixedWidth = fixedWidth,
        super(key: key);

  final double _fixedWidth;
  final List<ColdRoom> coldRooms;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
    );
  }
}
