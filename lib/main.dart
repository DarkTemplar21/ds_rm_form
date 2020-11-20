import 'dart:convert';

import 'package:ds_richmeat_form/providers/AuthProvider.dart';
import 'package:ds_richmeat_form/screens/FormMenuScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
      return  AuthProvider();
      },
      child: MaterialApp(
        title: 'Login Demo',
        theme: ThemeData(
          // brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.orange,
          cursorColor: Colors.orange,
          // fontFamily: 'SourceSansPro',
          textTheme: TextTheme(
            display2: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 45.0,
              // fontWeight: FontWeight.w400,
              color: Colors.orange,
            ),
            button: TextStyle(
              // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
              fontFamily: 'OpenSans',
            ),
            caption: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Colors.deepPurple[300],
            ),
            display4: TextStyle(fontFamily: 'Quicksand'),
            display3: TextStyle(fontFamily: 'Quicksand'),
            display1: TextStyle(fontFamily: 'Quicksand'),
            headline: TextStyle(fontFamily: 'NotoSans'),
            title: TextStyle(fontFamily: 'NotoSans'),
            subhead: TextStyle(fontFamily: 'NotoSans'),
            body2: TextStyle(fontFamily: 'NotoSans'),
            body1: TextStyle(fontFamily: 'NotoSans'),
            subtitle: TextStyle(fontFamily: 'NotoSans'),
            overline: TextStyle(fontFamily: 'NotoSans'),
          ),
        ),
        home: LoginScreen(),
      ),
    );
  }
}

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  static const _url = 'https://rm-form-backend.herokuapp.com/richmeat/login';
  bool _isLogged = false;

  Duration get loginTime => Duration(milliseconds: 2250);

  void irAlMenu(BuildContext context) async {
    Navigator.pop(context);
    Navigator.push(context, FormMenuRoute());
  }

  Future<String> _authUser(LoginData data, BuildContext context) {
    _isLogged = false;
    return http
        .post(
      _url,
      headers: {'content-type': 'application/json'},
      body: json.encode(
        {'userName': data.name, 'password': data.password},
      ),
    )
        .then((response) {
      _isLogged = true;
      print('status: ${response.statusCode} body:${response.body}');
      if(response.statusCode == 200){
        var _authProvider = Provider.of<AuthProvider>(context);
        _authProvider.authToken = "Bearer ${response.body.split(":")[1]}";
        return null;

      }
      return "Error de Autenticación";
    }).catchError((err) {
      return Future.value('Error de RED.');
    });

  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
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

  //---------------------------------------------

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'DS FORMS',
      messages: LoginMessages(
          usernameHint: "Usuario",
          passwordHint: "Contraseña",
          loginButton: "ENTRAR",
          signupButton: "REGISTRARSE",
          forgotPasswordButton: "¿Olvidó la contraseña?"),
      emailValidator: (usuario) {
        return usuario.isEmpty ? "Usuario incorrecto" : null;
      },
      logo: 'assets/img/app_icon.png',
      onLogin: (LoginData data) {
        return _authUser(data, context);
      },
      onSignup: null,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => FormMenuScreen(""),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
