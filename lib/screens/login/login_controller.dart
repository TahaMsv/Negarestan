import 'package:negarestan/core/constants/route_names.dart';

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
}
