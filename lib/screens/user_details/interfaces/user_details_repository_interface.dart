import 'package:dartz/dartz.dart';
import 'package:negarestan/screens/user_details/usecases/user_details_usecase.dart';
import '../../../../core/error/failures.dart';
import '../../../core/classes/user.dart';
import '../usecases/follow_usecase.dart';
import '../usecases/unfollow_usecase.dart';

abstract class UserDetailsRepositoryInterface {
  Future<Either<Failure, bool>> follow(FollowRequest request);

  Future<Either<Failure, bool>> unfollow(UnFollowRequest request);

  Future<Either<Failure, User>> userDetails(UserDetailsRequest request);
}
