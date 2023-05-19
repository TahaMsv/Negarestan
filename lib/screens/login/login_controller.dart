import 'package:dio/dio.dart';
import 'package:negarestan/core/constants/route_names.dart';
import 'package:negarestan/screens/home/home_state.dart';
import 'package:negarestan/screens/login/usecases/logout_usecase.dart';
import 'package:negarestan/screens/login/usecases/sign_up_usecase.dart';
import 'package:negarestan/screens/profile/profile_controller.dart';
import 'package:negarestan/screens/profile/profile_repository.dart';
import 'package:negarestan/screens/profile/usecases/me_usecase.dart';
import 'package:network_manager/network_manager.dart';

import '../../core/constants/apis.dart';
import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import '../../core/utils/failure_handler.dart';
import '../../screens/login/login_repository.dart';
import 'usecases/login_usecase.dart';
import 'login_state.dart';

class LoginController extends MainController {
  final LoginState loginState = getIt<LoginState>();
  final LoginRepository loginRepository = getIt<LoginRepository>();

  late LoginUseCase loginUseCase = LoginUseCase(repository: loginRepository);
  late SignUpUseCase signUpUseCase = SignUpUseCase(repository: loginRepository);
  late LogOutUseCase logOutUseCase = LogOutUseCase(repository: loginRepository);

  // void logout() async {
  //   if (!loginState.loginLoading) {
  //     loginState.setLoginLoading(true);
  //     LogOutRequest logOutRequest = LogOutRequest();
  //     print("here25");
  //     final fOrToken = await logOutUseCase(request: logOutRequest);
  //     print("here27");
  //     fOrToken.fold((f) => FailureHandler.handle(f, retry: () => logout()), (success) async {
  //       print("here29");
  //       if (success) {
  //         print("here31");
  //         nav.pushNamed(RouteNames.login);
  //       } else {
  //         // nav.pop()
  //       }
  //     });
  //     loginState.setLoginLoading(false);
  //   }
  // }
  void logout() async {
    if (!loginState.loginLoading) {
      loginState.setLoginLoading(true);
      final dio = Dio();
      String token = loginState.token;
      dio.options.headers["Authorization"] = "Token $token";
      final response = await dio.post(
        Apis.baseUrl + Apis.logout,
        queryParameters: {"username": "", "password": ""},
      );
      if (response.statusCode == 200) {
        nav.goToName(RouteNames.login);
      }
    }
    loginState.setLoginLoading(false);
  }

  void login() async {
    bool isSuccess = false;
    if (!loginState.loginLoading) {
      String username = loginState.usernameC.text;
      String password = loginState.passwordC.text;

      loginState.setLoginLoading(true);
      LoginRequest loginRequest = LoginRequest(
        password: password,
        username: username,
      );
      final fOrToken = await loginUseCase(request: loginRequest);
      fOrToken.fold((f) => FailureHandler.handle(f, retry: () => login()), (token) async {
        loginState.setToken(token);
        print("Token: $token");
        await NetworkOption.setAccessToken(token);
        isSuccess = true;
        final ProfileController profileController = getIt<ProfileController>();
        profileController.me(token);
      });

      if (isSuccess) {}
      loginState.setLoginLoading(false);
    }
  }

  void clearLoginForm() {
    loginState.usernameC.clear();
    loginState.passwordC.clear();
  }

  void clearSignUpForm() {
    loginState.emailC.clear();
    loginState.usernameC.clear();
    loginState.firstnameC.clear();
    loginState.lastnameC.clear();
    loginState.passwordC.clear();
    loginState.yearC.clear();
    loginState.monthC.clear();
    loginState.dayC.clear();
  }

  void signUp() async {
    if (!loginState.loginLoading) {
      loginState.setLoginLoading(true);
      String email = loginState.emailC.text;
      String username = loginState.usernameC.text;
      String firstname = loginState.firstnameC.text;
      String lastname = loginState.lastnameC.text;
      String password = loginState.passwordC.text;
      String year = loginState.yearC.text;
      String month = loginState.monthC.text;
      String day = loginState.dayC.text;
      String date = "$year-$month-$day";

      SignUpRequest signUpRequest = SignUpRequest(
        password: password,
        username: username,
        gender: "M",
        firstname: firstname,
        lastname: lastname,
        email: email,
        phoneNumber: "09123456789",
        country: "IRN",
        city: "Sari",
        bio: "This is My bio ;))))",
        skills: [],
        institutions: [],
        birthDay: DateTime.parse(date),
      );
      final fOrToken = await signUpUseCase(request: signUpRequest);
      print("here86");
      fOrToken.fold(
          (f) => FailureHandler.handle(
                f,
                retry: () => signUp(),
              ), (user) async {
        loginState.setToken(user.token!);
        NetworkOption.setAccessToken(user.token!);
        final HomeState homeState = getIt<HomeState>();
        homeState.setUser(user);
        clearSignUpForm();
        nav.goToName(RouteNames.projects);
      });
      loginState.setLoginLoading(false);
    }
  }
}
