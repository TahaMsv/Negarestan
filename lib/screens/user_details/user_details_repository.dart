import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:negarestan/screens/user_details/usecases/follow_usecase.dart';
import 'package:negarestan/screens/user_details/usecases/unfollow_usecase.dart';
import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import '../../core/platform/network_info.dart';
import 'data_sources/user_details_remote_ds.dart';
import 'data_sources/user_details_remote_ds.dart';
import 'interfaces/user_details_repository_interface.dart';

class UserDetailsRepository implements UserDetailsRepositoryInterface {
  final UserDetailsRemoteDataSource userDetailsRemoteDataSource;
  final NetworkInfo? networkInfo;
  UserDetailsRepository({required this.userDetailsRemoteDataSource, required this.networkInfo, });

  @override
  Future<Either<Failure, bool>> follow(FollowRequest followRequest) async {
    if (await networkInfo!.isConnected) {
      try {
        bool success = await userDetailsRemoteDataSource.follow(followRequest);
        return Right(success);
      } on AppException catch (e) {
        return Left(ServerFailure.fromAppException(e));
      }
    } else {
      return Left(
        ConnectionFailure.fromAppException(
          ConnectionException(
            message: "You are not connected to internet!",
            trace: StackTrace.fromString("UserDetails repository: login"),
          ),
        ),
      );
      // }
    }
  }

  @override
  Future<Either<Failure, bool>> unfollow(UnFollowRequest request) {
    // TODO: implement unfollow
    throw UnimplementedError();
  }

}
