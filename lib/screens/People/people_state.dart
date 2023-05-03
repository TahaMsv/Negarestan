import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeopleState with ChangeNotifier {
  setState() => notifyListeners();
}
