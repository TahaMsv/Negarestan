import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostState with ChangeNotifier {
  setState() => notifyListeners();

  final TextEditingController postNameC = TextEditingController();

  List<File> selectedImages = [];

}
