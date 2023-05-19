import 'package:negarestan/core/classes/user.dart';
import 'package:negarestan/screens/login/usecases/logout_usecase.dart';

import '../usecases/login_usecase.dart';
import '../usecases/sign_up_usecase.dart';

abstract class LoginDataSourceInterface {
  Future<String> login(LoginRequest request);
  Future<User> signUp(SignUpRequest request);
  Future<bool> logOut(LogOutRequest request);
}
