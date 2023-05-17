import '../../../core/constants/apis.dart';
import '../../../core/error/exception.dart';
import '../../../screens/login/interfaces/login_data_source_interface.dart';
import 'package:network_manager/network_manager.dart';
import '../usecases/login_usecase.dart';
import '../usecases/sign_up_usecase.dart';
import 'login_local_ds.dart';

class LoginRemoteDataSource implements LoginDataSourceInterface {
  final LoginLocalDataSource localDataSource;

  LoginRemoteDataSource(this.localDataSource);

  @override
  Future<String> login(LoginRequest request) async {
    NetworkRequest loginNR = NetworkRequest(api: Apis.baseUrl + Apis.login, data: request.toJson(), timeOut: const Duration(seconds: 15));
    NetworkResponse loginResponse = await loginNR.post();
    if (loginResponse.responseStatus) {
      try {
        return loginResponse.responseBody["Body"]["Token"];
      } catch (e, trace) {
        throw ParseException(message: e.toString(), trace: trace);
      }
    } else {
      throw ServerException(
        code: loginResponse.responseCode,
        message: loginResponse.extractedMessage!,
        trace: StackTrace.fromString("LoginRemoteDataSource.login"),
      );
    }
  }

  @override
  Future<String> signUp(SignUpRequest request) async {
    NetworkRequest signUpNR = NetworkRequest(api: Apis.baseUrl + Apis.signup, data: request.toJson(), timeOut: const Duration(seconds: 15));
    NetworkResponse signUpResponse = await signUpNR.post();
    if (signUpResponse.responseStatus) {
      try {
        return signUpResponse.responseBody["Body"]["Token"];
      } catch (e, trace) {
        throw ParseException(message: e.toString(), trace: trace);
      }
    } else {
      throw ServerException(
        code: signUpResponse.responseCode,
        message: signUpResponse.extractedMessage!,
        trace: StackTrace.fromString("LoginRemoteDataSource.login"),
      );
    }
  }
}
