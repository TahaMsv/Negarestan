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

  bool _requesting = false;

  bool get requesting => _requesting;

  void setRequesting(bool val) {
    _requesting = val;
    notifyListeners();
  }

  String? _token;

  String get token => _token!;

  void setToken(String? val) {
    _token = val;
    notifyListeners();
  }

  final TextEditingController bookingRefNameC = TextEditingController();
  final TextEditingController lastNameC = TextEditingController();

  bool _isLastNameEmpty = false;

  bool get isLastNameEmpty => _isLastNameEmpty;

  void setIsLastNameEmpty(bool val) {
    _isLastNameEmpty = val;
    notifyListeners();
  }

  bool _isBookingRefNameEmpty = false;

  bool get isBookingRefNameEmpty => _isBookingRefNameEmpty;

  void setIsBookingRefNameEmpty(bool val) {
    _isBookingRefNameEmpty = val;
    notifyListeners();
  }

  void resetLoginState() {
    setLoginLoading(false);
    setRequesting(false);
    setToken(null);
    bookingRefNameC.clear();
    lastNameC.clear();
    setIsLastNameEmpty(false);
    setIsBookingRefNameEmpty(false);
  }
}
