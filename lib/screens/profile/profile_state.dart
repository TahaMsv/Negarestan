import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileState with ChangeNotifier {
  setState() => notifyListeners();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setIsLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  // final TextEditingController usernameC = TextEditingController();
  final TextEditingController lastNameC = TextEditingController();
  final TextEditingController firstNameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();

}
