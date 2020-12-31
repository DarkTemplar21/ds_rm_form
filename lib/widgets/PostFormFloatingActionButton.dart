import 'dart:convert';

import 'package:ds_richmeat_form/model/ColdRoom.dart';
import 'package:ds_richmeat_form/model/TempForm.dart';
import 'package:ds_richmeat_form/providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class PostFormFloatingActionButton extends StatelessWidget {
  const PostFormFloatingActionButton({
    Key key,
    @required this.coldRooms,
    this.estaCargando,
  }) : super(key: key);

  final List<ColdRoom> coldRooms;
  final bool estaCargando;

  @override
  Widget build(BuildContext context) {
    var _authProvider = Provider.of<AuthProvider>(context);
    return FloatingActionButton(
      onPressed: estaCargando
          ? null
          : () {
              TempForm tempFormActual = TempForm(
                id: -1,
                status: TEMP_FORM_STATUS.CREADO,
                reviewedDate: '',
                createdDate: '',
                reviewedBy: '',
                createdBy:
                    Provider.of<AuthProvider>(context, listen: false).nombre,
                coldRooms: coldRooms,
              );
              String formulario = jsonEncode(tempFormActual);
              print('envio\n\n\n');
              print(formulario);
              print('\n\n\n');
              http.post(
                'https://rm-form-backend.herokuapp.com/richmeat/form',
                body: formulario,
                headers: {'Authorization': _authProvider.authToken},
              ).then((response) {
                var formSubido = response.statusCode == 201;

                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: formSubido
                        ? Theme.of(context).primaryColor
                        : Colors.red,
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
