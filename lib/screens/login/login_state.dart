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

  bool _checkBoxValue = false;

  bool get checkBoxValue => _checkBoxValue;

  void toggleCheckBoxValue() {
    _checkBoxValue = !_checkBoxValue;
    notifyListeners();
  }

  final TextEditingController emailC = TextEditingController();
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController firstnameC = TextEditingController();
  final TextEditingController lastnameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController yearC = TextEditingController();
  final TextEditingController monthC = TextEditingController();
  final TextEditingController dayC = TextEditingController();
}
