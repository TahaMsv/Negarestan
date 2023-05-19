import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../core/classes/user.dart';
import '../usecases/login_usecase.dart';
import '../usecases/logout_usecase.dart';
import '../usecases/sign_up_usecase.dart';

abstract class LoginRepositoryInterface {
  Future<Either<Failure, String>> login(LoginRequest request);
  Future<Either<Failure, User>> signUp(SignUpRequest request);
  Future<Either<Failure, bool>> logOut(LogOutRequest request);
}
