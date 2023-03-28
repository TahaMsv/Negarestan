import 'dart:developer';

import '../dependency_injection.dart';
import '../navigation/navigation_service.dart';
import '../navigation/router.dart';

abstract class MainController {
  late NavigationService nav;
  final MyRouter router = MyRouter();
  bool initialized =false;
  MainController() {
    nav = getIt<NavigationService>();
    if(!initialized) {
      onCreate();
    }
  }


  void onInit() {
    log(runtimeType.toString() + ' Init');
  }

  void onCreate() {
    log(runtimeType.toString() + ' Create');
    initialized =true;
  }
}
