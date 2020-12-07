import 'dart:convert';

import 'package:ds_richmeat_form/screens/FormMenuScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginDialog extends StatefulWidget {
  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static const _url = 'https://rm-form-backend.herokuapp.com/richmeat/login';
  bool _mantener_autenticado = true;
  void irAlMenu(BuildContext context) async {
    Navigator.pop(context);
    Navigator.push(context, FormMenuRoute());
  }

  Future<bool> login(BuildContext context, String usuario, String clave) async {
    http
        .post(
      _url,
      headers: {'content-type': 'application/json'},
      body: json.encode(
        {'userName': usuario, 'password': clave},
      ),
    )
        .then((response) {
      if (response.statusCode == 201) {
        if (response.body == 'login:true') {
          irAlMenu(context);
        } else {
          showMyDialog(
              context, 'Error', 'Usuario o contraseña incorrecta.', 'Aceptar');
        }
      } else {
        showMyDialog(
            context, 'Error', 'Hay un problema en la comunicación.', 'Aceptar');
      }
    }).catchError((err) {
      showMyDialog(
          context,
          'Error',
          'Ha ocurrido un error de red.'
              '\nAsegúrese de estar conectado a internet.',
          'Aceptar');
    });
  }

  void showMyDialog(
      BuildContext context, String titulo, String mensaje, String accion) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mensaje),
            actions: [
              FlatButton(
                child: Text(accion),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
      ),
      body: Center(
        child: Container(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: ListView(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Usuario"),
                    controller: userController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Contraseña"),
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _mantener_autenticado,
                            onChanged: (checked) {
                              setState(() {
                                _mantener_autenticado = checked;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Text("Mantenerme Autenticado."),
                            onTap: () {
                              setState(() {
                                _mantener_autenticado = !_mantener_autenticado;
                              });
                            },
                          ),
                        ],
                      ),
                      RaisedButton(
                        onPressed: () {
                          login(context, userController.text,
                              passwordController.text);
                        },
                        child: Text("Entrar"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginRoute extends MaterialPageRoute<bool> {
  LoginRoute()
      : super(builder: (context) {
          return LoginDialog();
        });
}
