import 'package:dartz/dartz.dart';
import '../../../core/classes/user.dart';
import '../../../core/error/failures.dart';

import '../../../core/interfaces/request.dart';
import '../../../core/interfaces/usecase.dart';
import '../user_details_repository.dart';

class UserDetailsUseCase extends UseCase<User, UserDetailsRequest> {
  final UserDetailsRepository repository;

  UserDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> call({required UserDetailsRequest request}) {
    return repository.userDetails(request);
  }
}

class UserDetailsRequest extends Request {
  UserDetailsRequest({required this.userID});

  final String userID;

  @override
  Map<String, dynamic> toJson() => {};
}
