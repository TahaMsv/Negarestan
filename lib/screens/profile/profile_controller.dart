import 'package:negarestan/core/constants/apis.dart';
import 'package:negarestan/screens/login/login_controller.dart';
import 'package:negarestan/screens/login/login_state.dart';
import 'package:negarestan/screens/profile/profile_repository.dart';
import 'package:negarestan/screens/profile/profile_state.dart';
import 'package:negarestan/screens/profile/usecases/me_usecase.dart';

import '../../core/classes/Project.dart';
import '../../core/classes/user.dart';
import '../../core/constants/route_names.dart';
import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import '../../core/utils/failure_handler.dart';
import '../home/home_state.dart';
import 'package:dio/dio.dart';

import '../projects/projects_controller.dart';

class ProfileController extends MainController {
  final ProfileState profileState = getIt<ProfileState>();
  final ProfileRepository profileRepository = getIt<ProfileRepository>();

  late MeUseCase meUseCase = MeUseCase(repository: profileRepository);

  Future<void> me(String token, bool fromLogin) async {
    if (!profileState.isLoading) {
      profileState.setLoading(true);
      try {
        final dio = Dio();
        dio.options.headers["Authorization"] = "Token $token";
        final response = await dio.get(Apis.baseUrl + Apis.me);
        if (response.statusCode == 200) {
          User user = User.fromJson(response.data);
          final HomeState homeState = getIt<HomeState>();
          final LoginController loginController = getIt<LoginController>();
          user.token = token;
          homeState.setUser(user);
          print(user);
          loginController.clearLoginForm();
          if (fromLogin) {
            final ProjectsController projectsController = getIt<ProjectsController>();
            projectsController.fetchSuggestedProjects();
            nav.goToName(RouteNames.projects);
          }
        }
      } catch (ex) {
        profileState.setLoading(false);
      }
    }
    profileState.setLoading(false);
  }

  Future<void> editUser() async {
    final HomeState homeState = getIt<HomeState>();
    String token = homeState.user.token!;
    if (!profileState.isLoading) {
      profileState.setLoading(true);
      try {
        final dio = Dio();
        dio.options.headers["Authorization"] = "Token $token";
        final response = await dio.put(Apis.baseUrl + Apis.me, data: {
          "email": profileState.emailC.text,
          "first_name": profileState.firstNameC.text,
          "last_name": profileState.lastNameC.text,
        });
        if (response.statusCode == 200) {
          User user = User.fromJson(response.data);
          final HomeState homeState = getIt<HomeState>();
          final LoginController loginController = getIt<LoginController>();
          user.token = token;
          homeState.setUser(user);
        }
      } catch (ex) {
        profileState.setLoading(false);
      }
    }
    profileState.setLoading(false);
  }

  void fetchMyProjects() async {
    if (!profileState.loading) {
      profileState.setLoading(true);
      try {
        final dio = Dio();
        final HomeState homeState = getIt<HomeState>();
        String token = homeState.user.token!;
        dio.options.headers["Authorization"] = "Token $token";
        final response = await dio.get(Apis.baseUrl + Apis.getProjects);
        if (response.statusCode == 200) {
          print(response.data);
          profileState.setProjects(List<Project>.from(response.data.map((x) => Project.fromJson(x))));
          print(profileState.projects);
        }
      } catch (e) {
        profileState.setLoading(false);
      }
    }
    profileState.setLoading(false);
  }



  @override
  void onCreate() {}
}
