import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  String _authToken = "";

  String get authToken => _authToken;
  set authToken(String newToken) {
    _authToken = newToken;
    notifyListeners();
  }
}
