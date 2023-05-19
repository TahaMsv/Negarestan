import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';

import '../../../core/interfaces/request.dart';
import '../../../core/interfaces/usecase.dart';
import '../user_details_repository.dart';

class UnFollowUseCase extends UseCase<bool, UnFollowRequest> {
  final UserDetailsRepository repository;

  UnFollowUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call({required UnFollowRequest request}) {
    return repository.unfollow(request);
  }
}

class UnFollowRequest extends Request {
  UnFollowRequest({
    required this.userId,
  });

  final String userId;

  @override
  Map<String, dynamic> toJson() => {
        "user_id": userId,
      };
}
