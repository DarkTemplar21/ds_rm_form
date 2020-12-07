import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  String _nombre = '';
  String _authToken = "";
  String _rol = "";

  String get rol => _rol;

  String get authToken => _authToken;

  String get nombre => _nombre;

  // set authToken(String newToken) {
  //   //y asi es como se impone el respeto
  //   _authToken = newToken;
  //   notifyListeners();
  // }

  void setAuth(String token, String nombre, String rol) {
    _nombre = nombre;
    _authToken = token;
    _rol = rol;
    notifyListeners();
  }
}
