import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../usecases/follow_usecase.dart';
import '../usecases/unfollow_usecase.dart';

abstract class UserDetailsRepositoryInterface {
  Future<Either<Failure, bool>> follow(FollowRequest request);
  Future<Either<Failure, bool>> unfollow(UnFollowRequest request);
}
