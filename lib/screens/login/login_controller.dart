import 'package:negarestan/core/constants/route_names.dart';
import 'package:negarestan/screens/login/usecases/logout_usecase.dart';
import 'package:negarestan/screens/login/usecases/sign_up_usecase.dart';

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

  void logout() async {
    if (!loginState.loginLoading) {
      loginState.setLoginLoading(true);
      LogOutRequest logOutRequest = LogOutRequest();
      final fOrToken = await logOutUseCase(request: logOutRequest);
      fOrToken.fold((f) => FailureHandler.handle(f, retry: () => logout()), (success) async {
        if (success) {}
      });
      loginState.setLoginLoading(false);
    }
  }

  void login({required String username, required String password}) async {
    if (!loginState.loginLoading) {
      print("here18");
      loginState.setLoginLoading(true);
      LoginRequest loginRequest = LoginRequest(
        password: password,
        username: username,
      );
      final fOrToken = await loginUseCase(request: loginRequest);
      print("here25");
      fOrToken.fold((f) => FailureHandler.handle(f, retry: () => login(username: username, password: password)), (token) async {
        loginState.setToken(token);
        print("Token: $token");
        nav.goToName(RouteNames.projects);
      });
      loginState.setLoginLoading(false);
    }
  }

  void signUp({
    required String username,
    required String password,
    required String gender,
    required String firstname,
    required String lastname,
    required String email,
    required String phoneNumber,
    required String country,
    required String city,
    required String bio,
    required List<String> skills,
    required List<String> institutions,
    required String birthDay,
  }) async {
    if (!loginState.loginLoading) {
      loginState.setLoginLoading(true);
      SignUpRequest signUpRequest = SignUpRequest(
        password: password,
        username: username,
        gender: gender,
        firstname: firstname,
        lastname: lastname,
        email: email,
        phoneNumber: phoneNumber,
        country: country,
        city: city,
        bio: bio,
        skills: skills,
        institutions: institutions,
        birthDay: DateTime.parse(birthDay),
      );
      final fOrToken = await signUpUseCase(request: signUpRequest);
      fOrToken.fold(
          (f) => FailureHandler.handle(
                f,
                retry: () => signUp(
                  password: password,
                  username: username,
                  gender: gender,
                  firstname: firstname,
                  lastname: lastname,
                  email: email,
                  phoneNumber: phoneNumber,
                  country: country,
                  city: city,
                  bio: bio,
                  skills: skills,
                  institutions: institutions,
                  birthDay: birthDay,
                ),
              ), (token) async {
        loginState.setToken(token);
        print("Token: $token");
        nav.goToName(RouteNames.projects);
      });
      loginState.setLoginLoading(false);
    }
  }
}
