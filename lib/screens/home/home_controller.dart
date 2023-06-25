import 'package:dio/dio.dart';
import 'package:negarestan/core/constants/route_names.dart';
import 'package:negarestan/screens/profile/profile_controller.dart';

import '../../core/classes/user.dart';
import '../../core/constants/apis.dart';
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

  Future<List<User>> fetchSuggestedUsers(String query) async {
    if (!homeState.loading) {
      homeState.setLoading(true);
      try {
        final dio = Dio();
        String token = homeState.user.token!;
        dio.options.headers["Authorization"] = "Token $token";
        final response = await dio.get(
          Apis.baseUrl + Apis.search,
          queryParameters: {'type': 'name', 'query': query},
        );
        if (response.statusCode == 200) {
          List<User> users = List<User>.from(response.data.map((x) => User.fromJson(x)));
          return users;
        }
      } catch (e) {
        homeState.setLoading(false);
      }
    }
    homeState.setLoading(false);
    return [];
  }

  @override
  void onCreate() {}
}
