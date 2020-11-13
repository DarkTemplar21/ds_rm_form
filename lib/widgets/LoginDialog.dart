import 'dart:convert';
import 'dart:io';

import 'package:ds_richmeat_form/screens/FormMenuScreen.dart';
import 'package:flutter/material.dart';

class LoginDialog extends StatefulWidget {
  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static const _url = 'https://rm-form-backend.herokuapp.com/richmeat/login';

  void irAlMenu(BuildContext context) async {
    Navigator.pop(context);
    Navigator.push(context, FormMenuRoute());
  }

  Future<bool> login(BuildContext context, String usuario, String clave) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(_url));
    request.headers.set('content-type', 'application/json');
    request.add(
        utf8.encode(json.encode({'userName': usuario, 'password': clave})));
    HttpClientResponse response = await request.close();
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    print('resp= $reply');

    if (reply == 'login:true') {
      irAlMenu(context);
    } else {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Usuario o contraseña incorrecta.'),
              actions: [
                FlatButton(
                  child: Text('ACEPTAR'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("xddx"),
      ),
      body: Padding(
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
                        value: true,
                        onChanged: (checked) {},
                      ),
                      Text("Mantenerme Autenticado."),
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
    );
  }
}

class LoginRoute extends MaterialPageRoute<bool> {
  LoginRoute()
      : super(builder: (context) {
          return LoginDialog();
        });
}
