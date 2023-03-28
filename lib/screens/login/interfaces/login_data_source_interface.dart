import '../usecases/login_usecase.dart';

abstract class LoginDataSourceInterface {
  Future<String> login(LoginRequest request);
}
