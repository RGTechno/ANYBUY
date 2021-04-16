import 'package:flutter/material.dart';

class AuthData with ChangeNotifier {
  bool _isAuth = false;

  bool get isAuth {
    return _isAuth;
  }
}
