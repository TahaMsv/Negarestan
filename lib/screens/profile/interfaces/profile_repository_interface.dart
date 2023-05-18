import 'package:dartz/dartz.dart';
import 'package:negarestan/screens/profile/usecases/me_usecase.dart';
import '../../../../core/error/failures.dart';
abstract class ProfileRepositoryInterface {
  Future<Either<Failure, dynamic>> me(MeRequest request);

}
