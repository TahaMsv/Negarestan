import 'package:negarestan/core/constants/apis.dart';
import 'package:negarestan/screens/login/login_controller.dart';
import 'package:negarestan/screens/login/login_state.dart';
import 'package:negarestan/screens/profile/profile_repository.dart';
import 'package:negarestan/screens/profile/profile_state.dart';
import 'package:negarestan/screens/profile/usecases/me_usecase.dart';

import '../../core/classes/user.dart';
import '../../core/constants/route_names.dart';
import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import '../../core/utils/failure_handler.dart';
import '../home/home_state.dart';
import 'package:dio/dio.dart';

class ProfileController extends MainController {
  final ProfileState profileState = getIt<ProfileState>();
  final ProfileRepository profileRepository = getIt<ProfileRepository>();

  late MeUseCase meUseCase = MeUseCase(repository: profileRepository);

  // void me() async {
  //   if (!profileState.isLoading) {
  //     profileState.setIsLoading(true);
  //     MeRequest meRequest = MeRequest();
  //     final fOrMe = await meUseCase(request: meRequest);
  //     print("here65");
  //     fOrMe.fold((f) => FailureHandler.handle(f, retry: () => me()), (user) async {
  //       final HomeState homeState = getIt<HomeState>();
  //       homeState.setUser(user);
  //       nav.goToName(RouteNames.projects);
  //     });
  //   }
  //   profileState.setIsLoading(false);
  // }

  void me(String token, bool fromLogin) async {
    if (!profileState.isLoading) {
      profileState.setIsLoading(true);
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
            nav.goToName(RouteNames.projects);
          }
        }
      } catch (ex) {
        profileState.setIsLoading(false);
      }
    }
    profileState.setIsLoading(false);
  }

  Future<void> editUser() async {
    final HomeState homeState = getIt<HomeState>();
    String token = homeState.user.token!;
    print("Here 66");
    if (!profileState.isLoading) {
      print("Here 68");
      profileState.setIsLoading(true);
      try {
        print("Here 71");
        final dio = Dio();
        dio.options.headers["Authorization"] = "Token $token";
        final response = await dio.put(Apis.baseUrl + Apis.me, data: {
          "email": profileState.emailC.text,
          "first_name": profileState.firstNameC.text,
          "last_name": profileState.lastNameC.text,
        });
        print("Here 79");
        if (response.statusCode == 200) {
          print("Here 81");
          User user = User.fromJson(response.data);
          final HomeState homeState = getIt<HomeState>();
          final LoginController loginController = getIt<LoginController>();
          user.token = token;
          homeState.setUser(user);
        }
      } catch (ex) {
        profileState.setIsLoading(false);
      }
    }
    profileState.setIsLoading(false);
  }

  @override
  void onCreate() {}
}
