
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/login_data_source_interface.dart';
import '../usecases/login_usecase.dart';

class LoginLocalDataSource implements LoginDataSourceInterface {
  final SharedPreferences? sharedPreferences;

  LoginLocalDataSource({
    this.sharedPreferences,
  });

  @override
  Future<String> login(LoginRequest request) {
    throw UnimplementedError();
  }
}
