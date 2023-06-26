import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostState with ChangeNotifier {
  setState() => notifyListeners();

  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  List<String> _selectedLabels = [];

  List<String> get selectedLabels => _selectedLabels;

  void setSelectedLabels(List<String> val) {
    _selectedLabels = val;
    notifyListeners();
  }

  final TextEditingController postNameC = TextEditingController();
  final TextEditingController postDescriptionC = TextEditingController();
  final TextEditingController awardsC = TextEditingController();

  List<File> selectedImages = [];
}
