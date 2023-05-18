import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:negarestan/screens/profile/usecases/me_usecase.dart';
import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import '../../core/platform/network_info.dart';
import 'data_sources/profile_remote_ds.dart';
import 'interfaces/profile_repository_interface.dart';

class ProfileRepository implements ProfileRepositoryInterface {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final NetworkInfo? networkInfo;

  ProfileRepository({required this.profileRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, dynamic>> me(MeRequest request) async {
    if (await networkInfo!.isConnected) {
      try {
        dynamic body = await profileRemoteDataSource.me(request);
        return Right(body);
      } on AppException catch (e) {
        return Left(ServerFailure.fromAppException(e));
      }
    } else {
      return Left(
        ConnectionFailure.fromAppException(
          ConnectionException(
            message: "You are not connected to internet!",
            trace: StackTrace.fromString("Profile repository: login"),
          ),
        ),
      );
      // }
    }
  }
}
