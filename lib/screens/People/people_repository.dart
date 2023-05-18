import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:negarestan/screens/People/usecases/follow_usecase.dart';
import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import '../../core/platform/network_info.dart';
import 'data_sources/people_remote_ds.dart';
import 'interfaces/people_repository_interface.dart';

class PeopleRepository implements PeopleRepositoryInterface {
  final PeopleRemoteDataSource peopleRemoteDataSource;
  final NetworkInfo? networkInfo;
  PeopleRepository({required this.peopleRemoteDataSource, required this.networkInfo, });

  @override
  Future<Either<Failure, bool>> follow(FollowRequest followRequest) async {
    if (await networkInfo!.isConnected) {
      try {
        bool success = await peopleRemoteDataSource.follow(followRequest);
        return Right(success);
      } on AppException catch (e) {
        return Left(ServerFailure.fromAppException(e));
      }
    } else {
      return Left(
        ConnectionFailure.fromAppException(
          ConnectionException(
            message: "You are not connected to internet!",
            trace: StackTrace.fromString("People repository: login"),
          ),
        ),
      );
      // }
    }
  }

}
