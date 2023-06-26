import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/classes/Project.dart';
import '../../core/classes/post.dart';
import '../../core/classes/user.dart';

class PostDetailsState with ChangeNotifier {
  setState() => notifyListeners();

  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  User? userDetails;

  void setUserDetails(User? user) {
    userDetails = user;
    notifyListeners();
  }

  Project? projectDetails;

  void setProjectDetails(Project? val) {
    projectDetails = val;
    notifyListeners();
  }

  bool _isFollowed = true;

  bool get isFollowed => _isFollowed;

  void setIsFollowed(bool val) {
    _isFollowed = val;
    notifyListeners();
  }

  bool _isFollowBtnNeeded = true;

  bool get isFollowBtnNeeded => _isFollowBtnNeeded;

  void setIsFollowBtnNeeded(bool val) {
    _isFollowBtnNeeded = val;
    notifyListeners();
  }
}
