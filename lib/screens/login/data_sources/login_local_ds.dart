
import 'package:negarestan/screens/login/usecases/sign_up_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/classes/user.dart';
import '../interfaces/login_data_source_interface.dart';
import '../usecases/login_usecase.dart';
import '../usecases/logout_usecase.dart';

class LoginLocalDataSource implements LoginDataSourceInterface {
  final SharedPreferences? sharedPreferences;

  LoginLocalDataSource({
    this.sharedPreferences,
  });

  @override
  Future<String> login(LoginRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<User> signUp(SignUpRequest request) {
    throw UnimplementedError();
  }
  @override
  Future<bool> logOut(LogOutRequest request) {
    throw UnimplementedError();
  }


}
