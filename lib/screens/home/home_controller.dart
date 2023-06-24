import 'package:negarestan/core/constants/route_names.dart';
import 'package:negarestan/screens/profile/profile_controller.dart';

import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import 'home_repository.dart';
import 'home_state.dart';

class HomeController extends MainController {
  final HomeState homeState = getIt<HomeState>();
  final HomeRepository homeRepository = getIt<HomeRepository>();

  void goToPage(int index) {
    switch (index) {
      case 0:
        nav.goToName(RouteNames.projects);
        break;
      case 1:
        nav.goToName(RouteNames.people);
        break;
      case 2:
        nav.goToName(RouteNames.search);
        break;
      case 3:
        nav.goToName(RouteNames.profile);
        final ProfileController profileController = getIt<ProfileController>();
        profileController.me(homeState.user.token!, false);
        break;
    }
  }

  @override
  void onCreate() {}
}
