import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/classes/user.dart';

class HomeState with ChangeNotifier {
  setState() => notifyListeners();

  User? _user;

  User get user => _user!;

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}
