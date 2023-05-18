import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState with ChangeNotifier {
  setState() => notifyListeners();

  bool _loginLoading = false;

  bool get loginLoading => _loginLoading;

  void setLoginLoading(bool val) {
    _loginLoading = val;
    notifyListeners();
  }

  bool _isLoginMode = false;

  bool get isLoginMode => _isLoginMode;

  void setIsLoginMode(bool val) {
    _isLoginMode = val;
    notifyListeners();
  }

  String? _token;

  String get token => _token!;

  void setToken(String val) {
    _token = val;
    notifyListeners();
  }
}
