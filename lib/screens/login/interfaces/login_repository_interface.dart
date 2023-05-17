import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../usecases/login_usecase.dart';
import '../usecases/logout_usecase.dart';

import '../usecases/sign_up_usecase.dart';

abstract class LoginRepositoryInterface {
  Future<Either<Failure, String>> login(LoginRequest request);
  Future<Either<Failure, String>> signUp(SignUpRequest request);
  Future<Either<Failure, String>> logOut(LogOutRequest request);
}
