import '../usecases/login_usecase.dart';
import '../usecases/sign_up_usecase.dart';

abstract class LoginDataSourceInterface {
  Future<String> login(LoginRequest request);
  Future<String> signUp(SignUpRequest request);
}
