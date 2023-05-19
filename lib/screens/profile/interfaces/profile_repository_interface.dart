import 'package:dartz/dartz.dart';
import 'package:negarestan/screens/profile/usecases/me_usecase.dart';
import '../../../../core/error/failures.dart';
import '../../../core/classes/user.dart';
abstract class ProfileRepositoryInterface {
  Future<Either<Failure, User>> me(MeRequest request);

}
