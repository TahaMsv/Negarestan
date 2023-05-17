import 'package:dartz/dartz.dart';
import 'package:negarestan/screens/People/usecases/follow_usecase.dart';
import '../../../../core/error/failures.dart';

abstract class PeopleRepositoryInterface {
  Future<Either<Failure, String>> follow(FollowRequest request);
}
