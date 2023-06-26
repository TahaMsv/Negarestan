import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/classes/Project.dart';

class ProjectsState with ChangeNotifier {
  setState() => notifyListeners();

  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  List<Project> _projects = [];

  List<Project> get projects => _projects;

  void setProjects(List<Project> val) {
    _projects = val;
    notifyListeners();
  }
}
