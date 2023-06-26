import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/classes/Project.dart';

class ProfileState with ChangeNotifier {
  setState() => notifyListeners();

  bool loading = false;

  bool get isLoading => loading;

  void setLoading(bool val) {
    loading = val;
    notifyListeners();
  }

  List<Project> _projects = [];

  List<Project> get projects => _projects;

  void setProjects(List<Project> val) {
    _projects = val;
    notifyListeners();
  }

  void removeProject(int projectID) {
    projects.removeWhere((element) => element.id == projectID);
    notifyListeners();
  }

  // final TextEditingController usernameC = TextEditingController();
  final TextEditingController lastNameC = TextEditingController();
  final TextEditingController firstNameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
}
