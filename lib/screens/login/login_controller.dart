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
    // if (!loginState.requesting) {
    //   loginState.setRequesting(true);
    //   final StepsState stepsState = getIt<StepsState>();
    //   username = "test"; //lastNameC.text.trim();
    //   password = "9999999999"; // bookingRefNameC.text.trim();
    //   LoginRequest loginRequest = LoginRequest(
    //     password: password,
    //     username: username,
    //   );
    //   final fOrToken = await loginUseCase(request: loginRequest);
    //
    //   fOrToken.fold((f) => FailureHandler.handle(f, retry: () => login(username: username, password: password)), (token) async {
    //     loginState.setToken(token);
    //     final StepsController stepsController = getIt<StepsController>();
    //     print("at login 35");
    //     await stepsController.addToTravelers(token: token, lastName: username, ticketNumber: password, isLoginRequest: true);
    //     print("at login 37");
    //   });
    //   loginState.setRequesting(false);
    // }
  }

}
