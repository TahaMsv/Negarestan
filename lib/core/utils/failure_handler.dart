import 'dart:developer';

import 'package:flutter/material.dart';
import '../../core/dependency_injection.dart';
import '../../core/error/failures.dart';
import '../../core/navigation/navigation_service.dart';
import '../constants/ui.dart';

class FailureHandler {
  static final NavigationService navigationService = getIt<NavigationService>();

  FailureHandler._();

  static void handle(Failure failure, {Function? retry}) {
    navigationService.snackbar(Text("Error ${failure.code}: ${failure.msg}"),
        icon: Icons.error,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          textColor: MyColors.white,
          label: "Retry",
          onPressed: () {
            log("Retry");
            retry?.call();
          },
        ));
  }

  static void handleNoElement(String name) {
    navigationService.snackbar(
      Text("Could not Find $name"),
      icon: Icons.error,
      backgroundColor: Colors.orange,
      duration: const Duration(seconds: 5),
    );
  }
}
