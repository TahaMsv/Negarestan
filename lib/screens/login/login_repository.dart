import 'package:dartz/dartz.dart';
import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import '../../core/platform/network_info.dart';
import '../../screens/login/interfaces/login_repository_interface.dart';
import 'data_sources/login_local_ds.dart';
import 'data_sources/login_remote_ds.dart';
import 'usecases/login_usecase.dart';

class LoginRepository implements LoginRepositoryInterface {
  final LoginRemoteDataSource loginRemoteDataSource;
  final LoginLocalDataSource loginLocalDataSource;
  final NetworkInfo? networkInfo;

  LoginRepository({required this.loginRemoteDataSource, required this.loginLocalDataSource,
     this.networkInfo
  });

  @override
  Future<Either<Failure, String>> login(LoginRequest loginRequest) async {
    if (await networkInfo!.isConnected) {
      try {
        String token = await loginRemoteDataSource.login(loginRequest);
        return Right(token);
      } on AppException catch (e) {
        return Left(ServerFailure.fromAppException(e));
      }
    } else {
      return Left(
        ConnectionFailure.fromAppException(
          ConnectionException(
            message: "You are not connected to internet!",
            trace: StackTrace.fromString("Login repository: login"),
          ),
        ),
      );
      // }
    }
  }
}
