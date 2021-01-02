import 'dart:convert';

import 'package:ds_richmeat_form/providers/AuthProvider.dart';
import 'package:ds_richmeat_form/providers/drawerProvider.dart';
import 'package:ds_richmeat_form/screens/ColdRoomsScreen.dart';
import 'package:ds_richmeat_form/screens/FormMenuScreen.dart';
import 'package:ds_richmeat_form/screens/FormsScreen.dart';
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
        return AuthProvider();
      },
      child: ChangeNotifierProvider(
        create: (context) {
          return DrawerProvider();
        },
        child: MaterialApp(
          routes: {
            '/formMenu': (context) => FormMenuScreen(""),
            '/coldRooms': (context) => ColdRoomsScreen(),
            '/form': (context) => FormScreen(),
          },
          title: 'Login Demo',
          theme: ThemeData(
            // brightness: Brightness.dark,
            // primarySwatch: Colors.deepPurple,
            primarySwatch: Colors.indigo,
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
      ),
    );
  }
}

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  static const _loginUrl =
      'https://rm-form-backend.herokuapp.com/richmeat/login';
  static const _signUpUrl =
      'https://rm-form-backend.herokuapp.com/richmeat/sign_up';
  bool _isLogged = false;

  Duration get loginTime => Duration(milliseconds: 2250);

  void irAlMenu(BuildContext context) async {
    Navigator.pop(context);
    Navigator.pushNamed(context, "/formMenu");
  }

  void actualizaLoginProviderFromServerData(
      BuildContext context, String nombre, String data) {
    //Actualiza el provider de login y signin con la info que me da el servidor
    // data es el response.body para las peticiones de login y signin
    var userData = jsonDecode(data) as Map<String, dynamic>;
    String token = userData['token'] as String;
    String rol = userData['role'] as String;
    var _autProv = Provider.of<AuthProvider>(context, listen: false);
    _autProv.setAuth('Bearer $token', nombre, rol);
  }

  Future<String> _authUser(LoginData data, BuildContext context) {
    _isLogged = false;
    return http
        .post(
      _loginUrl,
      headers: {'content-type': 'application/json'},
      body: json.encode(
        {'userName': data.name, 'password': data.password},
      ),
    )
        .then((response) {
      _isLogged = true;
      if (response.statusCode == 201) {
        actualizaLoginProviderFromServerData(context, data.name, response.body);
        return null;
      }
      return "Error de Autenticación"; // FIXME no hay q debolver un future?
    }).catchError((err) {
      return Future.value('Error de RED.');
    });
  }

  Future<String> _recoverPassword(String name) {
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
      title: '',
      messages: LoginMessages(
          usernameHint: "Usuario",
          passwordHint: "Contraseña",
          loginButton: "ENTRAR",
          signupButton: "REGISTRARSE",
          forgotPasswordButton: "¿Olvidó la contraseña?"),
      emailValidator: (usuario) {
        return usuario.isEmpty ? "Usuario incorrecto" : null;
      },
      // logo: 'assets/img/rm_logo.png',
      onLogin: (LoginData data) {
        return _authUser(data, context);
      },
      onSignup: (LoginData data) {
        return _singUpUser(data, context);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).popAndPushNamed("/formMenu");
      },
      onRecoverPassword: _recoverPassword,
    );
  }

  Future<String> _singUpUser(LoginData data, BuildContext context) {
    _isLogged = false;
    return http
        .post(
      _signUpUrl,
      headers: {'content-type': 'application/json'},
      body: json.encode(
        {'userName': data.name, 'password': data.password},
      ),
    )
        .then((response) {
      _isLogged = true;
      if (response.statusCode == 201) {
        // var _authProvider = Provider.of<AuthProvider>(context, listen: false);
        // _authProvider.authToken = "Bearer ${response.body.split(":")[1]}";
        actualizaLoginProviderFromServerData(context, data.name, response.body);
        return null;
      } else if (response.statusCode == 406) {
        return "Error el usuario ya existe.";
      }
      return "Error desconocido";
    }).catchError((err) {
      return Future.value('Error de RED.');
    });
  }
}
